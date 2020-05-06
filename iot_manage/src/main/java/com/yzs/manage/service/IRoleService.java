package com.yzs.manage.service;

import com.yzs.common.model.Role;

import java.util.List;

public interface IRoleService {
    List<Role> findAll(Integer page, Integer size);

    void save(Role role);

    List<Role> findOtherRoles(String id);

    Role findById(String id);

    void addPermissionToRole(String roleId, String[] ids);

}
