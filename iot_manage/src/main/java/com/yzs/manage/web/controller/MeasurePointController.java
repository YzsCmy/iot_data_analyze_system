package com.yzs.manage.web.controller;

import com.github.pagehelper.PageInfo;
import com.yzs.common.model.MeasurePoint;
import com.yzs.common.model.Unit;
import com.yzs.common.vo.Result;
import com.yzs.common.vo.StatusCode;
import com.yzs.manage.service.IMeasurePointService;
import com.yzs.manage.service.IUnitService;
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

@Controller
@RequestMapping("/measurePoint")
public class MeasurePointController {

    @Autowired
    private IUnitService unitService;
    @Autowired
    private IMeasurePointService measurePointService;



    @RequestMapping("/findAll.do")
    @PreAuthorize("hasRole('ROOT') or hasRole('ADMIN')")
    public ModelAndView findAll(@RequestParam(name = "page",required = true,defaultValue = "1")Integer page,
                                @RequestParam(name = "size",required = true, defaultValue = "5")Integer size,
                                @RequestParam(name = "name",defaultValue = "") String name){
        ModelAndView mv = new ModelAndView();
        HttpServletRequest request = ((ServletRequestAttributes)(RequestContextHolder.currentRequestAttributes())).getRequest();
        String unitId = (String) request.getSession().getAttribute("unitId");
        List<MeasurePoint> all = null;
        if(StringUtils.isBlank(unitId)){

            all = measurePointService.findAll(page,size,name);
        }else {
            all = measurePointService.findAllInUnit(page,size,unitId,name);

        }
        PageInfo pageInfo = new PageInfo(all);
        mv.addObject("pageInfo",pageInfo);
        mv.addObject("query",name);
        mv.setViewName("measurepoint-list");
        return mv;
    }
    @RequestMapping("/findAllInUnit.do")
    @PreAuthorize("hasRole('ADMIN')")
    public ModelAndView findAllInUnit(@RequestParam(name = "page",required = true,defaultValue = "1")Integer page,
                                      @RequestParam(name = "size",required = true, defaultValue = "5")Integer size,
                                      @RequestParam(name = "unitId",defaultValue = "")String unitId,
                                      @RequestParam(name = "name",defaultValue = "") String name){
        ModelAndView mv = new ModelAndView();
        List<MeasurePoint> all = measurePointService.findAllInUnit(page, size, unitId, name);
        //List<User> all = userService.findAllInUnit(page,size,unitId);
        PageInfo pageInfo = new PageInfo(all);
        mv.addObject("pageInfo",pageInfo);
        mv.addObject("query",name);
        mv.setViewName("measurepoint-list");
        return mv;
    }


    @RequestMapping("/save.do")
    @ResponseBody
    public Result save(MeasurePoint info){
        measurePointService.save(info);
        return new Result(true, StatusCode.OK,"保存成功");
    }

    @RequestMapping("/addMeasurePoint.do")
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
        return "measurepoint-add";
    }

    @RequestMapping("/findByUnitId.do")
    @ResponseBody
    public Result findByUnitId(String unitId){
        List<MeasurePoint> allInUnit = measurePointService.findAllInUnit(unitId, null);
        return new Result(true,StatusCode.OK,"查询成功",allInUnit);
    }
    @RequestMapping("/edit.do")
    public ModelAndView edit(String id){
        ModelAndView mv = new ModelAndView();
        MeasurePoint measurePoint = measurePointService.findById(id);
        //User info = userService.findById(id);
        mv.addObject("measurePoint",measurePoint);
        mv.addObject("isEdit",true);
        mv.setViewName("measurepoint-add");
        return mv;
    }
    @RequestMapping("/update.do")
    @ResponseBody
    public Result update(MeasurePoint measurePoint){
        measurePointService.update(measurePoint);
        return new Result(true, StatusCode.OK,"保存成功");
    }
}
