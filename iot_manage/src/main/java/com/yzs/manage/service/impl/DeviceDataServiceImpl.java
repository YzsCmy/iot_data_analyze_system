package com.yzs.manage.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.yzs.common.model.Device;
import com.yzs.common.model.DeviceData;
import com.yzs.common.model.JobAndTrigger;
import com.yzs.common.utils.DateUtils;
import com.yzs.common.utils.IdWorker;
import com.yzs.manage.mapper.DeviceDataMapper;
import com.yzs.manage.mapper.DeviceMapper;
import com.yzs.manage.mapper.JobMapper;
import com.yzs.manage.service.IDeviceDataService;
import com.yzs.manage.web.vo.LineChartVo;
import com.yzs.manage.web.vo.LineVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;
@Service
@Transactional
public class DeviceDataServiceImpl implements IDeviceDataService {
    @Autowired
    private IdWorker idWorker;
    @Autowired
    private DeviceDataMapper deviceDataMapper;
    @Autowired
    private DeviceMapper deviceMapper;
    @Autowired
    private JobMapper jobMapper;

    @Override
    public void save(DeviceData info) {
        info.setId(idWorker.nextId()+"");
        //info.setCreatedTime(new Date());
        deviceDataMapper.insert(info);
    }

    @Override
    public DeviceData findById(String id) {
        return deviceDataMapper.findById(id);
    }

    @Override
    public List<DeviceData> findByDeviceId(Integer page, Integer size,String id) {
        PageHelper.startPage(page,size);
        return deviceDataMapper.findByDeviceId(id);
    }

    @Override
    public void update(DeviceData deviceData) {

        deviceDataMapper.updateByPrimaryKeySelective(deviceData);
    }

    @Override
    public PageInfo<JobAndTrigger> list(Integer currentPage, Integer pageSize) {
        PageHelper.startPage(currentPage, pageSize);
        List<JobAndTrigger> list = jobMapper.list();
        return new PageInfo<>(list);
    }

    @Override
    public LineChartVo chartData(String date, String id) {
        LineChartVo chartVo = new LineChartVo();
        chartVo.setDateList(DateUtils.get12HourStr());

        Device device = deviceMapper.findById(id);
        ArrayList<String> deviceNames = new ArrayList<>();
        ArrayList<LineVo> lineVos = new ArrayList<>();
        String name = device.getName();
        deviceNames.add(name);
        List<Integer> integers = deviceDataMapper.select24HourPer2HourDataNumByDeviceId(id,date);
        LineVo lineVo = new LineVo();
        lineVo.setName(name);
        lineVo.setType("line");
        lineVo.setData(integers);
        lineVos.add(lineVo);

        chartVo.setNames(deviceNames);
        chartVo.setLineVos(lineVos);
        return chartVo;

    }

    @Override
    public LineChartVo chartDataValue(String date, String id) {
        LineChartVo chartVo = new LineChartVo();
        chartVo.setDateList(DateUtils.get12HourStr());

        Device device = deviceMapper.findById(id);
        ArrayList<String> deviceNames = new ArrayList<>();
        ArrayList<LineVo> lineVos = new ArrayList<>();
        String name = device.getName();
        deviceNames.add(name);
        List<Integer> integers = deviceDataMapper.select24HourPer2HourDataValueByDeviceId(id,date);
        LineVo lineVo = new LineVo();
        lineVo.setName(name);
        lineVo.setType("line");
        lineVo.setData(integers);
        lineVos.add(lineVo);

        chartVo.setNames(deviceNames);
        chartVo.setLineVos(lineVos);
        return chartVo;

    }
}
