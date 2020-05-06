package com.yzs.manage.web.controller;

import com.github.pagehelper.PageInfo;
import com.yzs.common.model.SysLog;
import com.yzs.manage.service.ISysLogService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
@RequestMapping("/sysLog")
public class SysLogController {

    @Autowired
    private ISysLogService logService;

    @RequestMapping("/findAll.do")
    @PreAuthorize("hasRole('ROOT')")
    public ModelAndView findAll(@RequestParam(name = "page",required = true,defaultValue = "1")Integer page,
                                @RequestParam(name = "size",required = true, defaultValue = "5")Integer size,
                                @RequestParam(name = "name",defaultValue = "") String name){
        ModelAndView mv = new ModelAndView();
        List<SysLog> logList = logService.findAll(page,size,name);
        PageInfo pageInfo = new PageInfo(logList);
        mv.addObject("pageInfo",pageInfo);
        mv.addObject("query",name);
        mv.setViewName("syslog-list");
        return mv;
    }
}
