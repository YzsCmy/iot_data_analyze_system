package com.yzs.manage.service;

import com.yzs.common.model.SysLog;

import java.util.List;

public interface ISysLogService {
    void save(SysLog sysLog);

    List<SysLog> findAll(Integer page, Integer size,String name);

}
