package com.yzs.manage.web.controller.chart;

import com.yzs.common.model.Device;
import com.yzs.common.utils.DateUtils;
import com.yzs.common.vo.Result;
import com.yzs.common.vo.StatusCode;
import com.yzs.manage.service.IDeviceDataService;
import com.yzs.manage.service.IDeviceService;
import com.yzs.manage.service.IDeviceTypeService;
import com.yzs.manage.web.vo.LineChartVo;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.Date;
import java.util.HashMap;

@RestController
@RequestMapping("/chart/deviceData")
public class DeviceDataChartController {

    @Autowired
    private IDeviceDataService deviceDataService;
    @Autowired
    private IDeviceTypeService typeService;
    @Autowired
    private IDeviceService deviceService;
    @RequestMapping("/data.do")
    public Result data(@RequestParam(value = "date",defaultValue = "") String date, String id){

        if(StringUtils.isBlank(date)){
            date = DateUtils.date2string(new Date(),"yyyy-MM-dd");
        }
        LineChartVo chartVo = deviceDataService.chartData(date,id);
        return new Result(true, StatusCode.OK,"获取折线图数据成功",chartVo);

    }
    @RequestMapping("/dataValue.do")
    public Result dataValue(@RequestParam(value = "date",defaultValue = "") String date, String id){

        if(StringUtils.isBlank(date)){
            date = DateUtils.date2string(new Date(),"yyyy-MM-dd");
        }
        LineChartVo chartVo = deviceDataService.chartDataValue(date,id);
        //获取设备单位
        Device device = deviceService.findById(id);
        String unit = typeService.findUnitByDeviceTypeId(device.getTypeId());
        HashMap<String, Object> map = new HashMap<>();
        map.put("chartVo",chartVo);
        map.put("unit",unit==null?"":unit);
        return new Result(true, StatusCode.OK,"获取折线图数据成功",map);

    }
}
