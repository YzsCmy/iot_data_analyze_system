package com.yzs.manage.service.impl;

import com.github.pagehelper.PageHelper;
import com.yzs.common.model.Role;
import com.yzs.common.utils.IdWorker;
import com.yzs.manage.mapper.RoleMapper;
import com.yzs.manage.mapper.UserMapper;
import com.yzs.manage.service.IRoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class RoleServiceImpl implements IRoleService {
    @Autowired
    private RoleMapper roleDao;
    @Autowired
    private UserMapper userMapper;
    @Autowired
    private IdWorker idWorker;
    @Override
    public List<Role> findAll(Integer page, Integer size) {
        PageHelper.startPage(page,size);
        return roleDao.selectAll();
    }

    @Override
    public void save(Role role) {
        role.setId(idWorker.nextId()+"");
        roleDao.insert(role);
    }

    @Override
    public List<Role> findOtherRoles(String id) {
        return userMapper.findOtherRoles(id);
    }

    @Override
    public Role findById(String id) {
        return roleDao.findById(id);
    }

    @Override
    public void addPermissionToRole(String roleId, String[] ids) {
        for (String id:ids){
            roleDao.addPermissionToRole(roleId,id);
        }
    }
}
