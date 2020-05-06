package com.yzs.generation.controller;

import com.github.pagehelper.PageInfo;
import com.yzs.common.model.JobAndTrigger;
import com.yzs.common.vo.Result;
import com.yzs.common.vo.StatusCode;
import com.yzs.generation.pojo.JobForm;
import com.yzs.generation.service.JobService;
import lombok.extern.slf4j.Slf4j;
import org.quartz.SchedulerException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

/**
 * <p>
 * Job Controller
 * </p>
 *
 */
@RestController
@RequestMapping("/job")
@Slf4j
public class JobController {
    private final JobService jobService;

    @Autowired
    public JobController(JobService jobService) {
        this.jobService = jobService;
    }

    /**
     * 保存定时任务
     */
    @RequestMapping("/add.do")
    public Result addJob(JobForm form) {
        try {
            jobService.addJob(form);
        } catch (Exception e) {
            return new Result(false,StatusCode.ERROR,"添加job出错！");
        }

        return new Result(true,StatusCode.OK,"操作成功");
    }

    /**
     * 删除定时任务
     */
    @RequestMapping("/delete.do")
    public Result deleteJob(JobForm form) throws SchedulerException {
        //if (StrUtil.hasBlank(form.getJobGroupName(), form.getJobClassName())) {
        //    return new ResponseEntity<>(ApiResponse.msg("参数不能为空"), HttpStatus.BAD_REQUEST);
        //}

        jobService.deleteJob(form);
        return new Result(true,StatusCode.OK,"删除成功");
    }

    /**
     * 暂停定时任务
     */
    @RequestMapping("/pause.do")
    public Result pauseJob(JobForm form) throws SchedulerException {
        //if (StrUtil.hasBlank(form.getJobGroupName(), form.getJobClassName())) {
        //    return new ResponseEntity<>(ApiResponse.msg("参数不能为空"), HttpStatus.BAD_REQUEST);
        //}

        jobService.pauseJob(form);
        return new Result(true,StatusCode.OK,"暂停成功");
    }

    /**
     * 恢复定时任务
     */
    @RequestMapping("/resume.do")
    public Result resumeJob(JobForm form) throws SchedulerException {
        //if (StrUtil.hasBlank(form.getJobGroupName(), form.getJobClassName())) {
        //    return new ResponseEntity<>(ApiResponse.msg("参数不能为空"), HttpStatus.BAD_REQUEST);
        //}

        jobService.resumeJob(form);
        return new Result(true,StatusCode.OK,"恢复成功");
    }

    /**
     * 修改定时任务，定时时间
     */
    @RequestMapping("/edit.do")
    public Result cronJob(JobForm form) {
        try {
            jobService.cronJob(form);
        } catch (Exception e) {
            return new Result(false,StatusCode.ERROR,"修改失败",e);
        }

        return new Result(true,StatusCode.OK,"修改成功");
    }


    @RequestMapping("/list.do")
    public Result jobList(@RequestParam(name = "page",required = true,defaultValue = "1")Integer page,
                          @RequestParam(name = "size",required = true, defaultValue = "5")Integer size) {

        PageInfo<JobAndTrigger> all = jobService.list(page, size);
        return new Result(true,StatusCode.OK,"获取成功",all);
    }

}
