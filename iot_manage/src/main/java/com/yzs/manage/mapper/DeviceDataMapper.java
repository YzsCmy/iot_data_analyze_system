package com.yzs.manage.mapper;

import com.yzs.common.model.DeviceData;
import org.apache.ibatis.annotations.*;
import tk.mybatis.mapper.common.Mapper;

import java.util.List;

public interface DeviceDataMapper extends Mapper<DeviceData> {


    @Select("select * from device_data where id=#{id}")
    @Results({
            @Result(id = true, property = "id", column = "id"),
            @Result(column = "device_id", property = "name",one =
            @One(select = "com.yzs.manage.mapper.DeviceMapper.findNameById")),
            @Result(column = "value", property = "value"),
            @Result(column = "status", property = "status"),
            @Result(column = "created_time", property = "createdTime"),
            @Result(column = "unit_id", property = "unitId"),
            @Result(column = "point_id", property = "pointId"),
            @Result(column = "type_id", property = "typeId"),
            @Result(column = "device_id", property = "deviceId"),
            @Result(column = "unit_id", property = "unitName",one =
            @One(select = "com.yzs.manage.mapper.UnitMapper.findNameById")),
            @Result(column = "point_id", property = "pointName",one =
            @One(select = "com.yzs.manage.mapper.MeasurePointMapper.findNameById")),
            @Result(column = "type_id", property = "typeName",one =
            @One(select = "com.yzs.manage.mapper.DeviceTypeMapper.findNameById"))
    })
    DeviceData findById(String id);

    @Select("select * from device_data where device_id=#{id}")
    @Results({
            @Result(id = true, property = "id", column = "id"),
            @Result(column = "value", property = "value"),
            @Result(column = "status", property = "status"),
            @Result(column = "created_time", property = "createdTime"),
            @Result(column = "unit_id", property = "unitId"),
            @Result(column = "point_id", property = "pointId"),
            @Result(column = "type_id", property = "typeId"),
            @Result(column = "device_id", property = "deviceId"),
            @Result(column = "device_id", property = "name",one =
            @One(select = "com.yzs.manage.mapper.DeviceMapper.findNameById")),
            @Result(column = "unit_id", property = "unitName",one =
            @One(select = "com.yzs.manage.mapper.UnitMapper.findNameById")),
            @Result(column = "point_id", property = "pointName",one =
            @One(select = "com.yzs.manage.mapper.MeasurePointMapper.findNameById")),
            @Result(column = "type_id", property = "typeName",one =
            @One(select = "com.yzs.manage.mapper.DeviceTypeMapper.findNameById"))
    })
    List<DeviceData> findByDeviceId(String id);


    @Select("select sum(ifnull(b.count,0)) as count " +
            "from ( " +
            "  SELECT date_add(#{date}, interval 0 HOUR) as click_date " +
            "    union all " +
            "  SELECT date_add(#{date}, interval 2 HOUR) as click_date " +
            "    union all " +
            "  SELECT date_add(#{date}, interval 4 HOUR) as click_date " +
            "    union all " +
            "  SELECT date_add(#{date}, interval 6 HOUR) as click_date " +
            "    union all " +
            "  SELECT date_add(#{date}, interval 8 HOUR) as click_date " +
            "    union all " +
            "  SELECT date_add(#{date}, interval 10 HOUR) as click_date " +
            "    union all " +
            "  SELECT date_add(#{date}, interval 12 HOUR) as click_date " +
            "    union all " +
            "    SELECT date_add(#{date}, interval 14 HOUR) as click_date " +
            "    union all " +
            "    SELECT date_add(#{date}, interval 16 HOUR) as click_date " +
            "    union all " +
            "    SELECT date_add(#{date}, interval 18 HOUR) as click_date " +
            "    union all " +
            "    SELECT date_add(#{date}, interval 20 HOUR) as click_date " +
            "    union all " +
            "    SELECT date_add(#{date}, interval 22 HOUR) as click_date " +
            "  union all " +
            "    SELECT date_add('${date} 23:59:59', interval 0 HOUR) as click_date " +
            " " +
            ") a left join ( " +
            "  select TIMESTAMP(created_time) as datetime,COUNT(*) as count " +
            "  from device_data " +
            "  where device_data.device_id = #{deviceId} " +
            " GROUP BY created_time " +
            ") b on DAYOFYEAR(a.click_date) = DAYOFYEAR(b.datetime) and b.datetime>=DATE_SUB(a.click_date,INTERVAL 2 HOUR) and b.datetime<a.click_date " +
            "GROUP BY a.click_date ")
    List<Integer> select24HourPer2HourDataNumByDeviceId(@Param("deviceId") String deviceId, @Param("date") String date);
    
    @Select("select IFNULL(FLOOR(sum(ifnull(b.count,0))/sum(ifnull(b.countnum,0))) ,0) as aaa " +
            "from ( " +
            "  SELECT date_add(#{date}, interval 0 HOUR) as click_date " +
            "    union all " +
            "  SELECT date_add(#{date}, interval 2 HOUR) as click_date " +
            "    union all " +
            "  SELECT date_add( #{date}, interval 4 HOUR) as click_date " +
            "    union all " +
            "  SELECT date_add( #{date}, interval 6 HOUR) as click_date " +
            "    union all " +
            "  SELECT date_add( #{date}, interval 8 HOUR) as click_date " +
            "    union all " +
            "  SELECT date_add( #{date}, interval 10 HOUR) as click_date " +
            "    union all " +
            "  SELECT date_add( #{date}, interval 12 HOUR) as click_date " +
            "    union all " +
            "    SELECT date_add( #{date}, interval 14 HOUR) as click_date " +
            "    union all " +
            "    SELECT date_add( #{date}, interval 16 HOUR) as click_date " +
            "    union all " +
            "    SELECT date_add( #{date}, interval 18 HOUR) as click_date " +
            "    union all " +
            "    SELECT date_add( #{date}, interval 20 HOUR) as click_date " +
            "    union all " +
            "    SELECT date_add( #{date}, interval 22 HOUR) as click_date " +
            "  union all " +
            "    SELECT date_add('${date} 23:59:59', interval 0 HOUR) as click_date " +
            " " +
            ") a left join ( " +
            "  select TIMESTAMP(created_time) as datetime,device_data.`value` as count ,COUNT(*) as countnum " +
            "  from device_data " +
            "  where device_data.device_id = #{deviceId} " +
            " GROUP BY created_time " +
            ") b on DAYOFYEAR(a.click_date) = DAYOFYEAR(b.datetime) and b.datetime>=DATE_SUB(a.click_date,INTERVAL 2 HOUR) and b.datetime<a.click_date " +
            "GROUP BY a.click_date")
    List<Integer> select24HourPer2HourDataValueByDeviceId(@Param("deviceId") String deviceId, @Param("date") String date);

}
