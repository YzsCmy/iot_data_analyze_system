package com.yzs.manage.web.controller.chart;

import com.yzs.common.vo.Result;
import com.yzs.common.vo.StatusCode;
import com.yzs.manage.service.IMeasurePointService;
import com.yzs.manage.service.IUnitService;
import com.yzs.manage.web.vo.LineChartVo;
import com.yzs.manage.web.vo.PieVo;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/chart/meas")
public class MeasurePointChartController {
    @Autowired
    private IUnitService unitService;
    @Autowired
    private IMeasurePointService measurePointService;
    @RequestMapping("/measNum.do")
    public Result measNum(){
        List<PieVo> pieVo = unitService.measPie();
        return new Result(true, StatusCode.OK,"获取饼图数据成功",pieVo);
    }
    @RequestMapping("/measDataAllUnit.do")
    public Result measDataAllUnit(){
        List<PieVo> pieVo = measurePointService.measDataAllUnitPie();
        return new Result(true, StatusCode.OK,"获取饼图数据成功",pieVo);
    }
    @RequestMapping("/measDataInUnit.do")
    public Result measDataInUnit(String unitId){
        List<PieVo> pieVo = measurePointService.measDataInUnitPie(unitId);
        return new Result(true, StatusCode.OK,"获取饼图数据成功",pieVo);
    }
    @RequestMapping("/device.do")
    public Result device(String unitId){
        List<PieVo> pieVo = measurePointService.devicePie(unitId);
        return new Result(true, StatusCode.OK,"获取饼图数据成功",pieVo);
    }
    @RequestMapping("/data.do")
    public Result data(@RequestParam(value = "unitId",defaultValue = "")String unitId){
        LineChartVo chartVo;
        if(StringUtils.isBlank(unitId)){
            chartVo = measurePointService.chartDataAllUnit();
        }else {
            chartVo = measurePointService.chartDataInUnit(unitId);
        }
        return new Result(true, StatusCode.OK,"获取折线图数据成功",chartVo);
    }


}
