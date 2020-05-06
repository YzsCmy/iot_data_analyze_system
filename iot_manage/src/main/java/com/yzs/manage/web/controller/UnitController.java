package com.yzs.manage.web.controller;

import com.github.pagehelper.PageInfo;
import com.yzs.common.model.Unit;
import com.yzs.common.model.User;
import com.yzs.common.vo.Result;
import com.yzs.common.vo.StatusCode;
import com.yzs.manage.service.IUnitService;
import com.yzs.manage.service.IUserService;
import com.yzs.manage.web.vo.UnitShowVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import java.util.HashMap;
import java.util.List;

@Controller
@RequestMapping("/unit")
public class UnitController {

    @Autowired
    private IUnitService unitService;
    @Autowired
    private IUserService userService;


    @RequestMapping("/findAll.do")
    @PreAuthorize("hasRole('ROOT')")
    public ModelAndView findAll(@RequestParam(name = "page",required = true,defaultValue = "1")Integer page,
                                @RequestParam(name = "size",required = true, defaultValue = "5")Integer size){
        ModelAndView mv = new ModelAndView();
        List<Unit> all = unitService.findAll(page,size);
        PageInfo pageInfo = new PageInfo(all);
        mv.addObject("pageInfo",pageInfo);
        mv.setViewName("unit-list");
        return mv;
    }
    @RequestMapping("/save.do")
    @ResponseBody
    public Result save(Unit info){
        unitService.save(info);
        return new Result(true, StatusCode.OK,"保存成功");
    }

    @RequestMapping("/addUnit.do")
    public String toSave(){
        //HttpServletRequest request = ((ServletRequestAttributes)(RequestContextHolder.currentRequestAttributes())).getRequest();
        //String unitId = (String) request.getSession().getAttribute("unitId");
        //if (StringUtils.isBlank(unitId)){
        //    HashMap<String, String> map = new HashMap<>();
        //    List<Unit> units = unitService.findAllUnit();
        //    for (Unit unit : units) {
        //        map.put(unit.getId(),unit.getName());
        //    }
        //    request.setAttribute("isRootAdd",true);
        //    request.setAttribute("unitMap",map);
        //}
        return "unit-add";
    }

    //@RequestMapping("/findById.do")
    //public ModelAndView findById(@RequestParam(name = "id",defaultValue = "")String id){
    //    ModelAndView mv = new ModelAndView();
    //    Unit info = unitService.findById(id);
    //    UnitShowVo unitInfo = unitService.countByUnitId(id);
    //    mv.addObject("unit",info);
    //    mv.addObject("unitInfo",unitInfo);
    //    mv.setViewName("unit-show");
    //    return mv;
    //}
    @RequestMapping("/edit.do")
    public ModelAndView edit(String id){
        ModelAndView mv = new ModelAndView();
        Unit info = unitService.findById(id);
        List<User> allInUnit = userService.findAllInUnit(id);
        HashMap<String, String> map = new HashMap<>();
        for (User user:allInUnit){
            map.put(user.getId(),user.getUsername());
        }
        mv.addObject("unit",info);
        mv.addObject("userMap",map);
        mv.addObject("isEdit",true);
        mv.setViewName("unit-add");
        return mv;
    }
    @RequestMapping("/update.do")
    @ResponseBody
    public Result update(Unit unit){
        unitService.update(unit);
        return new Result(true, StatusCode.OK,"保存成功");
    }


    @RequestMapping("/show.do")
    public ModelAndView show(@RequestParam(name = "id",defaultValue = "") String id){
        ModelAndView mv = new ModelAndView();
        Unit info = unitService.findById(id);
        UnitShowVo unitInfo = unitService.countByUnitId(id);
        mv.addObject("unit",info);
        mv.addObject("unitInfo",unitInfo);
        mv.setViewName("unit-show");
        return mv;
    }

    @RequestMapping("/select.do")
    @ResponseBody
    public Result select(){
        List<Unit> allInUnit = unitService.findAllUnit();
        return new Result(true,StatusCode.OK,"查询成功",allInUnit);
    }
}
