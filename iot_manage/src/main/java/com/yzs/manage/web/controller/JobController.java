package com.yzs.manage.web.controller;

import com.github.pagehelper.PageInfo;
import com.yzs.common.model.JobAndTrigger;
import com.yzs.manage.service.IDeviceDataService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;


@Controller
@RequestMapping("/job")
public class JobController {
    @Autowired
    private IDeviceDataService deviceDataService;

    @RequestMapping("/list.do")
    public ModelAndView jobList(@RequestParam(name = "page",required = true,defaultValue = "1")Integer page,
                                @RequestParam(name = "size",required = true, defaultValue = "5")Integer size) {

        PageInfo<JobAndTrigger> all = deviceDataService.list(page, size);
        ModelAndView mv = new ModelAndView();
        mv.addObject("pageInfo",all);
        mv.setViewName("job-list");
        return mv;
    }

}
