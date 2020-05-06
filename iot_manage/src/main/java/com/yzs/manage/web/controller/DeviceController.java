package com.yzs.manage.web.controller;

import com.github.pagehelper.PageInfo;
import com.yzs.common.model.Device;
import com.yzs.common.model.DeviceType;
import com.yzs.common.model.Unit;
import com.yzs.common.vo.Result;
import com.yzs.common.vo.StatusCode;
import com.yzs.manage.service.IDeviceService;
import com.yzs.manage.service.IDeviceTypeService;
import com.yzs.manage.service.IUnitService;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.List;

@Controller
@RequestMapping("/device")
public class DeviceController {


    @Autowired
    private IDeviceService deviceService;
    @Autowired
    private IUnitService unitService;
    @Autowired
    private IDeviceTypeService deviceTypeService;

    @RequestMapping("/findAll.do")
    //@PreAuthorize("hasRole('ROOT')")
    public ModelAndView findAll(@RequestParam(name = "page",required = true,defaultValue = "1")Integer page,
                                @RequestParam(name = "size",required = true, defaultValue = "5")Integer size,
                                @RequestParam(name = "name",defaultValue = "") String name){
        HttpServletRequest request = ((ServletRequestAttributes)(RequestContextHolder.currentRequestAttributes())).getRequest();
        String unitId = (String) request.getSession().getAttribute("unitId");
        ModelAndView mv = new ModelAndView();
        List<Device> all = null;
        if(StringUtils.isNotBlank(unitId)){
            all = deviceService.findAllInUnit(page, size, unitId, null, name);
        }else {

            all = deviceService.findAll(page,size,null,name);
        }
        PageInfo pageInfo = new PageInfo(all);
        mv.addObject("pageInfo",pageInfo);
        mv.addObject("query",name);
        mv.setViewName("device-list");
        return mv;
    }
    @RequestMapping("/findAllInUnit.do")
    //@PreAuthorize("hasRole('ROOT')")
    public ModelAndView findAllInUnit(@RequestParam(name = "page",required = true,defaultValue = "1")Integer page,
                                @RequestParam(name = "size",required = true, defaultValue = "5")Integer size,
                                      String unitId,
                                      @RequestParam(name = "name",defaultValue = "") String name){
        ModelAndView mv = new ModelAndView();
        List<Device> all = deviceService.findAllInUnit(page, size, unitId, null, name);
        PageInfo pageInfo = new PageInfo(all);
        mv.addObject("pageInfo",pageInfo);
        mv.addObject("query",name);
        mv.setViewName("device-list");
        return mv;
    }
    @RequestMapping("/save.do")
    @ResponseBody
    public Result save(Device info){
        deviceService.save(info);
        return new Result(true, StatusCode.OK,"保存成功");
    }

    @RequestMapping("/addDevice.do")
    public String toSave(){

        HttpServletRequest request = ((ServletRequestAttributes)(RequestContextHolder.currentRequestAttributes())).getRequest();
        String unitId = (String) request.getSession().getAttribute("unitId");
        //设备类型
        List<DeviceType> all = deviceTypeService.findAll();
        HashMap<String, String> typeMap = new HashMap<>();
        for (DeviceType deviceType : all) {
            typeMap.put(deviceType.getId(),deviceType.getName());
        }
        request.setAttribute("typeMap",typeMap);
        //单元
        if (StringUtils.isBlank(unitId)){
            HashMap<String, String> map = new HashMap<>();
            List<Unit> units = unitService.findAllUnit();
            for (Unit unit : units) {
                map.put(unit.getId(),unit.getName());
            }
            request.setAttribute("isRootAdd",true);
            request.setAttribute("unitMap",map);
        }
        return "device-add";
    }

    @RequestMapping("/findByUnitIdAndTypeId.do")
    public ModelAndView findByUnitIdAndTypeId(@RequestParam(name = "unitId",defaultValue = "")String unitId,
                                 @RequestParam(name = "typeId",defaultValue = "")String typeId){
        ModelAndView mv = new ModelAndView();
        List<Device> list = null;
        if(StringUtils.isNotBlank(unitId)){
            list = deviceService.findAllInUnit(unitId, typeId, null);
        }else {
            list = deviceService.findAllInUnit(null,typeId,null);
        }
        PageInfo pageInfo = new PageInfo(list);
        mv.addObject("pageInfo",pageInfo);
        mv.setViewName("device-list");
        return mv;
    }
    @RequestMapping("/edit.do")
    public ModelAndView edit(String id){
        ModelAndView mv = new ModelAndView();
        Device info = deviceService.findById(id);
        mv.addObject("device",info);
        mv.addObject("isEdit",true);
        mv.setViewName("device-add");
        return mv;
    }
    @RequestMapping("/update.do")
    @ResponseBody
    public Result update(Device device){
        deviceService.update(device);
        return new Result(true, StatusCode.OK,"保存成功");
    }

    @RequestMapping("/select.do")
    @ResponseBody
    public Result select(String pointId){
        List<Device> all = deviceService.findByPointId(pointId);
        return new Result(true,StatusCode.OK,"查询成功",all);
    }

}
