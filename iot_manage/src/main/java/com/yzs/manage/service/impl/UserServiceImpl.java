package com.yzs.manage.service.impl;

import com.github.pagehelper.PageHelper;
import com.yzs.common.Exceptiion.IOTException;
import com.yzs.common.enums.ExceptionEnum;
import com.yzs.common.model.Role;
import com.yzs.common.model.Unit;
import com.yzs.common.utils.IdWorker;
import com.yzs.manage.mapper.RoleMapper;
import com.yzs.manage.mapper.UnitMapper;
import com.yzs.manage.mapper.UserMapper;
import com.yzs.manage.service.IUserService;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

@Service
@Transactional
public class UserServiceImpl implements IUserService {

    @Autowired
    private UserMapper userMapper;
    @Autowired
    private RoleMapper roleMapper;
    @Autowired
    private UnitMapper unitMapper;
    @Autowired
    private IdWorker idWorker;
    @Autowired
    private BCryptPasswordEncoder encoder;

    @Override
    public UserDetails loadUserByUsername(String s) throws UsernameNotFoundException {
        com.yzs.common.model.User userInfo = userMapper.findByUserName(s);
        if(userInfo==null){
            throw new UsernameNotFoundException("用户名或密码错误");
        }
        List<Role> roles = roleMapper.findRoleByUserId(userInfo.getId());
        List<SimpleGrantedAuthority> authorities = getAuthority(roles);

        User user = new User(userInfo.getUsername(),userInfo.getPassword()
                ,userInfo.getStatus()==0?false:true,true,true,true,authorities);
        return user;
    }

    public List<SimpleGrantedAuthority> getAuthority(List<Role> roles) {
        List<SimpleGrantedAuthority> list = new ArrayList<>();
        for (Role role:roles){

            list.add(new SimpleGrantedAuthority("ROLE_"+role.getName()));
        }
        return list;
    }

    @Override
    public void changePWD(String pwd, String repwd) {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        String name = authentication.getName();
        com.yzs.common.model.User user = userMapper.findByUserName(name);
        boolean matches = encoder.matches(pwd, user.getPassword());
        if(!matches){
            throw new IOTException(ExceptionEnum.PASSWORD_NOT_EQUAL);
        }else {
            //更新密码
            user.setPassword(encoder.encode(repwd));
            userMapper.updateByPrimaryKey(user);
        }
    }


    //@Override
    //public List<com.yzs.common.model.User> findAll() {
    //    return userMapper.findAll();
    //}

    @Override
    public void save(com.yzs.common.model.User info) {
        com.yzs.common.model.User user = userMapper.findByUserName(info.getUsername());

        if(user!=null){
            throw new IOTException(ExceptionEnum.USERNAME_IS_EXIST);
        }else {
            info.setId(idWorker.nextId()+"");
            String encode = encoder.encode(info.getPassword());
            info.setPassword(encode);
            userMapper.insert(info);
        }

    }

    @Override
    public com.yzs.common.model.User findById(String id) {
        return userMapper.findById(id);
    }

    @Override
    public void addRoleToUser(String userId, String[] ids) {
        for (String id:ids){
            userMapper.addRoleToUser(userId,id);
        }
    }

    @Override
    public List<com.yzs.common.model.User> findAll(Integer page, Integer size,String name) {
        PageHelper.startPage(page,size);
        return userMapper.findAll(name);
    }

    @Override
    public List<com.yzs.common.model.User> findAllInUnit(Integer page, Integer size, String unitId,String name) {
        if(StringUtils.isBlank(unitId)){
            unitId = getConcurrentUnitId();
        }
        PageHelper.startPage(page,size);
        return userMapper.findAllByUnitId(unitId,name);
    }
    @Override
    public List<com.yzs.common.model.User> findAll() {
        return userMapper.findAll("");
    }

    @Override
    public List<com.yzs.common.model.User> findAllInUnit(String unitId) {
        if(StringUtils.isBlank(unitId)){
            unitId = getConcurrentUnitId();
        }
        return userMapper.findAllByUnitId(unitId,"");
    }

    @Override
    public String getConcurrentUnitId() {
        String name = SecurityContextHolder.getContext().getAuthentication().getName();
        com.yzs.common.model.User user = userMapper.findByUserName(name);
        return user.getUnitId();
    }

    @Override
    public void update(com.yzs.common.model.User info) {
        //按需更新
        if(StringUtils.isBlank(info.getPhoneNum())){
            info.setPhoneNum(null);
        }
        //原来的用户
        com.yzs.common.model.User oldUser = userMapper.findById(info.getId());
        //查找是否存在同名用户
        com.yzs.common.model.User user = userMapper.findByUserName(info.getUsername());



        if(user!=null&&!oldUser.getUsername().equals(user.getUsername())){
            //用户名重复
            throw new IOTException(ExceptionEnum.USERNAME_IS_EXIST);
        }else {
            //info.setId(idWorker.nextId()+"");
            if(StringUtils.isBlank(info.getPassword())){
                info.setPassword(null);

            } else if(info.getPassword().equals(oldUser.getPassword())){
                info.setPassword(null);
            } else {

                String encode = encoder.encode(info.getPassword());
                info.setPassword(encode);
            }
            if(user==null){
                //判断用户是否是单元管理员
                List<Role> admin = oldUser.getRoles().stream().filter(role -> role.getName().equals("ADMIN"))
                        .collect(Collectors.toList());
                //更新单元管理员名称
                if(admin!=null&&admin.size()>0){
                    Unit unit = unitMapper.selectByPrimaryKey(oldUser.getUnitId());
                    unit.setManagerName(info.getUsername());
                    unitMapper.updateByPrimaryKey(unit);
                }
            }
            userMapper.updateByPrimaryKeySelective(info);
        }
    }

}
