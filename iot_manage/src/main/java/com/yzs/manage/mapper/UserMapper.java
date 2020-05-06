package com.yzs.manage.mapper;

import com.yzs.common.model.Role;
import com.yzs.common.model.User;
import org.apache.ibatis.annotations.*;
import tk.mybatis.mapper.common.Mapper;

import java.util.List;

public interface UserMapper extends Mapper<User> {

    @Select("select * from user where username=#{s}")
    @Results({
            @Result(id = true, property = "id", column = "id"),
            @Result(column = "username", property = "username"),
            //@Result(column = "email", property = "email"),
            @Result(column = "password", property = "password"),
            @Result(column = "phone_num", property = "phoneNum"),
            @Result(column = "status", property = "status"),
            @Result(column = "unit_id", property = "unitId"),
            @Result(column = "unit_id", property = "unitName",one =
            @One(select = "com.yzs.manage.mapper.UnitMapper.findNameById")),
            @Result(column = "id", property = "roles", javaType = List.class, many =
            @Many(select = "com.yzs.manage.mapper.RoleMapper.findRoleByUserId"))
    })
    User findByUserName(String s);

    @Select("select * from user where username like CONCAT('%',#{s},'%')")
    @Results({
            @Result(id = true, property = "id", column = "id"),
            @Result(column = "username", property = "username"),
            //@Result(column = "email", property = "email"),
            @Result(column = "password", property = "password"),
            @Result(column = "phone_num", property = "phoneNum"),
            @Result(column = "status", property = "status"),
            @Result(column = "unit_id", property = "unitId"),
            @Result(column = "unit_id", property = "unitName",one =
            @One(select = "com.yzs.manage.mapper.UnitMapper.findNameById"))
            //@Result(column = "id", property = "roles", javaType = List.class, many =
            //@Many(select = "com.yzs.manage.mapper.RoleMapper.findRoleByUserId"))
    })
    List<User> findAll(@Param("s")String s);

    @Select("select * from user where unit_id=#{unitId} and username like CONCAT('%',#{s},'%')")
    @Results({
            @Result(id = true, property = "id", column = "id"),
            @Result(column = "username", property = "username"),
            //@Result(column = "email", property = "email"),
            @Result(column = "password", property = "password"),
            @Result(column = "phone_num", property = "phoneNum"),
            @Result(column = "status", property = "status"),
            @Result(column = "unit_id", property = "unitId"),
            @Result(column = "unit_id", property = "unitName",one =
            @One(select = "com.yzs.manage.mapper.UnitMapper.findNameById"))
            //@Result(column = "id", property = "roles", javaType = List.class, many =
            //@Many(select = "com.yzs.manage.mapper.RoleMapper.findRoleByUserId"))
    })
    List<User> findAllByUnitId(@Param("unitId")String unitId ,@Param("s")String s);

    @Insert("insert into user_role(user_id,role_id) values(#{userId},#{roleId})")
    void addRoleToUser(@Param("userId") String userId, @Param("roleId") String roleId);

    @Delete("delete from user_role where user_id=#{userId} and role_id=#{roleId}")
    void deleteRoleFromUser(@Param("userId") String userId, @Param("roleId") String roleId);

    @Select("select * from role where id not in(select role_id from user_role where user_id=#{userId})")
    List<Role> findOtherRoles(String userId);

    @Select("select * from user where id=#{id}")
    @Results({
            @Result(id = true, property = "id", column = "id"),
            @Result(column = "username", property = "username"),
            //@Result(column = "email", property = "email"),
            @Result(column = "password", property = "password"),
            @Result(column = "phone_num", property = "phoneNum"),
            @Result(column = "status", property = "status"),
            @Result(column = "unit_id", property = "unitId"),
            @Result(column = "unit_id", property = "unitName",one =
            @One(select = "com.yzs.manage.mapper.UnitMapper.findNameById")),
            @Result(column = "id", property = "roles", javaType = List.class, many =
            @Many(select = "com.yzs.manage.mapper.RoleMapper.findRoleByUserId"))
    })
    User findById(String id);


}
