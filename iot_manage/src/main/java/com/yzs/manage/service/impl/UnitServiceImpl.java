package com.yzs.manage.service.impl;

import com.github.pagehelper.PageHelper;
import com.yzs.common.Exceptiion.IOTException;
import com.yzs.common.enums.ExceptionEnum;
import com.yzs.common.model.*;
import com.yzs.common.utils.DateUtils;
import com.yzs.common.utils.IdWorker;
import com.yzs.manage.mapper.*;
import com.yzs.manage.service.IUnitService;
import com.yzs.manage.web.vo.LineChartVo;
import com.yzs.manage.web.vo.LineVo;
import com.yzs.manage.web.vo.PieVo;
import com.yzs.manage.web.vo.UnitShowVo;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;

@Service
@Transactional
public class UnitServiceImpl implements IUnitService {
    @Autowired
    private UnitMapper unitMapper;
    @Autowired
    private RoleMapper roleMapper;
    @Autowired
    private UserMapper userMapper;
    @Autowired
    private MeasurePointMapper measurePointMapper;
    @Autowired
    private DeviceDataMapper deviceDataMapper;
    @Autowired
    private DeviceMapper deviceMapper;
    @Autowired
    private IdWorker idWorker;

    @Override
    public List<Unit> findAllUnit() {
        return unitMapper.selectAll();
    }

    @Override
    public List<Unit> findAll(Integer page, Integer size) {
        PageHelper.startPage(page,size);
        return unitMapper.findAll();
    }

    @Override
    public void save(Unit info) {
        Unit unit = unitMapper.findByUnitName(info.getName());
        if(unit!=null){
            throw new IOTException(ExceptionEnum.UNITNAME_IS_EXIST);
        }
        info.setId(idWorker.nextId()+"");
        unitMapper.insert(info);
    }

    @Override
    public Unit findById(String id) {
        return unitMapper.findById(id);
    }

    @Override
    public void update(Unit info) {

        Unit unit = unitMapper.findByUnitName(info.getName());
        Unit oldUnit = unitMapper.findById(info.getId());
        if(unit!=null&&!unit.getId().equals(info.getId())){
            throw new IOTException(ExceptionEnum.UNITNAME_IS_EXIST);
        }
        if(StringUtils.isBlank(info.getManagerName())){
            info.setManagerName(userMapper.findById(info.getManagerId()).getUsername());
        }
        unitMapper.updateByPrimaryKey(info);
        //更换管理员
        if(!info.getManagerId().equals(oldUnit.getManagerId())){
            String oldManagerId = oldUnit.getManagerId();
            Role admin = roleMapper.findByName("ADMIN");
            userMapper.deleteRoleFromUser(oldManagerId,admin.getId());
            userMapper.addRoleToUser(info.getManagerId(),admin.getId());
        }


    }

    @Override
    public UnitShowVo countByUnitId(String id) {
        UnitShowVo unitShowVo = new UnitShowVo();
        MeasurePoint measurePoint = new MeasurePoint();
        measurePoint.setUnitId(id);
        User user = new User();
        user.setUnitId(id);
        Device device = new Device();
        device.setUnitId(id);
        DeviceData deviceData = new DeviceData();
        deviceData.setUnitId(id);
        int i = measurePointMapper.selectCount(measurePoint);
        int i1 = userMapper.selectCount(user);
        int i2 = deviceMapper.selectCount(device);
        int i3 = deviceDataMapper.selectCount(deviceData);
        unitShowVo.setMeasurePointNum(i);
        unitShowVo.setUserNum(i1);
        unitShowVo.setDeviceNum(i2);
        unitShowVo.setDataNum(i3);
        return unitShowVo;
    }

    @Override
    public List<PieVo> userPie() {
        return unitMapper.selectUserNumPerUnit();
    }

    @Override
    public List<PieVo> devicePie() {
        return unitMapper.selectDeviceNumPerUnit();
    }

    @Override
    public LineChartVo chartDataAllUnit() {
        LineChartVo chartVo = new LineChartVo();
        chartVo.setDateList(DateUtils.get7DayStr());

        List<Unit> all = unitMapper.findAll();
        ArrayList<String> unitNames = new ArrayList<>();
        ArrayList<LineVo> lineVos = new ArrayList<>();
        for (Unit unit : all) {
            String id = unit.getId();
            String name = unit.getName();
            unitNames.add(name);
            List<Integer> integers = unitMapper.select7DayDataNumByUnitId(id);
            LineVo lineVo = new LineVo();
            lineVo.setName(name);
            lineVo.setType("line");
            lineVo.setData(integers);
            lineVos.add(lineVo);
        }

        chartVo.setNames(unitNames);
        chartVo.setLineVos(lineVos);
        return chartVo;
    }

    @Override
    public LineChartVo chartDataInUnit(String unitId) {
        LineChartVo chartVo = new LineChartVo();
        chartVo.setDateList(DateUtils.get7DayStr());
        ArrayList<String> unitNames = new ArrayList<>();
        ArrayList<LineVo> lineVos = new ArrayList<>();
        Unit unit = unitMapper.selectByPrimaryKey(unitId);
        List<Integer> nums = unitMapper.select7DayDataNumByUnitId(unitId);
        String name = unit.getName();
        LineVo lineVo = new LineVo();
        lineVo.setName(name);
        lineVo.setType("line");
        lineVo.setData(nums);
        lineVos.add(lineVo);
        unitNames.add(name);
        chartVo.setLineVos(lineVos);
        chartVo.setNames(unitNames);
        return chartVo;
    }

    @Override
    public List<PieVo> measPie() {

        return unitMapper.selectMeasNumPerUnit();
    }

    @Override
    public List<PieVo> unitDataPie() {
        return unitMapper.selectDataPerUnit();
    }

    @Override
    public List<PieVo> measDataPie(String unitId) {
        return measurePointMapper.selectDataNumPerMeasByUnitId(unitId);
    }

    @Override
    public UnitShowVo countAll() {
        UnitShowVo unitShowVo = new UnitShowVo();
        MeasurePoint measurePoint = new MeasurePoint();
        User user = new User();
        Device device = new Device();
        DeviceData deviceData = new DeviceData();
        int i = measurePointMapper.selectCount(measurePoint);
        int i1 = userMapper.selectCount(user);
        int i2 = deviceMapper.selectCount(device);
        int i3 = deviceDataMapper.selectCount(deviceData);
        unitShowVo.setMeasurePointNum(i);
        unitShowVo.setUserNum(i1);
        unitShowVo.setDeviceNum(i2);
        unitShowVo.setDataNum(i3);
        return unitShowVo;
    }
}

