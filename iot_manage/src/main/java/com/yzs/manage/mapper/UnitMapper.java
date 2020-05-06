package com.yzs.manage.mapper;

import com.yzs.common.model.Unit;
import com.yzs.manage.web.vo.PieVo;
import org.apache.ibatis.annotations.Many;
import org.apache.ibatis.annotations.Result;
import org.apache.ibatis.annotations.Results;
import org.apache.ibatis.annotations.Select;
import tk.mybatis.mapper.common.Mapper;

import java.util.List;

public interface UnitMapper extends Mapper<Unit> {

    @Select("select name from unit where id=#{s}")
    String findNameById(String s);

    @Select("select * from unit where name=#{s}")
    @Results({
            @Result(id = true, property = "id", column = "id"),
            @Result(column = "name", property = "name"),
            @Result(column = "address", property = "address"),
            @Result(column = "manager_name", property = "managerName"),
            @Result(column = "manager_id", property = "managerId"),
            @Result(column = "id", property = "users", javaType = List.class, many =
            @Many(select = "com.yzs.manage.mapper.UserMapper.findAllByUnitId"))
    })
    Unit findByUnitName(String s);

    @Select("select * from unit")
    @Results({
            @Result(id = true, property = "id", column = "id"),
            @Result(column = "name", property = "name"),
            @Result(column = "address", property = "address"),
            @Result(column = "manager_name", property = "managerName"),
            @Result(column = "manager_id", property = "managerId")
            //@Result(column = "id", property = "users", javaType = List.class, many =
            //@Many(select = "com.yzs.manage.mapper.UserMapper.findAllByUnitId"))
    })
    List<Unit> findAll();





    @Select("select * from unit where id=#{id}")
    @Results({
            @Result(id = true, property = "id", column = "id"),
            @Result(column = "name", property = "name"),
            @Result(column = "address", property = "address"),
            @Result(column = "manager_name", property = "managerName"),
            @Result(column = "manager_id", property = "managerId"),
            @Result(column = "id", property = "users", javaType = List.class, many =
            @Many(select = "com.yzs.manage.mapper.UserMapper.findAllByUnitId"))
    })
    Unit findById(String id);


    @Select("SELECT unit.`name` `name` , COUNT(`user`.id) `value` " +
            "from unit LEFT OUTER JOIN `user` "+
            "ON `user`.unit_id = unit.id "+
            "GROUP BY unit.id")
    List<PieVo> selectUserNumPerUnit();

    @Select("SELECT unit.`name` `name` , COUNT(measure_point.id) `value` " +
            "from unit LEFT OUTER JOIN measure_point " +
            "ON measure_point.unit_id = unit.id  " +
            "GROUP BY unit.id")
    List<PieVo> selectMeasNumPerUnit();

    @Select("SELECT unit.`name` `name` , COUNT(device.id) `value` " +
            " from unit LEFT OUTER JOIN device " +
            " ON device.unit_id = unit.id " +
            " GROUP BY unit.id")
    List<PieVo> selectDeviceNumPerUnit();
    
    
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
            "  where device_data.unit_id=#{id} " +
            "  group by date(created_time) " +
            ") b on a.click_date = b.datetime " +
            " GROUP BY a.click_date ")
    List<Integer> select7DayDataNumByUnitId(String id);
    
    @Select("SELECT unit.`name` `name` , COUNT(device_data.id) `value`  " +
            "from unit LEFT OUTER JOIN device_data  " +
            "ON device_data.unit_id = unit.id  " +
            "GROUP BY unit.id")
    List<PieVo> selectDataPerUnit();


}
