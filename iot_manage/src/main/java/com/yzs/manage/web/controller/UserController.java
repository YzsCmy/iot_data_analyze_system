package com.yzs.manage.web.controller;

import com.github.pagehelper.PageInfo;
import com.yzs.common.model.Role;
import com.yzs.common.model.Unit;
import com.yzs.common.model.User;
import com.yzs.common.vo.Result;
import com.yzs.common.vo.StatusCode;
import com.yzs.manage.service.IRoleService;
import com.yzs.manage.service.IUnitService;
import com.yzs.manage.service.IUserService;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
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
import java.util.stream.Collectors;

@Controller
@RequestMapping("/user")
public class UserController {

    @Autowired
    private IUserService userService;
    @Autowired
    private IRoleService roleService;
    @Autowired
    private IUnitService unitService;

    @RequestMapping("/addRoleToUser.do")
    public String addRoleToUser(String userId, String[] ids){

        userService.addRoleToUser(userId,ids);
        return "redirect:findAll.do";
    }

    //查找可分配角色
    @RequestMapping("/findUserByIdAndAllRole.do")
    public ModelAndView findUserByIdAndAllRole(String id){
        ModelAndView mv = new ModelAndView();
        List<Role> roleList = roleService.findOtherRoles(id);
        HttpServletRequest request = ((ServletRequestAttributes)(RequestContextHolder.currentRequestAttributes())).getRequest();
        String unitId = (String) request.getSession().getAttribute("unitId");
        if (StringUtils.isNotBlank(unitId)) {
            //对非ROOT角色的当前用户过滤ROOT角色
            roleList = roleList
                    .stream().filter(
                            role -> !role.getName().equals("ROOT")
                                    )
                    .collect(Collectors.toList());
        }
        //ADMIN角色单独处理
        roleList = roleList
                .stream().filter(
                        role -> !role.getName().equals("ADMIN")
                                )
                .collect(Collectors.toList());

        mv.addObject("roleList",roleList);
        mv.addObject("userId",id);
        mv.setViewName("user-role-add");
        return mv;
    }

    @RequestMapping("/findAll.do")
    @PreAuthorize("hasRole('ROOT')  or hasRole('ADMIN')")
    public ModelAndView findAll(@RequestParam(name = "page",required = true,defaultValue = "1")Integer page,
                                @RequestParam(name = "size",required = true, defaultValue = "5")Integer size,
                                @RequestParam(name = "name",defaultValue = "") String name){
        ModelAndView mv = new ModelAndView();

        HttpServletRequest request = ((ServletRequestAttributes)(RequestContextHolder.currentRequestAttributes())).getRequest();
        String unitId = (String) request.getSession().getAttribute("unitId");
        List<User> all = null;
        if(StringUtils.isBlank(unitId)){

            all = userService.findAll(page,size,name);
        }else {
            all = userService.findAllInUnit(page,size,unitId,name);

        }
        PageInfo pageInfo = new PageInfo(all);
        mv.addObject("pageInfo",pageInfo);
        mv.addObject("query",name);
        mv.setViewName("user-list");
        return mv;
    }
    @RequestMapping("/findAllInUnit.do")
    @PreAuthorize("hasRole('ADMIN')")
    public ModelAndView findAllInUnit(@RequestParam(name = "page",required = true,defaultValue = "1")Integer page,
                                @RequestParam(name = "size",required = true, defaultValue = "5")Integer size,
                                      @RequestParam(name = "unitId",defaultValue = "")String unitId,
                                      @RequestParam(name = "name",defaultValue = "") String name){
        ModelAndView mv = new ModelAndView();
        List<User> all = userService.findAllInUnit(page,size,unitId,name);
        PageInfo pageInfo = new PageInfo(all);
        mv.addObject("pageInfo",pageInfo);
        mv.addObject("query",name);
        mv.setViewName("user-list");
        return mv;
    }


    @RequestMapping("/save.do")
    @ResponseBody
    public Result save(User info){
        userService.save(info);
        return new Result(true, StatusCode.OK,"保存成功");
    }

    @RequestMapping("/addUser.do")
    public String toSave(){
        HttpServletRequest request = ((ServletRequestAttributes)(RequestContextHolder.currentRequestAttributes())).getRequest();
        String unitId = (String) request.getSession().getAttribute("unitId");
        if (StringUtils.isBlank(unitId)){
            HashMap<String, String> map = new HashMap<>();
            List<Unit> units = unitService.findAllUnit();
            for (Unit unit : units) {
                map.put(unit.getId(),unit.getName());
            }
            request.setAttribute("isRootAdd",true);
            request.setAttribute("unitMap",map);
        }
        return "user-add";
    }

    @RequestMapping("/findById.do")
    public ModelAndView findById(String id){
        ModelAndView mv = new ModelAndView();
        User info = userService.findById(id);
        mv.addObject("user",info);
        mv.setViewName("user-show");
        return mv;
    }
    @RequestMapping("/edit.do")
    public ModelAndView edit(String id){
        ModelAndView mv = new ModelAndView();
        User info = userService.findById(id);
        mv.addObject("user",info);
        mv.addObject("isEdit",true);
        mv.setViewName("user-add");
        return mv;
    }
    @RequestMapping("/update.do")
    @ResponseBody
    public Result update(User user){
        userService.update(user);
        return new Result(true, StatusCode.OK,"保存成功");
    }


    @RequestMapping("changePwd.do")
    @ResponseBody
    public Result changePwd(String pwd,String repwd){

        userService.changePWD(pwd,repwd);

        return new Result(true, StatusCode.OK,"修改成功");
    }
}
