package com.yzs.manage.service;

import com.yzs.common.model.DeviceType;
import com.yzs.manage.web.vo.DeviceTypeVo;

import java.util.List;

public interface IDeviceTypeService {

    void save(DeviceType deviceType);

    String findUnitByDeviceTypeId(String deviceTypeId);

    List<DeviceTypeVo> findAll(String unitId);
    List<DeviceType> findAll();
}

