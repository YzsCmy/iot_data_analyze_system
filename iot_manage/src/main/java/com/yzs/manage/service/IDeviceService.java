package com.yzs.manage.service;

import com.yzs.common.model.Device;
import com.yzs.manage.web.vo.LineChartVo;
import com.yzs.manage.web.vo.PieVo;

import java.util.List;

public interface IDeviceService {

    List<Device> findAll(Integer page, Integer size,String typeId,String name);

    List<Device> findAllInUnit(Integer page, Integer size,String unitId,String typeId,String name);

    List<Device> findAllInUnit(String unitId,String typeId,String name);

    List<Device> findAllInMeasurePoint(Integer page, Integer size,String pointId,String typeId,String name);

    void save(Device info);

    Device findById(String id);

    void update(Device Device);

    List<PieVo> devicePie();

    List<PieVo> deviceDataPie();

    List<PieVo> deviceInUnitPie(String unitId);

    List<PieVo> deviceDataInUnitPie(String unitId);

    LineChartVo chartDataAllType();

    LineChartVo chartDataInUnit(String unitId);

    List<Device> findByPointId(String pointId);
}
