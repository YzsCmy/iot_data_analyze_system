package com.yzs.manage.mapper;

import com.yzs.common.model.DeviceType;
import org.apache.ibatis.annotations.Select;
import tk.mybatis.mapper.common.Mapper;

public interface DeviceTypeMapper extends Mapper<DeviceType> {
    @Select("select name from device_type where id=#{s}")
    String findNameById(String s);



}
