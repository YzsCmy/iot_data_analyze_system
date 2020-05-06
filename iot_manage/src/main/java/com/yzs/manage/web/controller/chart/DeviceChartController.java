package com.yzs.manage.web.controller.chart;

import com.yzs.common.vo.Result;
import com.yzs.common.vo.StatusCode;
import com.yzs.manage.service.IDeviceService;
import com.yzs.manage.web.vo.LineChartVo;
import com.yzs.manage.web.vo.PieVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/chart/device")
public class DeviceChartController {

    @Autowired
    private IDeviceService deviceService;

    @RequestMapping("/device.do")
    public Result device(){
        List<PieVo> pieVo = deviceService.devicePie();
        return new Result(true, StatusCode.OK,"获取饼图数据成功",pieVo);
    }
    @RequestMapping("/deviceData.do")
    public Result deviceData(){
        List<PieVo> pieVo = deviceService.deviceDataPie();
        return new Result(true, StatusCode.OK,"获取饼图数据成功",pieVo);
    }
    @RequestMapping("/deviceInUnit.do")
    public Result deviceInUnit(String unitId){
        List<PieVo> pieVo = deviceService.deviceInUnitPie(unitId);
        return new Result(true, StatusCode.OK,"获取饼图数据成功",pieVo);
    }
    @RequestMapping("/deviceDataInUnit.do")
    public Result deviceDataInUnit(String unitId){
        List<PieVo> pieVo = deviceService.deviceDataInUnitPie(unitId);
        return new Result(true, StatusCode.OK,"获取饼图数据成功",pieVo);
    }
    @RequestMapping("/dataPerType.do")
    public Result data(){
        LineChartVo chartVo = deviceService.chartDataAllType();
        return new Result(true, StatusCode.OK,"获取折线图数据成功",chartVo);
    }
    @RequestMapping("/data.do")
    public Result data(String unitId){
        LineChartVo chartVo = deviceService.chartDataInUnit(unitId);
        return new Result(true, StatusCode.OK,"获取折线图数据成功",chartVo);
    }
}
