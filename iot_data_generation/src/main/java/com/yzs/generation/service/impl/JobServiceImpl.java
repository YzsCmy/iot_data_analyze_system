package com.yzs.generation.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.yzs.common.model.Device;
import com.yzs.common.model.JobAndTrigger;
import com.yzs.generation.mapper.DeviceTypeMapper;
import com.yzs.generation.mapper.JobMapper;
import com.yzs.generation.pojo.JobForm;
import com.yzs.generation.service.JobService;
import com.yzs.generation.util.DeviceValueConst;
import com.yzs.generation.util.JobUtil;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.StringUtils;
import org.quartz.*;
import org.quartz.impl.matchers.GroupMatcher;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * <p>
 * Job Service
 * </p>
 *
 */
@Service
@Slf4j
public class JobServiceImpl implements JobService {
    private final Scheduler scheduler;
    private final JobMapper jobMapper;

    @Autowired
    public JobServiceImpl(Scheduler scheduler, JobMapper jobMapper) {
        this.scheduler = scheduler;
        this.jobMapper = jobMapper;
    }
    @Autowired
    private DeviceTypeMapper deviceTypeMapper;

    /**
     * 添加并启动定时任务
     *
     * @param form 表单参数 {@link JobForm}
     * @return {@link JobDetail}
     * @throws Exception 异常
     */
    @Override
    public void addJob(JobForm form) throws Exception {
        // 启动调度器
        scheduler.start();
        Device device = form.getJobData();

        int[] range = getJobRange(device.getTypeId());

        // 构建Job信息
        JobDetail jobDetail = JobBuilder.newJob(JobUtil.getClass(form.getJobClassName()).getClass()).withIdentity(form.getJobName(), form.getJobGroupName()).build();
        //封装数据
        jobDetail.getJobDataMap().put("data",device);
        jobDetail.getJobDataMap().put("max",range[0]);
        jobDetail.getJobDataMap().put("min",range[1]);

        // Cron表达式调度构建器(即任务执行的时间)
        CronScheduleBuilder cron = CronScheduleBuilder.cronSchedule(form.getCronExpression());

        //根据Cron表达式构建一个Trigger
        CronTrigger trigger = TriggerBuilder.newTrigger().withIdentity(form.getJobName(), form.getJobGroupName()).withSchedule(cron).build();

        try {
            scheduler.scheduleJob(jobDetail, trigger);
        } catch (SchedulerException e) {
            log.error("【定时任务】创建失败！", e);
            throw new Exception("【定时任务】创建失败！");
        }

    }

    /**
     * 删除定时任务
     *
     * @param form 表单参数 {@link JobForm}
     * @throws SchedulerException 异常
     */
    @Override
    public void deleteJob(JobForm form) throws SchedulerException {
        scheduler.pauseTrigger(TriggerKey.triggerKey(form.getJobName(), form.getJobGroupName()));
        scheduler.unscheduleJob(TriggerKey.triggerKey(form.getJobName(), form.getJobGroupName()));
        scheduler.deleteJob(JobKey.jobKey(form.getJobName(), form.getJobGroupName()));
    }

    /**
     * 暂停定时任务
     *
     * @param form 表单参数 {@link JobForm}
     * @throws SchedulerException 异常
     */
    @Override
    public void pauseJob(JobForm form) throws SchedulerException {
        scheduler.pauseJob(JobKey.jobKey(form.getJobName(), form.getJobGroupName()));
    }

    /**
     * 恢复定时任务
     *
     * @param form 表单参数 {@link JobForm}
     * @throws SchedulerException 异常
     */
    @Override
    public void resumeJob(JobForm form) throws SchedulerException {
        scheduler.resumeJob(JobKey.jobKey(form.getJobName(), form.getJobGroupName()));
    }
    /**
     * 暂停组内定时任务
     *
     * @param form 表单参数 {@link JobForm}
     * @throws SchedulerException 异常
     */
    @Override
    public void pauseJobs(JobForm form) throws SchedulerException {
        GroupMatcher<JobKey> matcher = GroupMatcher.groupEquals(form.getJobGroupName());
        scheduler.pauseJobs(matcher);
    }

    /**
     * 恢复组内定时任务
     *
     * @param form 表单参数 {@link JobForm}
     * @throws SchedulerException 异常
     */
    @Override
    public void resumeJobs(JobForm form) throws SchedulerException {
        GroupMatcher<JobKey> matcher = GroupMatcher.groupEquals(form.getJobGroupName());
        scheduler.resumeJobs(matcher);
    }

    /**
     * 重新配置定时任务
     *
     * @param form 表单参数 {@link JobForm}
     * @throws Exception 异常
     */
    @Override
    public void cronJob(JobForm form) throws Exception {
        try {
            TriggerKey triggerKey = TriggerKey.triggerKey(form.getJobName(), form.getJobGroupName());
            // 表达式调度构建器
            CronScheduleBuilder scheduleBuilder = CronScheduleBuilder.cronSchedule(form.getCronExpression())
                    .withMisfireHandlingInstructionDoNothing();

            CronTrigger trigger = (CronTrigger) scheduler.getTrigger(triggerKey);

            //不执行已暂停的任务
            Trigger.TriggerState triggerState = scheduler.getTriggerState(triggerKey);
            if(triggerState == Trigger.TriggerState.PAUSED){
                // 根据Cron表达式构建一个Trigger
                trigger = trigger.getTriggerBuilder().withIdentity(triggerKey).withSchedule(scheduleBuilder).build();

                // 按新的trigger重新设置job执行
                scheduler.rescheduleJob(triggerKey, trigger);
                //暂停
                scheduler.pauseTrigger(triggerKey);
            }else {
                // 根据Cron表达式构建一个Trigger
                trigger = trigger.getTriggerBuilder().withIdentity(triggerKey).withSchedule(scheduleBuilder).build();

                // 按新的trigger重新设置job执行
                scheduler.rescheduleJob(triggerKey, trigger);

            }

        } catch (SchedulerException e) {
            log.error("【定时任务】更新失败！", e);
            throw new Exception("【定时任务】创建失败！");
        }
    }

    /**
     * 查询定时任务列表
     *
     * @param currentPage 当前页
     * @param pageSize    每页条数
     * @return 定时任务列表
     */
    @Override
    public PageInfo<JobAndTrigger> list(Integer currentPage, Integer pageSize) {
        PageHelper.startPage(currentPage, pageSize);
        List<JobAndTrigger> list = jobMapper.list();
        return new PageInfo<>(list);
    }

    private int[] getJobRange(String typeId) {
        String name = deviceTypeMapper.findNameById(typeId);
        if(StringUtils.isNotBlank(name)){
            if(name.contains("温度")){
                return new int[]{DeviceValueConst.TEMP_MAX,DeviceValueConst.TEMP_MIN};

            }else if(name.contains("湿度")){
                return new int[]{DeviceValueConst.HUMI_MAX,DeviceValueConst.HUMI_MIN};

            }else if(name.contains("光照")){
                return new int[]{DeviceValueConst.ILLU_MAX,DeviceValueConst.ILLU_MIN};

            }else if(name.contains("气体")){
                return new int[]{DeviceValueConst.GAS_MAX,DeviceValueConst.GAS_MIN};

            }
        }
        throw new RuntimeException("typeId is null......");
    }
}
