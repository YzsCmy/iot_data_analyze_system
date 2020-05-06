package com.yzs.generation.job;

import com.yzs.common.model.Device;
import com.yzs.common.model.DeviceData;
import com.yzs.common.utils.JsonUtils;
import com.yzs.generation.job.base.BaseJob;
import com.yzs.generation.kafka.sender.KafkaSender;
import com.yzs.generation.util.DeviceValueConst;
import lombok.extern.slf4j.Slf4j;
import org.quartz.JobDataMap;
import org.quartz.JobExecutionContext;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.Date;
import java.util.Random;
@Slf4j
public class IlluminationJob implements BaseJob {

    private final Random rand = new Random();
    private static final int MAX = DeviceValueConst.ILLU_MAX;
    private static final int MIN = DeviceValueConst.ILLU_MIN;

    @Autowired
    private KafkaSender kafkaSender;

    @Override
    public void execute(JobExecutionContext context) {
        JobDataMap map = context.getJobDetail().getJobDataMap();
        Device device = (Device) map.get("data");
        DeviceData deviceData = new DeviceData();
        deviceData.setCreatedTime(new Date());
        deviceData.setStatus(1);
        deviceData.setTypeId(device.getTypeId());
        deviceData.setPointId(device.getPointId());
        deviceData.setUnitId(device.getUnitId());
        deviceData.setDeviceId(device.getId());
        //生成数据值
        int randNumber = rand.nextInt(MAX - MIN + 1) + MIN;
        deviceData.setValue((float) randNumber);
        String message = JsonUtils.serialize(deviceData);
        kafkaSender.send("DEVICEDATA", message);
        log.info("IlluminationJob  执行: {}", message);
    }
}

