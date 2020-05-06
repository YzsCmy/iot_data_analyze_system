package com.yzs.manage.kafka.sender;

import com.fasterxml.jackson.core.JsonProcessingException;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.kafka.core.KafkaTemplate;
import org.springframework.stereotype.Component;


@Component
@Slf4j
public class KafkaSender {

    @Autowired
    private KafkaTemplate<String, String> kafkaTemplate;


    //发送消息方法
    public void send(String topic,String message){
        kafkaTemplate.send(topic,message);
        log.info("++++++++ send ++++++++  topic = {}   +++++  message = {}", topic, message);
    }
 
}