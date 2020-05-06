package com.yzs.generation.kafka.receiver;

import com.yzs.common.model.Device;
import com.yzs.common.utils.JsonUtils;
import com.yzs.generation.job.*;
import com.yzs.generation.mapper.DeviceTypeMapper;
import com.yzs.generation.pojo.JobForm;
import com.yzs.generation.service.JobService;
import com.yzs.generation.util.CronExpressionConst;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.StringUtils;
import org.apache.kafka.clients.consumer.ConsumerRecord;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.kafka.annotation.KafkaListener;
import org.springframework.stereotype.Component;

import java.util.Optional;

@Component
@Slf4j
public class KafkaReceiver {

    @Autowired
    private JobService jobService;
    @Autowired
    private DeviceTypeMapper deviceTypeMapper;

    @KafkaListener(topics = {"yang"})
    public void listen(ConsumerRecord<?, ?> record) {

        Optional<?> kafkaMessage = Optional.ofNullable(record.value());

        if (kafkaMessage.isPresent()) {

            Object message = kafkaMessage.get();

            System.out.println("------------------ message =" + message);
        }

    }
    @KafkaListener(topics = {"ADDDEVICE"})
    public void addDevice(ConsumerRecord<?, ?> record) {

        Optional<?> kafkaMessage = Optional.ofNullable(record.value());

        if (kafkaMessage.isPresent()) {

            Object message = kafkaMessage.get();
            Device device = JsonUtils.parse((String) message, Device.class);
            JobForm jobForm = new JobForm();
            jobForm.setJobName(device.getId());
            jobForm.setJobGroupName(device.getPointId());
            jobForm.setCronExpression(CronExpressionConst.FIVEMIN);
            jobForm.setJobClassName(CommonJob.class.getName());
            jobForm.setJobData(device);
            try {
                jobService.addJob(jobForm);
            } catch (Exception e) {
                e.printStackTrace();
            }
            System.out.println("------------------ message =" + message);
        }

    }



    @KafkaListener(topics = {"RESUMEDEVICE"})
    public void resumeDevice(ConsumerRecord<?, ?> record) {

        Optional<?> kafkaMessage = Optional.ofNullable(record.value());

        if (kafkaMessage.isPresent()) {

            Object message = kafkaMessage.get();

            Device device = JsonUtils.parse((String) message, Device.class);
            JobForm jobForm = new JobForm();
            jobForm.setJobName(device.getId());
            jobForm.setJobGroupName(device.getPointId());
            try {
                jobService.resumeJob(jobForm);
            } catch (Exception e) {
                e.printStackTrace();
            }
            System.out.println("------------------ message =" + message);
        }

    }
    @KafkaListener(topics = {"PAUSEDEVICE"})
    public void pauseDevice(ConsumerRecord<?, ?> record) {

        Optional<?> kafkaMessage = Optional.ofNullable(record.value());

        if (kafkaMessage.isPresent()) {

            Object message = kafkaMessage.get();
            Device device = JsonUtils.parse((String) message, Device.class);
            JobForm jobForm = new JobForm();
            jobForm.setJobName(device.getId());
            jobForm.setJobGroupName(device.getPointId());
            try {
                jobService.pauseJob(jobForm);
            } catch (Exception e) {
                e.printStackTrace();
            }

            System.out.println("------------------ message =" + message);
        }

    }
    @KafkaListener(topics = {"RESUMEGROUP"})
    public void resumeGroup(ConsumerRecord<?, ?> record) {

        Optional<?> kafkaMessage = Optional.ofNullable(record.value());

        if (kafkaMessage.isPresent()) {

            Object message = kafkaMessage.get();
            JobForm jobForm = new JobForm();
            jobForm.setJobGroupName((String) message);
            try {
                jobService.resumeJobs(jobForm);
            } catch (Exception e) {
                e.printStackTrace();
            }

            System.out.println("------------------ message =" + message);
        }

    }
    @KafkaListener(topics = {"PAUSEGROUP"})
    public void pauseGroup(ConsumerRecord<?, ?> record) {

        Optional<?> kafkaMessage = Optional.ofNullable(record.value());

        if (kafkaMessage.isPresent()) {

            Object message = kafkaMessage.get();
            JobForm jobForm = new JobForm();
            jobForm.setJobGroupName((String) message);
            try {
                jobService.pauseJobs(jobForm);
            } catch (Exception e) {
                e.printStackTrace();
            }

            System.out.println("------------------ message =" + message);
        }

    }
    @KafkaListener(topics = {"MODIFYDEVICE"})
    public void modifyDevice(ConsumerRecord<?, ?> record) {

        Optional<?> kafkaMessage = Optional.ofNullable(record.value());

        if (kafkaMessage.isPresent()) {

            Object message = kafkaMessage.get();

            System.out.println("------------------ message =" + message);
        }

    }




}