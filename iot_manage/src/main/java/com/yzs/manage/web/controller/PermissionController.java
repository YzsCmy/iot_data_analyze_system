package com.yzs.manage.web.controller;

import com.github.pagehelper.PageInfo;
import com.yzs.common.model.Permission;
import com.yzs.manage.service.IPermissionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
@RequestMapping("/permission")
public class PermissionController {
    @Autowired
    private IPermissionService permissionService;


    @RequestMapping("/findAll.do")
    @PreAuthorize("hasRole('ROOT')")
    public ModelAndView findAll(@RequestParam(name = "page",required = true,defaultValue = "1")Integer page,
                                @RequestParam(name = "size",required = true, defaultValue = "5")Integer size){
        ModelAndView view = new ModelAndView();
        List<Permission> all = permissionService.findAll(page,size);
        PageInfo pageInfo = new PageInfo(all);
        view.addObject("pageInfo",pageInfo);
        view.setViewName("permission-list");
        return view;
    }

    @RequestMapping("/save.do")
    public String save(Permission permission){
        permissionService.save(permission);
        return "redirect:findAll.do";
    }
}
