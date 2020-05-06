package com.yzs.manage.mapper;

import com.yzs.common.model.SysLog;
import tk.mybatis.mapper.common.Mapper;

public interface SysLogMapper extends Mapper<SysLog> {
    //@Insert("insert into syslog(visitTime,username,ip,url,executionTime,method) values(#{visitTime},#{username},#{ip},#{url},#{executionTime},#{method})")
    //void save(SysLog sysLog);
    //
    //@Select("select * from syslog")
    //List<SysLog> findAll();

}
