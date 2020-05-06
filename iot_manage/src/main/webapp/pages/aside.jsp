<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@taglib prefix="security" uri="http://www.springframework.org/security/tags" %>

<aside class="main-sidebar">
    <!-- sidebar: style can be found in sidebar.less -->
    <section class="sidebar">
        <!-- Sidebar user panel -->
        <div class="user-panel">
            <div class="pull-left image">
                <img src="${pageContext.request.contextPath}/img/user2-160x160.jpg"
                     class="img-circle" alt="User Image">
            </div>
            <div class="pull-left info">
                <p><security:authentication property="principal.username"></security:authentication></p>
                <a href="#"><i class="fa fa-circle text-success"></i> 在线</a>
            </div>
        </div>

        <!-- sidebar menu: : style can be found in sidebar.less -->
        <ul class="sidebar-menu">
            <li class="header">菜单</li>
            <li id="admin-index">
                <a target="content" href="${pageContext.request.contextPath}/home/main.do"><i class="fa fa-home"></i> <span>首页</span></a>
            </li>
            <security:authorize access="hasRole('ADMIN') or hasRole('ROOT')">
                <li class="treeview">
                    <a href="#"> <i class="fa fa-cogs"></i>
                        <span>系统管理</span> <span class="pull-right-container"> <i
                                class="fa fa-angle-left pull-right"></i>
				</span>

                    </a>
                    <ul class="treeview-menu">

                        <security:authorize access="hasRole('ROOT')">
                        <li id="system-setting">
                                <a target="content" href="${pageContext.request.contextPath}/user/findAll.do"> <i class="fa fa-circle-o"></i> 用户管理
                                </a>
                        </li>
                        </security:authorize>
                        <security:authorize access="(not hasRole('ROOT')) and hasRole('ADMIN')">
                        <li id="system-setting">
                                <a target="content" href="${pageContext.request.contextPath}/user/findAllInUnit.do"> <i class="fa fa-circle-o"></i> 用户管理
                                </a>
                        </li>
                        </security:authorize>
                        <security:authorize access="hasRole('ROOT')">
                            <li id="system-setting">
                                <a target="content" href="${pageContext.request.contextPath}/role/findAll.do"> <i class="fa fa-circle-o"></i> 角色管理
                                </a>
                            </li>
                            <li id="system-setting">
                                <a target="content" href="${pageContext.request.contextPath}/permission/findAll.do">
                                    <i class="fa fa-circle-o"></i> 资源权限管理
                                </a>
                            </li>
                            <li id="system-setting">
                                <a target="content" href="${pageContext.request.contextPath}/sysLog/findAll.do"> <i class="fa fa-circle-o"></i> 访问日志
                                </a>
                            </li>
                        </security:authorize>
                    </ul>
                </li>
            </security:authorize>
            <li class="treeview">
                <a href="#"> <i class="fa fa-cube"></i>
                    <span>基础数据</span> <span class="pull-right-container"> <i
                            class="fa fa-angle-left pull-right"></i>
				</span>
                </a>
                <ul class="treeview-menu">

                    <security:authorize access="hasRole('ROOT')">
                    <li id="system-setting">
                        <a target="content" href="${pageContext.request.contextPath}/unit/findAll.do">
                            <i class="fa fa-circle-o"></i> 单元管理
                        </a>
                    </li>
                    </security:authorize>
                    <security:authorize access="(not hasRole('ROOT')) and hasRole('ADMIN')">
                    <li id="system-setting">
                        <a target="content" href="${pageContext.request.contextPath}/unit/show.do?id=${sessionScope.unitId}">
                            <i class="fa fa-circle-o"></i> 单元管理
                        </a>
                    </li>
                    </security:authorize>

                    <security:authorize access="hasRole('ROOT')">
                    <li id="system-setting">
                        <a target="content" href="${pageContext.request.contextPath}/measurePoint/findAll.do"> <i class="fa fa-circle-o"></i> 测点管理
                        </a>
                    </li>
                    </security:authorize>
                    <security:authorize access="(not hasRole('ROOT')) and hasRole('ADMIN')">
                    <li id="system-setting">
                        <a target="content" href="${pageContext.request.contextPath}/measurePoint/findAllInUnit.do?unitId=${sessionScope.unitId}"> <i class="fa fa-circle-o"></i> 测点管理
                        </a>
                    </li>
                    </security:authorize>
                    <security:authorize access="hasRole('ROOT') or hasRole('ADMIN')">
                    <li id="system-setting">
                        <a target="content" href="${pageContext.request.contextPath}/deviceType/findAll.do"> <i class="fa fa-circle-o"></i> 设备类型
                        </a>
                    </li>
                    </security:authorize>

                    <li id="system-setting">
                        <a target="content" href="${pageContext.request.contextPath}/device/findAll.do">
                            <i class="fa fa-circle-o"></i> 设备管理
                        </a>
                    </li>

                </ul>
            </li>


            <li class="treeview">
                <a href="#"> <i class="fa fa-area-chart"></i>
                    <span>数据可视化</span> <span class="pull-right-container"> <i
                            class="fa fa-angle-left pull-right"></i>
										</span>

                </a>
                <ul class="treeview-menu">
                    <security:authorize access="hasRole('ROOT')">

                    <li id="system-setting">
                        <a target="content" href="${pageContext.request.contextPath}/pages/unit-chart.jsp"> <i class="fa fa-circle-o"></i> 单元可视化分析
                        </a>
                    </li>
                    </security:authorize>
                    <security:authorize access="not hasRole('ROOT')">

                    <li id="system-setting">
                        <a target="content" href="${pageContext.request.contextPath}/pages/unit-chart-show.jsp"> <i class="fa fa-circle-o"></i> 单元可视化分析
                        </a>
                    </li>
                    </security:authorize>
                    <security:authorize access="hasRole('ROOT')">
                    <li id="system-setting">
                        <a target="content" href="${pageContext.request.contextPath}/pages/meas-chart-admin.jsp"> <i class="fa fa-circle-o"></i> 测点可视化分析
                        </a>
                    </li>
                    </security:authorize>
                    <security:authorize access="not hasRole('ROOT')">
                    <li id="system-setting">
                        <a target="content" href="${pageContext.request.contextPath}/pages/meas-chart-user.jsp"> <i class="fa fa-circle-o"></i> 测点可视化分析
                        </a>
                    </li>
                    </security:authorize>
                    <security:authorize access="hasRole('ROOT')">
                    <li id="system-setting">
                        <a target="content" href="${pageContext.request.contextPath}/pages/device-chart-admin.jsp">
                            <i class="fa fa-circle-o"></i> 设备可视化分析
                        </a>
                    </li>
                    </security:authorize>
                    <security:authorize access="not hasRole('ROOT')">
                    <li id="system-setting">
                        <a target="content" href="${pageContext.request.contextPath}/pages/device-chart-user.jsp">
                            <i class="fa fa-circle-o"></i> 设备可视化分析
                        </a>
                    </li>
                    </security:authorize>
                    <security:authorize access="hasRole('ROOT')">
                    <li id="system-setting">
                        <a target="content" href="${pageContext.request.contextPath}/pages/devicedata-chart-admin.jsp"> <i class="fa fa-circle-o"></i> 设备可视化数据展示
                        </a>
                    </li>
                    </security:authorize>
                    <security:authorize access="not hasRole('ROOT')">
                    <li id="system-setting">
                        <a target="content" href="${pageContext.request.contextPath}/pages/devicedata-chart-user.jsp"> <i class="fa fa-circle-o"></i> 设备可视化数据展示
                        </a>
                    </li>
                    </security:authorize>
                </ul>
            </li>
            <security:authorize access="hasRole('ROOT')">
            <li id="admin-job">
                <a target="content" href="${pageContext.request.contextPath}/job/list.do"><i class="fa fa-dashboard"></i> <span>定时任务管理</span></a>
            </li>
            </security:authorize>
        </ul>
    </section>
    <!-- /.sidebar -->
</aside>