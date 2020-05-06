package com.yzs.manage.kafka.receiver;

import com.yzs.common.model.DeviceData;
import com.yzs.common.utils.JsonUtils;
import com.yzs.manage.service.IDeviceDataService;
import lombok.extern.slf4j.Slf4j;
import org.apache.kafka.clients.consumer.ConsumerRecord;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.kafka.annotation.KafkaListener;
import org.springframework.stereotype.Component;

import java.util.Optional;

@Component
@Slf4j
public class KafkaReceiver {

    @Autowired
    private IDeviceDataService deviceDataService;

    @KafkaListener(topics = {"DEVICEDATA"})
    public void listen(ConsumerRecord<?, ?> record) {

        Optional<?> kafkaMessage = Optional.ofNullable(record.value());

        if (kafkaMessage.isPresent()) {

            Object message = kafkaMessage.get();

            DeviceData data = JsonUtils.parse((String) message, DeviceData.class);
            deviceDataService.save(data);
            log.info("---------save-------- record =" + data);
            //System.out.println("------------------ message =" + message);
        }

    }

}