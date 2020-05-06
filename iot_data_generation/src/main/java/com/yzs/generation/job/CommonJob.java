package com.yzs.generation.job;

import com.yzs.common.model.Device;
import com.yzs.common.model.DeviceData;
import com.yzs.common.utils.JsonUtils;
import com.yzs.generation.job.base.BaseJob;
import com.yzs.generation.kafka.sender.KafkaSender;
import lombok.extern.slf4j.Slf4j;
import org.quartz.JobDataMap;
import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.Date;
import java.util.Random;
@Slf4j
public class CommonJob implements BaseJob {


    private final Random rand = new Random();


    @Autowired
    private KafkaSender kafkaSender;




    @Override
    public void execute(JobExecutionContext context) throws JobExecutionException {
        JobDataMap map = context.getJobDetail().getJobDataMap();//获取任务保存的上下文数据
        Device device = (Device) map.get("data");
        int MAX = (int) map.get("max");//获取随机生成数值范围的上界
        int MIN = (int) map.get("min");//获取随机生成数值范围的下界
        DeviceData deviceData = new DeviceData();//创建设备数据实例
        //封装数据
        deviceData.setCreatedTime(new Date());
        deviceData.setStatus(1);
        deviceData.setTypeId(device.getTypeId());
        deviceData.setPointId(device.getPointId());
        deviceData.setUnitId(device.getUnitId());
        deviceData.setDeviceId(device.getId());
        //生成数据值
        int randNumber =rand.nextInt(MAX - MIN + 1) + MIN;
        deviceData.setValue((float) randNumber);
        String message = JsonUtils.serialize(deviceData);//序列号设备实例对象
        kafkaSender.send("DEVICEDATA",message);//发送消息
        log.info(this.getClass().getSimpleName()+"  执行: {}", message);
    }


}
