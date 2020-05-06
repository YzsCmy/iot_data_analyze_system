package com.yzs.manage.web.controller;

import com.github.pagehelper.PageInfo;
import com.yzs.common.model.DeviceData;
import com.yzs.manage.service.IDeviceDataService;
import com.yzs.manage.service.IDeviceTypeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
@RequestMapping("/deviceData")
public class DeviceDataController {


    //@Autowired
    //private IDeviceService deviceService;
    @Autowired
    private IDeviceDataService deviceDataService;
    @Autowired
    private IDeviceTypeService deviceTypeService;

    //@Autowired
    //private IUnitService unitService;
    //@Autowired
    //private IDeviceTypeService deviceTypeService;

    @RequestMapping("/findAll.do")
    //@PreAuthorize("hasRole('ROOT')")
    public ModelAndView findAll(@RequestParam(name = "page",required = true,defaultValue = "1")Integer page,
                                @RequestParam(name = "size",required = true, defaultValue = "5")Integer size,
                                String deviceId){
        ModelAndView mv = new ModelAndView();
        List<DeviceData> list = deviceDataService.findByDeviceId(page, size, deviceId);
        if(list!=null&&list.size()>0){
            String typeId = list.get(0).getTypeId();
            String unit = deviceTypeService.findUnitByDeviceTypeId(typeId);

            mv.addObject("unit",unit);
        }
        PageInfo pageInfo = new PageInfo(list);
        mv.addObject("pageInfo",pageInfo);
        mv.addObject("deviceId",deviceId);
        mv.setViewName("devicedata-list");
        return mv;
    }



}
