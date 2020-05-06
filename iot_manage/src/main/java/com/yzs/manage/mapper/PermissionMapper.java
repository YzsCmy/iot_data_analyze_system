package com.yzs.manage.mapper;

import com.yzs.common.model.Permission;
import org.apache.ibatis.annotations.Select;
import tk.mybatis.mapper.common.Mapper;

import java.util.List;

public interface PermissionMapper extends Mapper<Permission> {

    @Select("select * from permission where id in(select permission_id from role_permission where role_id=#{roleId})")
    List<Permission> findPermissionByRoleId(String roleId);

    @Select("select * from permission where id not in(select permission_id from role_permission where role_id=#{roleId})")
    List<Permission> findOtherPermissions(String roleId);
}
