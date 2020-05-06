package com.yzs.manage.web.controller.chart;

import com.yzs.common.vo.Result;
import com.yzs.common.vo.StatusCode;
import com.yzs.manage.service.IUnitService;
import com.yzs.manage.web.vo.LineChartVo;
import com.yzs.manage.web.vo.PieVo;
import com.yzs.manage.web.vo.UnitShowVo;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/chart/unit")
public class UnitChartController {
    @Autowired
    private IUnitService unitService;
    @RequestMapping("/user.do")
    public Result user(){
        List<PieVo> pieVo = unitService.userPie();
        return new Result(true, StatusCode.OK,"获取饼图数据成功",pieVo);
    }
    @RequestMapping("/device.do")
    public Result device(){
        List<PieVo> pieVo = unitService.devicePie();
        return new Result(true, StatusCode.OK,"获取饼图数据成功",pieVo);
    }
    @RequestMapping("/data.do")
    public Result data(@RequestParam(value = "unitId",defaultValue = "")String unitId){
        LineChartVo chartVo;
        if(StringUtils.isBlank(unitId)){
            chartVo = unitService.chartDataAllUnit();
        }else {
            chartVo = unitService.chartDataInUnit(unitId);
        }
        return new Result(true, StatusCode.OK,"获取折线图数据成功",chartVo);
    }

    @RequestMapping("/unitInfo.do")
    public Result unitInfo(String unitId){
        UnitShowVo unitInfo = unitService.countByUnitId(unitId);
        return new Result(true, StatusCode.OK,"获取单元数据成功",unitInfo);
    }
}
