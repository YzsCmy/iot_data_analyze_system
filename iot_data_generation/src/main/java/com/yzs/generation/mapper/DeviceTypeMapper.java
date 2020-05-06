package com.yzs.generation.mapper;

import org.apache.ibatis.annotations.Select;

public interface DeviceTypeMapper{
    @Select("select name from device_type where id=#{s}")
    String findNameById(String s);



}
