package com.yzs.generation.pojo;

import com.yzs.common.model.Device;
import lombok.Data;

/**
 * <p>
 * 定时任务详情
 * </p>
 *
 */
@Data
public class JobForm {
    /**
     * 定时任务全类名
     */
    private String jobClassName;

    /**
     * 任务组名
     */
    private String jobName;
    /**
     * 任务组名
     */
    private String jobGroupName;
    /**
     * 任务数据
     */
    private Device jobData;
    /**
     * 定时任务cron表达式
     */
    private String cronExpression;
}
