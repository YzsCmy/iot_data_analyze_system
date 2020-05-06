package com.yzs.manage.service;

import com.yzs.common.model.MeasurePoint;
import com.yzs.manage.web.vo.LineChartVo;
import com.yzs.manage.web.vo.PieVo;

import java.util.List;

public interface IMeasurePointService {


    List<MeasurePoint> findAll(Integer page, Integer size,String name);

    List<MeasurePoint> findAllInUnit(Integer page, Integer size,String unitId,String name);

    List<MeasurePoint> findAllInUnit(String unitId,String name);

    void save(MeasurePoint info);

    MeasurePoint findById(String id);

    void update(MeasurePoint MeasurePoint);

    List<PieVo> measDataAllUnitPie();

    List<PieVo> measDataInUnitPie(String unitId);

    List<PieVo> devicePie(String unitId);

    LineChartVo chartDataAllUnit();

    LineChartVo chartDataInUnit(String unitId);
}
