package com.yzs.manage.service.impl;

import com.github.pagehelper.PageHelper;
import com.yzs.common.Exceptiion.IOTException;
import com.yzs.common.enums.ExceptionEnum;
import com.yzs.common.model.Device;
import com.yzs.common.model.DeviceType;
import com.yzs.common.model.MeasurePoint;
import com.yzs.common.utils.DateUtils;
import com.yzs.common.utils.IdWorker;
import com.yzs.common.utils.JsonUtils;
import com.yzs.manage.kafka.sender.KafkaSender;
import com.yzs.manage.mapper.DeviceMapper;
import com.yzs.manage.mapper.DeviceTypeMapper;
import com.yzs.manage.service.IDeviceService;
import com.yzs.manage.web.vo.LineChartVo;
import com.yzs.manage.web.vo.LineVo;
import com.yzs.manage.web.vo.PieVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import tk.mybatis.mapper.entity.Example;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Service
@Transactional
public class DeviceServiceImpl implements IDeviceService {

    @Autowired
    private IdWorker idWorker;
    @Autowired
    private DeviceMapper deviceMapper;
    @Autowired
    private DeviceTypeMapper typeMapper;
    @Autowired
    private KafkaSender kafkaSender;

    @Override
    public List<Device> findAll(Integer page, Integer size,String typeId, String name) {
        PageHelper.startPage(page,size);
        return deviceMapper.findAll(typeId,name);
    }

    @Override
    public List<Device> findAllInUnit(Integer page, Integer size,String unitId, String typeId, String name) {
        PageHelper.startPage(page,size);
        return deviceMapper.findAllInUnit(unitId,typeId,name);
    }

    @Override
    public List<Device> findAllInUnit(String unitId, String typeId, String name) {
        return deviceMapper.findAllInUnit(unitId,typeId,name);
    }

    @Override
    public List<Device> findAllInMeasurePoint(Integer page, Integer size,String pointId, String typeId, String name) {
        PageHelper.startPage(page,size);
        return deviceMapper.findAllInMeasurePoint(pointId,typeId,name);
    }

    @Override
    public void save(Device info) {
        Example example = new Example(Device.class);
        Example.Criteria criteria = example.createCriteria();
        criteria.andEqualTo("pointId",info.getPointId())
                .andEqualTo("name",info.getName());

        List<Device> devices = deviceMapper.selectByExample(example);
        if(devices!=null&&devices.size()>0){
            throw new IOTException(ExceptionEnum.DEVICE_IS_EXIST);
        }else {
            info.setId(idWorker.nextId()+"");
            info.setCreatedTime(new Date());
            deviceMapper.insert(info);
            //TODO
            if(info.getStatus()!=null&&info.getStatus()!=0){
                //发送消息
                kafkaSender.send("ADDDEVICE", JsonUtils.serialize(info));
            }
        }
        
    }

    @Override
    public Device findById(String id) {
        return deviceMapper.findById(id);
    }

    @Override
    public void update(Device info) {

        Example example = new Example(Device.class);
        Example.Criteria criteria = example.createCriteria();
        criteria.andEqualTo("pointId",info.getPointId())
                .andEqualTo("name",info.getName());

        List<Device> devices = deviceMapper.selectByExample(example);
        if(devices!=null&&devices.size()>0){
            if(!info.getId().equals(devices.get(0).getId())){

                throw new IOTException(ExceptionEnum.DEVICE_IS_EXIST);
            }
        }
        Device oldDevice = deviceMapper.selectByPrimaryKey(info.getId());

        deviceMapper.updateByPrimaryKeySelective(info);
        //TODO
        if(!oldDevice.getStatus().equals(info.getStatus())){
            //发消息
            Device data = deviceMapper.selectByPrimaryKey(info.getId());
            if(info.getStatus().equals(1)){
                //开启设备

                kafkaSender.send("RESUMEDEVICE",JsonUtils.serialize(data));
            }else {
                //关闭设备
                kafkaSender.send("PAUSEDEVICE",JsonUtils.serialize(data));

            }
        }

    }

    @Override
    public List<PieVo> devicePie() {
        return deviceMapper.selectDeviceNumPerType();
    }

    @Override
    public List<PieVo> deviceDataPie() {
        return deviceMapper.selectDataNumPerType();
    }

    @Override
    public List<PieVo> deviceInUnitPie(String unitId) {
        return deviceMapper.selectDeviceNumPerTypeInUnit(unitId);
    }

    @Override
    public List<PieVo> deviceDataInUnitPie(String unitId) {
        return deviceMapper.selectDataNumPerDeviceInUnit(unitId);
    }

    @Override
    public LineChartVo chartDataAllType() {
        LineChartVo chartVo = new LineChartVo();
        chartVo.setDateList(DateUtils.get7DayStr());

        List<DeviceType> all = typeMapper.selectAll();
        ArrayList<String> typeNames = new ArrayList<>();
        ArrayList<LineVo> lineVos = new ArrayList<>();
        for (DeviceType type : all) {
            String id = type.getId();
            String name = type.getName();
            typeNames.add(name);
            List<Integer> integers = deviceMapper.select7DayDataNumByTypeId(id);
            LineVo lineVo = new LineVo();
            lineVo.setName(name);
            lineVo.setType("line");
            lineVo.setData(integers);
            lineVos.add(lineVo);
        }

        chartVo.setNames(typeNames);
        chartVo.setLineVos(lineVos);
        return chartVo;
    }

    @Override
    public LineChartVo chartDataInUnit(String unitId) {
        LineChartVo chartVo = new LineChartVo();
        chartVo.setDateList(DateUtils.get7DayStr());

        List<Device> all = deviceMapper.findAllInUnit(unitId, null, null);
        ArrayList<String> deviceNames = new ArrayList<>();
        ArrayList<LineVo> lineVos = new ArrayList<>();
        for (Device device : all) {
            String id = device.getId();
            String name = device.getName();
            deviceNames.add(name);
            List<Integer> integers = deviceMapper.select7DayDataNumByDeviceId(id);
            LineVo lineVo = new LineVo();
            lineVo.setName(name);
            lineVo.setType("line");
            lineVo.setData(integers);
            lineVos.add(lineVo);
        }

        chartVo.setNames(deviceNames);
        chartVo.setLineVos(lineVos);
        return chartVo;
    }

    @Override
    public List<Device> findByPointId(String pointId) {
        return deviceMapper.findAllInMeasurePoint(pointId,null,null);
    }
}
