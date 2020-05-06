package com.yzs.manage.service.impl;

import com.github.pagehelper.PageHelper;
import com.yzs.common.Exceptiion.IOTException;
import com.yzs.common.enums.ExceptionEnum;
import com.yzs.common.model.Device;
import com.yzs.common.model.MeasurePoint;
import com.yzs.common.model.Unit;
import com.yzs.common.utils.DateUtils;
import com.yzs.common.utils.IdWorker;
import com.yzs.manage.kafka.sender.KafkaSender;
import com.yzs.manage.mapper.DeviceMapper;
import com.yzs.manage.mapper.MeasurePointMapper;
import com.yzs.manage.service.IMeasurePointService;
import com.yzs.manage.web.vo.LineChartVo;
import com.yzs.manage.web.vo.LineVo;
import com.yzs.manage.web.vo.PieVo;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;

@Service
@Transactional
public class MeasurePointServiceImpl implements IMeasurePointService {
    @Autowired
    private MeasurePointMapper measurePointMapper;
    @Autowired
    private DeviceMapper deviceMapper;
    @Autowired
    private IdWorker idWorker;
    @Autowired
    private KafkaSender kafkaSender;

    @Override
    public List<MeasurePoint> findAll(Integer page, Integer size,String name) {
        PageHelper.startPage(page,size);
        if(StringUtils.isNotBlank(name)){
           return measurePointMapper.findByQuery(name,null);

        }
        return measurePointMapper.findAll();
    }

    @Override
    public List<MeasurePoint> findAllInUnit(Integer page, Integer size,String unitId, String name) {
        PageHelper.startPage(page,size);
        return measurePointMapper.findByQuery(name,unitId);
    }

    @Override
    public List<MeasurePoint> findAllInUnit(String unitId, String name) {
        return measurePointMapper.findByQuery(name,unitId);
    }

    @Override
    public void save(MeasurePoint info) {
        List<MeasurePoint> measurePoints = measurePointMapper.findByQuery(info.getName(), info.getUnitId());
        if(measurePoints!=null&&measurePoints.size()>0){
            throw new IOTException(ExceptionEnum.MEASUREPOINT_IS_EXIST);
        }else {
            info.setId(idWorker.nextId()+"");
            measurePointMapper.insert(info);
        }


    }

    @Override
    public MeasurePoint findById(String id) {
        return measurePointMapper.findById(id);
    }

    @Override
    public void update(MeasurePoint measurePoint) {

        List<MeasurePoint> measurePoints = measurePointMapper.findByQuery(measurePoint.getName(), measurePoint.getUnitId());
        if(measurePoints!=null&&measurePoints.size()>0){
            if(!measurePoint.getId().equals(measurePoints.get(0).getId())){

                throw new IOTException(ExceptionEnum.MEASUREPOINT_IS_EXIST);
            }
        }
        MeasurePoint oldPoint = measurePointMapper.selectByPrimaryKey(measurePoint.getId());
        measurePointMapper.updateByPrimaryKey(measurePoint);
        //TODO
        if(!oldPoint.getStatus().equals(measurePoint.getStatus())){
            //发消息
            if(measurePoint.getStatus().equals(1)){
                //开启该测点全部设备
                List<Device> devices = deviceMapper.findAllInMeasurePoint(measurePoint.getId(), null, null);
                for (Device device : devices) {
                    device.setStatus(1);
                    deviceMapper.updateByPrimaryKey(device);
                }
                kafkaSender.send("RESUMEGROUP",measurePoint.getId());

            }else {
                //关闭该测点全部设备
                List<Device> devices = deviceMapper.findAllInMeasurePoint(measurePoint.getId(), null, null);
                for (Device device : devices) {
                    device.setStatus(0);
                    deviceMapper.updateByPrimaryKey(device);
                }
                kafkaSender.send("PAUSEGROUP",measurePoint.getId());

            }
        }


    }

    @Override
    public List<PieVo> measDataAllUnitPie() {
        return measurePointMapper.selectDataNumPerMeas();
    }

    @Override
    public List<PieVo> measDataInUnitPie(String unitId) {
        return measurePointMapper.selectDataNumPerMeasByUnitId(unitId);
    }

    @Override
    public List<PieVo> devicePie(String unitId) {
        return measurePointMapper.selectDeviceNumPerMeas(unitId);
    }

    @Override
    public LineChartVo chartDataAllUnit() {
        LineChartVo chartVo = new LineChartVo();
        chartVo.setDateList(DateUtils.get7DayStr());

        List<MeasurePoint> all = measurePointMapper.findAll();
        ArrayList<String> pointNames = new ArrayList<>();
        ArrayList<LineVo> lineVos = new ArrayList<>();
        for (MeasurePoint point : all) {
            String id = point.getId();
            String name = point.getName();
            String unitName = point.getUnitName();
            pointNames.add(unitName+"-"+name);
            List<Integer> integers = measurePointMapper.select7DayDataNumByPointId(id);
            LineVo lineVo = new LineVo();
            lineVo.setName(unitName+"-"+name);
            lineVo.setType("line");
            lineVo.setData(integers);
            lineVos.add(lineVo);
        }

        chartVo.setNames(pointNames);
        chartVo.setLineVos(lineVos);
        return chartVo;


    }

    @Override
    public LineChartVo chartDataInUnit(String unitId) {
        LineChartVo chartVo = new LineChartVo();
        chartVo.setDateList(DateUtils.get7DayStr());
        ArrayList<String> pointNames = new ArrayList<>();
        ArrayList<LineVo> lineVos = new ArrayList<>();
        List<MeasurePoint> all = measurePointMapper.findByUnitId(unitId);
        for (MeasurePoint point : all) {
            String id = point.getId();
            String name = point.getName();
            String unitName = point.getUnitName();
            pointNames.add(unitName+"-"+name);
            List<Integer> integers = measurePointMapper.select7DayDataNumByPointId(id);
            LineVo lineVo = new LineVo();
            lineVo.setName(unitName+"-"+name);
            lineVo.setType("line");
            lineVo.setData(integers);
            lineVos.add(lineVo);
        }

        chartVo.setNames(pointNames);
        chartVo.setLineVos(lineVos);
        return chartVo;

    }
}
