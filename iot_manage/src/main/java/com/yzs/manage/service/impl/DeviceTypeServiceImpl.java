package com.yzs.manage.service.impl;

import com.yzs.common.Exceptiion.IOTException;
import com.yzs.common.enums.ExceptionEnum;
import com.yzs.common.model.Device;
import com.yzs.common.model.DeviceType;
import com.yzs.common.utils.IdWorker;
import com.yzs.manage.mapper.DeviceMapper;
import com.yzs.manage.mapper.DeviceTypeMapper;
import com.yzs.manage.service.IDeviceTypeService;
import com.yzs.manage.web.vo.DeviceTypeVo;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import tk.mybatis.mapper.entity.Example;

import java.util.ArrayList;
import java.util.List;

@Service
@Transactional
public class DeviceTypeServiceImpl implements IDeviceTypeService {

    @Autowired
    private DeviceTypeMapper deviceTypeMapper;
    @Autowired
    private DeviceMapper deviceMapper;

    @Autowired
    private IdWorker idWorker;

    @Override
    public void save(DeviceType deviceType) {
        Example example = new Example(DeviceType.class);
        Example.Criteria criteria = example.createCriteria();
        criteria.andEqualTo("name",deviceType.getName());
        DeviceType deviceType1 = deviceTypeMapper.selectOneByExample(example);
        if(deviceType1!=null){
            throw new IOTException(ExceptionEnum.DEVICETYPE_IS_EXIST);
        }
        deviceType.setId(idWorker.nextId()+"");
        deviceTypeMapper.insert(deviceType);
    }

    @Override
    public List<DeviceTypeVo> findAll(String unitId) {
        List<DeviceType> deviceTypes = deviceTypeMapper.selectAll();
        List<DeviceTypeVo> res = new ArrayList<>();

        if(StringUtils.isNotBlank(unitId)){
            Device temp = new Device();
            temp.setUnitId(unitId);
            for (DeviceType deviceType : deviceTypes) {
                temp.setTypeId(deviceType.getId());
                int i = deviceMapper.selectCount(temp);
                res.add(new DeviceTypeVo(deviceType.getId(),deviceType.getName(),i));
            }

        }else {
            Device temp = new Device();
            for (DeviceType deviceType : deviceTypes) {
                temp.setTypeId(deviceType.getId());
                int i = deviceMapper.selectCount(temp);
                res.add(new DeviceTypeVo(deviceType.getId(),deviceType.getName(),i));
            }
        }
        return res;
    }

    @Override
    public List<DeviceType> findAll() {
        return deviceTypeMapper.selectAll();
    }

    @Override
    public String findUnitByDeviceTypeId(String deviceTypeId) {

        DeviceType deviceType = deviceTypeMapper.selectByPrimaryKey(deviceTypeId);
        return deviceType.getUnit();
    }
}
