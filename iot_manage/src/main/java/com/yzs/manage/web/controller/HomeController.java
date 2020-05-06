package com.yzs.manage.web.controller;

import com.yzs.common.model.Unit;
import com.yzs.common.vo.Result;
import com.yzs.common.vo.StatusCode;
import com.yzs.manage.service.IUnitService;
import com.yzs.manage.web.vo.LineChartVo;
import com.yzs.manage.web.vo.PieVo;
import com.yzs.manage.web.vo.UnitShowVo;
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
import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/home")
public class HomeController {
    @Autowired
    private IUnitService unitService;

    @RequestMapping("/main.do")
    public ModelAndView main() {
        ModelAndView view = new ModelAndView();
        HttpServletRequest request = ((ServletRequestAttributes)(RequestContextHolder.currentRequestAttributes())).getRequest();
        String unitId = (String) request.getSession().getAttribute("unitId");
        List<Unit> allUnit = new ArrayList<>();
        UnitShowVo unitShowVo;
        if(StringUtils.isBlank(unitId)){

            allUnit = unitService.findAllUnit();
            unitShowVo = unitService.countAll();
        }else {
            allUnit.add(unitService.findById(unitId));
            unitShowVo = unitService.countByUnitId(unitId);

        }
        view.setViewName("home");
        view.addObject("list",allUnit);
        view.addObject("unitInfo",unitShowVo);
        return view;

    }
    @RequestMapping("/data.do")
    @ResponseBody
    public Result device(@RequestParam(value = "unitId",defaultValue = "")String unitId) {
        LineChartVo chartVo;
        if(StringUtils.isBlank(unitId)){
            chartVo = unitService.chartDataAllUnit();
        }else {
            chartVo = unitService.chartDataInUnit(unitId);
        }
        return new Result(true, StatusCode.OK,"获取折线图数据成功",chartVo);
    }

    @RequestMapping("/pie.do")
    @ResponseBody
    public Result pie(@RequestParam(value = "unitId",defaultValue = "")String unitId) {
        List<PieVo> pieVos;
        if(StringUtils.isBlank(unitId)){
            pieVos = unitService.unitDataPie();
        }else {
            pieVos = unitService.measDataPie(unitId);
        }
        return new Result(true, StatusCode.OK,"获取饼图数据成功",pieVos);
    }

}
