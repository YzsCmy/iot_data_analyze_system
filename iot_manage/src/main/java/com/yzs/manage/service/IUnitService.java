package com.yzs.manage.service;

import com.yzs.common.model.Unit;
import com.yzs.manage.web.vo.LineChartVo;
import com.yzs.manage.web.vo.PieVo;
import com.yzs.manage.web.vo.UnitShowVo;

import java.util.List;

public interface IUnitService {

    List<Unit> findAllUnit();

    List<Unit> findAll(Integer page, Integer size);

    void save(Unit info);

    Unit findById(String id);

    void update(Unit unit);

    UnitShowVo countByUnitId(String id);

    UnitShowVo countAll();

    List<PieVo> userPie();

    List<PieVo> devicePie();

    LineChartVo chartDataAllUnit();

    LineChartVo chartDataInUnit(String unitId);

    List<PieVo> measPie();

    List<PieVo> unitDataPie();

    List<PieVo> measDataPie(String unitId);
}
