# iot_data_analyze_system

部署：

    1、安装mysql,kafka
    
    2、创建名为 data_analyze_sys 的数据库
    
    3、导入data_analyze_sys.sql
    
    4、运行ManageApplication、GenerationApplication，浏览器访问localhost

    尝试使用mysql dump或DBeaver恢复数据库的功能 导入data_analyze_sys.sql

    初始用户名密码：admin

    数据生成主体逻辑：新增设备 -> 触发数据定时任务的创建 -> 设备数据定时生成

所用技术：springboot+springsecurity+mybatis+kafka+ECharts+adminLTE

springsecurity实现系统用户的角色权限控制

kafka实现系统间的通信

ECharts完成可视化图表的渲染

Quratz实现数据定时生成

搭建模板参考https://github.com/xkcoding/spring-boot-demo/tree/master/demo-task-quartz


前端界面用的是adminLTE
##### 系统首页

###### 初始用户名密码：admin

[![YEN1kF.md.jpg](https://s1.ax1x.com/2020/05/06/YEN1kF.md.jpg)](https://imgchr.com/i/YEN1kF)


### 项目包含了数据后台管理系统与数据采集系统

![YENQTU.png](https://s1.ax1x.com/2020/05/06/YENQTU.png)

##### 数据采集系统包括定时任务的管理功能和数据的生成功能
![YENKmV.png](https://s1.ax1x.com/2020/05/06/YENKmV.png)

##### 数据后台管理系统功能模块设计
![YENMwT.png](https://s1.ax1x.com/2020/05/06/YENMwT.png)


