package com.yzs.manage.service;

import com.github.pagehelper.PageInfo;
import com.yzs.common.model.DeviceData;
import com.yzs.common.model.JobAndTrigger;
import com.yzs.manage.web.vo.LineChartVo;

import java.util.List;

public interface IDeviceDataService {

    void save(DeviceData info);

    DeviceData findById(String id);

    List<DeviceData> findByDeviceId(Integer page, Integer size,String id);

    void update(DeviceData DeviceData);

    /**
     * 查询定时任务列表
     *
     * @param currentPage 当前页
     * @param pageSize    每页条数
     * @return 定时任务列表
     */
    PageInfo<JobAndTrigger> list(Integer currentPage, Integer pageSize);

    LineChartVo chartData(String date, String id);

    LineChartVo chartDataValue(String date, String id);
}
