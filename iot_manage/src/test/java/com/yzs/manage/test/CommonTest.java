package com.yzs.manage.test;

import com.yzs.common.model.Device;
import com.yzs.common.model.Role;
import com.yzs.common.model.Unit;
import com.yzs.common.model.User;
import com.yzs.common.utils.IdWorker;
import com.yzs.manage.mapper.*;
import com.yzs.manage.web.vo.LineVo;
import com.yzs.manage.web.vo.PieVo;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.test.context.junit4.SpringRunner;
import tk.mybatis.mapper.entity.Example;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@RunWith(SpringRunner.class)
@SpringBootTest
public class CommonTest {

    @Autowired
    private DeviceMapper deviceMapper;
    @Autowired
    private UserMapper userMapper;
    @Autowired
    private UnitMapper unitMapper;
    @Autowired
    private RoleMapper roleMapper;
    @Autowired
    private PermissionMapper permissionMapper;
    @Autowired
    private DeviceDataMapper deviceDataMapper;
    @Autowired
    private IdWorker idWorker;

    private BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();

    @Test
    public void deviceTest() {
        Device device = new Device();
        device.setId(idWorker.nextId()+"");
        device.setCreatedTime(new Date());
        device.setName("cc");
        deviceMapper.insertSelective(device);

    }
    @Test
    public void userTest() {
        //User user = new User();
        //user.setId(idWorker.nextId()+"");
        //user.setUsername("张三");
        //user.setPassword(encoder.encode("zs"));
        //userMapper.insertSelective(user);
        Example example = new Example(Role.class);
        Example.Criteria criteria = example.createCriteria();
        criteria.andEqualTo("name","root");
        List<Role> roles = roleMapper.selectByExample(example);
        Role role = roles.get(0);
        Example example1 = new Example(User.class);
        Example.Criteria criteria1 = example1.createCriteria();
        criteria1.andEqualTo("username","admin");
        List<User> users = userMapper.selectByExample(example1);
        User user = users.get(0);
        userMapper.addRoleToUser(user.getId(),role.getId());
    }
    @Test
    public void unitTest() {
        Unit unit = new Unit();
        unit.setId(idWorker.nextId()+"");
        unit.setAddress("张三的住址");
        unit.setName("张三的家");
        unit.setManagerName("张三");
        unitMapper.insertSelective(unit);
    }
    @Test
    public void roleTest(){
        //Role role = new Role();
        //role.setId(idWorker.nextId()+"");
        //role.setDescription("普通用户");
        //role.setName("user");
        //roleMapper.insertSelective(role);


    }
    @Test
    public void permissionTest(){

    }
    @Test
    public void deviceDateTest(){

    }
    @Test
    public void charTest(){

        List<PieVo> pieVos = unitMapper.selectUserNumPerUnit();
        System.out.println(pieVos);

        System.out.println("------------------------------------");
        List<PieVo> pieVos1 = unitMapper.selectDeviceNumPerUnit();
        System.out.println(pieVos1);
        System.out.println("------------------------------------");

        List<Unit> all = unitMapper.findAll();
        ArrayList<LineVo> lineVos = new ArrayList<>();
        for (Unit unit : all) {
            String id = unit.getId();
            String name = unit.getName();
            List<Integer> integers = unitMapper.select7DayDataNumByUnitId(id);
            LineVo lineVo = new LineVo();
            lineVo.setName(name);
            lineVo.setType("line");
            lineVo.setData(integers);
            lineVos.add(lineVo);
        }
        System.out.println(lineVos);

    }
}
