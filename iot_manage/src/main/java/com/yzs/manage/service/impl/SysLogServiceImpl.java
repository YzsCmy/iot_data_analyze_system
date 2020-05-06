package com.yzs.manage.service.impl;

import com.github.pagehelper.PageHelper;
import com.yzs.common.model.SysLog;
import com.yzs.common.utils.IdWorker;
import com.yzs.manage.mapper.SysLogMapper;
import com.yzs.manage.service.ISysLogService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import tk.mybatis.mapper.entity.Example;

import java.util.List;

@Service
@Transactional
public class SysLogServiceImpl implements ISysLogService {

    @Autowired
    private SysLogMapper sysLogDao;
    @Autowired
    private IdWorker idWorker;

    @Override
    public void save(SysLog sysLog) {
        sysLog.setId(idWorker.nextId()+"");
        sysLogDao.insert(sysLog);
    }

    @Override
    public List<SysLog> findAll(Integer page, Integer size,String name) {
        PageHelper.startPage(page,size);
        Example example = new Example(SysLog.class);
        example.setOrderByClause("visit_time desc");
        Example.Criteria criteria = example.createCriteria();
        criteria.andLike("username","%"+name+"%");
        return sysLogDao.selectByExample(example);
    }
}
