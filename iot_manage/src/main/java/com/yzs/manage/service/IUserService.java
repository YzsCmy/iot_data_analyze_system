package com.yzs.manage.service;

import com.yzs.common.model.User;
import org.springframework.security.core.userdetails.UserDetailsService;

import java.util.List;

public interface IUserService extends UserDetailsService {
    void changePWD(String pwd, String repwd);

    //List<User> findAll();

    void save(User user);

    User findById(String id);

    void addRoleToUser(String userId, String[] ids);

    List<User> findAll(Integer page, Integer size,String name);
    List<User> findAllInUnit(Integer page, Integer size, String unitId,String name);
    List<User> findAll();
    List<User> findAllInUnit(String unitId);

    String getConcurrentUnitId();

    void update(User user);
}
