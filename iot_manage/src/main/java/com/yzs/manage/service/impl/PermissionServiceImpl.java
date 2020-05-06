package com.yzs.manage.service.impl;

import com.github.pagehelper.PageHelper;
import com.yzs.common.model.Permission;
import com.yzs.common.utils.IdWorker;
import com.yzs.manage.mapper.PermissionMapper;
import com.yzs.manage.service.IPermissionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class PermissionServiceImpl implements IPermissionService {
    @Autowired
    private PermissionMapper permissionDao;
    @Autowired
    private IdWorker idWorker;

    @Override
    public List<Permission> findAll(Integer page, Integer size) {
        PageHelper.startPage(page,size);
        return permissionDao.selectAll();
    }

    @Override
    public void save(Permission permission) {
        permission.setId(idWorker.nextId()+"");
        permissionDao.insert(permission);
    }

    @Override
    public List<Permission> findOtherPermissions(String id) {
        return permissionDao.findOtherPermissions(id);
    }
}
