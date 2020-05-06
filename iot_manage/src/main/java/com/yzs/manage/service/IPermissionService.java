package com.yzs.manage.service;

import com.yzs.common.model.Permission;

import java.util.List;

public interface IPermissionService {
    List<Permission> findAll(Integer page, Integer size);

    void save(Permission permission);

    List<Permission> findOtherPermissions(String id);
}
