package com.yzs.manage.mapper;

import com.yzs.common.model.Role;
import org.apache.ibatis.annotations.*;
import tk.mybatis.mapper.common.Mapper;

import java.util.List;

public interface RoleMapper extends Mapper<Role> {


    @Select("select * from role where id in(select role_id from user_role where user_id=#{userId})")
    @Results({
            @Result(id = true,property = "id",column = "id"),
            @Result(property = "name", column = "name"),
            @Result(property = "description", column = "description"),
            @Result(property = "permissions", column = "id",many = @Many(select = "com.yzs.manage.mapper.PermissionMapper.findPermissionByRoleId")),
    })
    List<Role> findRoleByUserId(String userId);

    @Insert("insert into role_permission(role_id,permission_id) values(#{roleId},#{permissionId})")
    void addPermissionToRole(@Param("roleId") String roleId, @Param("permissionId") String permissionId);

    @Select("select * from role where id=#{id}")
    @Results({
            @Result(id = true,property = "id",column = "id"),
            @Result(property = "name", column = "name"),
            @Result(property = "description", column = "description"),
            @Result(property = "permissions", column = "id",many = @Many(select = "com.yzs.manage.mapper.PermissionMapper.findPermissionByRoleId")),
    })
    Role findById(String id);
    @Select("select * from role where name=#{name}")
    @Results({
            @Result(id = true,property = "id",column = "id"),
            @Result(property = "name", column = "name"),
            @Result(property = "description", column = "description"),
            @Result(property = "permissions", column = "id",many = @Many(select = "com.yzs.manage.mapper.PermissionMapper.findPermissionByRoleId")),
    })
    Role findByName(String name);
}
