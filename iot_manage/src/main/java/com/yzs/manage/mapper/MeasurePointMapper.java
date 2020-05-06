package com.yzs.manage.mapper;

import com.yzs.common.model.MeasurePoint;
import com.yzs.manage.web.vo.PieVo;
import org.apache.ibatis.annotations.*;
import tk.mybatis.mapper.common.Mapper;

import java.util.List;

public interface MeasurePointMapper extends Mapper<MeasurePoint> {
    @Select("select name from measure_point where id=#{s}")
    String findNameById(String s);

    @Select("select * from measure_point where unit_id=#{s}")
    @Results({
            @Result(id = true, property = "id", column = "id"),
            @Result(column = "name", property = "name"),
            @Result(column = "status", property = "status"),
            @Result(column = "unit_id", property = "unitId"),
            @Result(column = "unit_id", property = "unitName",one =
            @One(select = "com.yzs.manage.mapper.UnitMapper.findNameById"))
            //@Result(column = "id", property = "users", javaType = List.class, many =
            //@Many(select = "com.yzs.manage.mapper.UserMapper.findAllByUnitId"))
    })
    List<MeasurePoint> findByUnitId(String s);


    @Select("select * from measure_point")
    @Results({
            @Result(id = true, property = "id", column = "id"),
            @Result(column = "name", property = "name"),
            @Result(column = "status", property = "status"),
            @Result(column = "unit_id", property = "unitId"),
            @Result(column = "unit_id", property = "unitName",one =
            @One(select = "com.yzs.manage.mapper.UnitMapper.findNameById"))
            //@Result(column = "id", property = "users", javaType = List.class, many =
            //@Many(select = "com.yzs.manage.mapper.UserMapper.findAllByUnitId"))
    })
    List<MeasurePoint> findAll();

    @Select("<script>"
            +"select * from measure_point where 1=1 "
            + "<if test='unitId!=null'>"
            +" and unit_id=#{unitId} "
            + "</if>"
            + "<if test='s!=null'>"
            +" and name like CONCAT('%',#{s},'%') "
            + "</if>"
            +"</script>")
    @Results({
            @Result(id = true, property = "id", column = "id"),
            @Result(column = "name", property = "name"),
            @Result(column = "status", property = "status"),
            @Result(column = "unit_id", property = "unitId"),
            @Result(column = "unit_id", property = "unitName",one =
            @One(select = "com.yzs.manage.mapper.UnitMapper.findNameById"))
            //@Result(column = "id", property = "users", javaType = List.class, many =
            //@Many(select = "com.yzs.manage.mapper.UserMapper.findAllByUnitId"))
    })
    List<MeasurePoint> findByQuery(@Param("s") String s,@Param("unitId") String unitId);





    @Select("select * from measure_point where id=#{id}")
    @Results({
            @Result(id = true, property = "id", column = "id"),
            @Result(column = "name", property = "name"),
            @Result(column = "status", property = "status"),
            @Result(column = "unit_id", property = "unitId"),
            @Result(column = "unit_id", property = "unitName",one =
            @One(select = "com.yzs.manage.mapper.UnitMapper.findNameById"))
    })
    MeasurePoint findById(String id);


    @Select("SELECT CONCAT(unit.`name`,'-',measure_point.`name`) `name` , COUNT(device_data.id) `value` " +
            "from measure_point LEFT OUTER JOIN device_data ON measure_point.id = device_data.point_id LEFT OUTER JOIN unit on measure_point.unit_id = unit.id " +
            "GROUP BY measure_point.id")
    List<PieVo> selectDataNumPerMeas();

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
            "  where device_data.point_id = #{id} " +
            "  group by date(created_time) " +
            ") b on a.click_date = b.datetime " +
            " GROUP BY a.click_date ")
    List<Integer> select7DayDataNumByPointId(String id);
    
    
    @Select("SELECT measure_point.`name` `name` , COUNT(device.id) `value`  " +
            "from measure_point  LEFT OUTER JOIN device " +
            "ON device.point_id = measure_point.id  " +
            "where measure_point.unit_id=#{unitId} " +
            "GROUP BY measure_point.id")
    List<PieVo> selectDeviceNumPerMeas(String unitId);

    @Select("SELECT measure_point.`name` `name` , COUNT(device_data.id) `value`  " +
            "from measure_point  LEFT OUTER JOIN device_data " +
            "ON device_data.point_id = measure_point.id  " +
            "where measure_point.unit_id=#{unitId} " +
            "GROUP BY measure_point.id")
    List<PieVo> selectDataNumPerMeasByUnitId(String unitId);
}
