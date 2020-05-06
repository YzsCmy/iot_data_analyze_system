package com.yzs.manage.web.controller;

import com.yzs.common.model.DeviceType;
import com.yzs.common.vo.Result;
import com.yzs.common.vo.StatusCode;
import com.yzs.manage.service.IDeviceTypeService;
import com.yzs.manage.web.vo.DeviceTypeVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
@RequestMapping("/deviceType")
public class DeviceTypeController {


    @Autowired
    private IDeviceTypeService deviceTypeService;


    @RequestMapping("/findAll.do")
    public ModelAndView findAll(){
        HttpServletRequest request = ((ServletRequestAttributes)(RequestContextHolder.currentRequestAttributes())).getRequest();
        String unitId = (String) request.getSession().getAttribute("unitId");
        ModelAndView mv = new ModelAndView();
        List<DeviceTypeVo> all = deviceTypeService.findAll(unitId);
        mv.addObject("list",all);
        mv.setViewName("devicetype-list");
        return mv;
    }
    @RequestMapping("/save.do")
    @ResponseBody
    public Result save(DeviceType info){
        deviceTypeService.save(info);
        return new Result(true, StatusCode.OK,"保存成功");
    }

}
