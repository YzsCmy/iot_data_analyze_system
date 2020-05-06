package com.yzs.manage.mapper;

import com.yzs.common.model.Device;
import com.yzs.manage.web.vo.PieVo;
import org.apache.ibatis.annotations.*;
import tk.mybatis.mapper.common.Mapper;

import java.util.List;

public interface DeviceMapper extends Mapper<Device> {
    @Select("select name from device where id=#{s}")
    String findNameById(String s);

    @Select("<script>"
            +"select * from device where 1=1 "
            + "<if test='typeId!=null'>"
            +" and type_id=#{typeId} "
            + "</if>"
            + "<if test='name!=null'> "
            +" and name like CONCAT('%',#{name},'%') "
            + "</if>"
            +"</script>")
    @Results({
            @Result(id = true, property = "id", column = "id"),
            @Result(column = "name", property = "name"),
            @Result(column = "status", property = "status"),
            @Result(column = "created_time", property = "createdTime"),
            @Result(column = "unit_id", property = "unitId"),
            @Result(column = "point_id", property = "pointId"),
            @Result(column = "type_id", property = "typeId"),
            @Result(column = "unit_id", property = "unitName",one =
            @One(select = "com.yzs.manage.mapper.UnitMapper.findNameById")),
            @Result(column = "point_id", property = "pointName",one =
            @One(select = "com.yzs.manage.mapper.MeasurePointMapper.findNameById")),
            @Result(column = "type_id", property = "typeName",one =
            @One(select = "com.yzs.manage.mapper.DeviceTypeMapper.findNameById"))
    })
    List<Device> findAll(@Param("typeId") String typeId,@Param("name") String name);

    @Select("<script>"
            +"select * from device where 1=1 "
            + "<if test='pointId!=null'>"
            +" and point_id=#{pointId} "
            + "</if>"
            +"<if test='typeId!=null'>"
            +" and type_id=#{typeId} "
            + "</if>"
            + "<if test='name!=null'>"
            +" and name like CONCAT('%',#{name},'%') "
            + "</if>"
            +"</script>")
    @Results({
            @Result(id = true, property = "id", column = "id"),
            @Result(column = "name", property = "name"),
            @Result(column = "status", property = "status"),
            @Result(column = "created_time", property = "createdTime"),
            @Result(column = "unit_id", property = "unitId"),
            @Result(column = "point_id", property = "pointId"),
            @Result(column = "type_id", property = "typeId"),
            @Result(column = "unit_id", property = "unitName",one =
            @One(select = "com.yzs.manage.mapper.UnitMapper.findNameById")),
            @Result(column = "point_id", property = "pointName",one =
            @One(select = "com.yzs.manage.mapper.MeasurePointMapper.findNameById")),
            @Result(column = "type_id", property = "typeName",one =
            @One(select = "com.yzs.manage.mapper.DeviceTypeMapper.findNameById"))
    })
    List<Device> findAllInMeasurePoint(@Param("pointId")String pointId,@Param("typeId")String typeId,@Param("name")String name);

    @Select("<script>"
            +"select * from device where 1=1 "
            + "<if test='unitId!=null'>"
            +" and unit_id=#{unitId}"
            + "</if>"
            +"<if test='typeId!=null'>"
            +" and type_id=#{typeId} "
            + "</if>"
            + "<if test='name!=null'>"
            +" and name like CONCAT('%',#{name},'%') "
            + "</if>"
            +"</script>")
    @Results({
            @Result(id = true, property = "id", column = "id"),
            @Result(column = "name", property = "name"),
            @Result(column = "status", property = "status"),
            @Result(column = "created_time", property = "createdTime"),
            @Result(column = "unit_id", property = "unitId"),
            @Result(column = "point_id", property = "pointId"),
            @Result(column = "type_id", property = "typeId"),
            @Result(column = "unit_id", property = "unitName",one =
            @One(select = "com.yzs.manage.mapper.UnitMapper.findNameById")),
            @Result(column = "point_id", property = "pointName",one =
            @One(select = "com.yzs.manage.mapper.MeasurePointMapper.findNameById")),
            @Result(column = "type_id", property = "typeName",one =
            @One(select = "com.yzs.manage.mapper.DeviceTypeMapper.findNameById"))
    })
    List<Device> findAllInUnit(@Param("unitId")String unitId,@Param("typeId")String typeId,@Param("name")String name);

    @Select("select * from device where id=#{id}")
    @Results({
            @Result(id = true, property = "id", column = "id"),
            @Result(column = "name", property = "name"),
            @Result(column = "status", property = "status"),
            @Result(column = "created_time", property = "createdTime"),
            @Result(column = "unit_id", property = "unitId"),
            @Result(column = "point_id", property = "pointId"),
            @Result(column = "type_id", property = "typeId"),
            @Result(column = "unit_id", property = "unitName",one =
            @One(select = "com.yzs.manage.mapper.UnitMapper.findNameById")),
            @Result(column = "point_id", property = "pointName",one =
            @One(select = "com.yzs.manage.mapper.MeasurePointMapper.findNameById")),
            @Result(column = "type_id", property = "typeName",one =
            @One(select = "com.yzs.manage.mapper.DeviceTypeMapper.findNameById"))
    })
    Device findById(String id);
    
    @Select("SELECT device_type.`name` `name` , COUNT(device.id) `value`  " +
            "from device_type LEFT OUTER JOIN device " +
            "ON device_type.id = device.type_id " +
            "GROUP BY device_type.id")
    List<PieVo> selectDeviceNumPerType();

    @Select("SELECT device_type.`name` `name` , COUNT(device_data.id) `value`  " +
            "from device_type LEFT OUTER JOIN device_data " +
            "ON device_type.id = device_data.type_id " +
            "GROUP BY device_type.id")
    List<PieVo> selectDataNumPerType();

    @Select("SELECT device_type.`name` `name` , COUNT(dev.id) `value`   " +
            "from device_type  " +
            "LEFT OUTER JOIN  (SELECT * from device where unit_id=#{unitId}) dev " +
            "ON device_type.id = dev.type_id  " +
            "GROUP BY device_type.id ")
    List<PieVo> selectDeviceNumPerTypeInUnit(String unitId);


    @Select("SELECT device.`name` `name` , COUNT(device_data.id) `value`  " +
            "from device LEFT OUTER JOIN device_data " +
            "ON device.id = device_data.device_id " +
            "where device.unit_id=#{unitId} " +
            "GROUP BY device.id")
    List<PieVo> selectDataNumPerDeviceInUnit(String unitId);


    @Select("select ifnull(b.count,0) as count " +
            "from ( " +
            "  SELECT date_sub(curdate(), interval 6 day) as click_date " +
            "    union all " +
            "    SELECT date_sub(curdate(), interval 5 day) as click_date " +
            "    union all " +
            "    SELECT date_sub(curdate(), interval 4 day) as click_date " +
            "    union all " +
            "    SELECT date_sub(curdate(), interval 3 day) as click_date " +
            "    union all " +
            "    SELECT date_sub(curdate(), interval 2 day) as click_date " +
            "    union all " +
            "    SELECT date_sub(curdate(), interval 1 day) as click_date " +
            "    union all " +
            "  SELECT curdate() as click_date " +
            " " +
            ") a left join ( " +
            "  select date(created_time) as datetime, count(*) as count " +
            "  from device_data " +
            "  where device_data.type_id = #{typeId} " +
            "  group by date(created_time) " +
            ") b on a.click_date = b.datetime " +
            " GROUP BY a.click_date ")
    List<Integer> select7DayDataNumByTypeId(String typeId);


    @Select("select ifnull(b.count,0) as count " +
            "from ( " +
            "  SELECT date_sub(curdate(), interval 6 day) as click_date " +
            "    union all " +
            "    SELECT date_sub(curdate(), interval 5 day) as click_date " +
            "    union all " +
            "    SELECT date_sub(curdate(), interval 4 day) as click_date " +
            "    union all " +
            "    SELECT date_sub(curdate(), interval 3 day) as click_date " +
            "    union all " +
            "    SELECT date_sub(curdate(), interval 2 day) as click_date " +
            "    union all " +
            "    SELECT date_sub(curdate(), interval 1 day) as click_date " +
            "    union all " +
            "  SELECT curdate() as click_date " +
            " " +
            ") a left join ( " +
            "  select date(created_time) as datetime, count(*) as count " +
            "  from device_data " +
            "  where device_data.device_id = #{deviceId} " +
            "  group by date(created_time) " +
            ") b on a.click_date = b.datetime " +
            " GROUP BY a.click_date ")
    List<Integer> select7DayDataNumByDeviceId(String deviceId);
    

}
