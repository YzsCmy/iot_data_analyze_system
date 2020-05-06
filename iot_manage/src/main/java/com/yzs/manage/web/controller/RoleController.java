package com.yzs.manage.web.controller;

import com.github.pagehelper.PageInfo;
import com.yzs.common.model.Permission;
import com.yzs.common.model.Role;
import com.yzs.manage.service.IPermissionService;
import com.yzs.manage.service.IRoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
@RequestMapping("/role")
public class RoleController {

    @Autowired
    private IRoleService roleService;
    @Autowired
    private IPermissionService permissionService;

    @RequestMapping("/addPermissionToRole.do")
    public String addPermissionToRole(String roleId, String[] ids){

        roleService.addPermissionToRole(roleId,ids);
        return "redirect:findAll.do";
    }

    @RequestMapping("/findRoleByIdAndAllPermission.do")
    public ModelAndView findRoleByIdAndAllPermission(String id){
        ModelAndView mv = new ModelAndView();
        List<Permission> perList = permissionService.findOtherPermissions(id);
        mv.addObject("permissionList",perList);
        mv.addObject("roleId",id);
        mv.setViewName("role-permission-add");
        return mv;
    }


    @RequestMapping("/findAll.do")
    @PreAuthorize("hasRole('ROOT')")
    public ModelAndView findAll(@RequestParam(name = "page",required = true,defaultValue = "1")Integer page,
                                @RequestParam(name = "size",required = true, defaultValue = "5")Integer size){
        ModelAndView view = new ModelAndView();
        List<Role> all = roleService.findAll(page,size);
        PageInfo pageInfo = new PageInfo(all);
        view.addObject("pageInfo",pageInfo);
        view.setViewName("role-list");
        return view;
    }

    @RequestMapping("/save.do")
    public String save(Role role){
        roleService.save(role);
        return "redirect:findAll.do";
    }

    @RequestMapping("/findById.do")
    public ModelAndView save(String id){
        ModelAndView mv = new ModelAndView();
        Role role = roleService.findById(id);
        mv.addObject("role",role);
        mv.setViewName("role-show");
        return mv;
    }
}
