package com.yzs.manage.mapper;

import com.yzs.common.model.JobAndTrigger;
import org.apache.ibatis.annotations.Select;

import java.util.List;

public interface JobMapper{
    /**
     * 查询定时作业和触发器列表
     *
     * @return 定时作业和触发器列表
     */
    @Select("SELECT " +
            " job_details.`JOB_NAME`, " +
            " job_details.`JOB_GROUP`, " +
            " job_details.`JOB_CLASS_NAME`, " +
            " cron_triggers.`CRON_EXPRESSION`, " +
            " cron_triggers.`TIME_ZONE_ID`, " +
            " qrtz_triggers.`TRIGGER_NAME`, " +
            " qrtz_triggers.`TRIGGER_GROUP`, " +
            " qrtz_triggers.`TRIGGER_STATE` " +
            " FROM  " +
            " `QRTZ_JOB_DETAILS` job_details " +
            " LEFT JOIN `QRTZ_CRON_TRIGGERS` cron_triggers ON job_details.`JOB_NAME` = cron_triggers.`TRIGGER_NAME` " +
            " AND job_details.`JOB_GROUP` = cron_triggers.`TRIGGER_GROUP` " +
            " LEFT JOIN `QRTZ_TRIGGERS` qrtz_triggers ON qrtz_triggers.`TRIGGER_NAME` = job_details.`JOB_NAME` " +
            " AND qrtz_triggers.`TRIGGER_GROUP` = job_details.`JOB_GROUP`")
    List<JobAndTrigger> list();
}