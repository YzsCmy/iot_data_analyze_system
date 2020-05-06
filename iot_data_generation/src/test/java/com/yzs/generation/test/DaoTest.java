package com.yzs.generation.test;

import com.yzs.common.model.JobAndTrigger;
import com.yzs.generation.mapper.DeviceTypeMapper;
import com.yzs.generation.mapper.JobMapper;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import java.util.List;

@RunWith(SpringRunner.class)
@SpringBootTest
public class DaoTest {

    @Autowired
    private DeviceTypeMapper deviceTypeMapper;
    @Autowired
    private JobMapper jobMapper;


    @Test
    public void test1(){
        String name = deviceTypeMapper.findNameById("1218741356033761280");
        System.out.println(name);
    }
    @Test
    public void test2(){
        List<JobAndTrigger> list = jobMapper.list();
        System.out.println(list);
        //String name = deviceTypeMapper.findNameById("");
        //System.out.println(name);
    }


}
