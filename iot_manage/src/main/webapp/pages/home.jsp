<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <!-- 页面meta -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">

    <title>IOT数据分析系统</title>
    <meta name="description" content="IOT数据分析系统">
    <meta name="keywords" content="IOT数据分析系统">

    <!-- Tell the browser to be responsive to screen width -->
    <meta
            content="width=device-width,initial-scale=1,maximum-scale=1,user-scalable=no"
            name="viewport">

    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/plugins/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/plugins/font-awesome/css/font-awesome.min.css">
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/plugins/ionicons/css/ionicons.min.css">
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/plugins/iCheck/square/blue.css">
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/plugins/morris/morris.css">
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/plugins/jvectormap/jquery-jvectormap-1.2.2.css">
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/plugins/datepicker/datepicker3.css">
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/plugins/daterangepicker/daterangepicker.css">
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.min.css">
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/plugins/datatables/dataTables.bootstrap.css">
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/plugins/treeTable/jquery.treetable.css">
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/plugins/treeTable/jquery.treetable.theme.default.css">
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/plugins/select2/select2.css">
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/plugins/colorpicker/bootstrap-colorpicker.min.css">
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/plugins/bootstrap-markdown/css/bootstrap-markdown.min.css">
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/plugins/adminLTE/css/AdminLTE.css">
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/plugins/adminLTE/css/skins/_all-skins.min.css">
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/css/style.css">
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/plugins/ionslider/ion.rangeSlider.css">
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/plugins/ionslider/ion.rangeSlider.skinNice.css">
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/plugins/bootstrap-slider/slider.css">

    <style type="text/css">
        .myicon{
            margin-top: 14px;
        }
    </style>
</head>

<body class="hold-transition skin-blue sidebar-mini">
    <section class="content">

    <!-- 统计数值 -->
    <div class="row">
        <div class="col-lg-3 col-xs-6">
            <!-- small box -->
            <div class="small-box bg-aqua">
                <div class="inner">
                    <h3 id="measNum">${unitInfo.measurePointNum}</h3>

                    <p>测点数</p>
                </div>
                <div class="icon">
                    <i class="fa fa-bullseye myicon"></i>
                </div>
                <security:authorize access="not hasRole('ADMIN')">
                    <p class="small-box-footer">&nbsp</p>
                </security:authorize>
                <security:authorize access="hasRole('ADMIN') and not hasRole('ROOT')">
                    <a href="${pageContext.request.contextPath}/measurePoint/findAllInUnit.do?unitId=${sessionScope.unitId}" class="small-box-footer">详细 <i class="fa fa-arrow-circle-right"></i></a>
                </security:authorize>
                <security:authorize access="hasRole('ROOT') ">
                    <a href="${pageContext.request.contextPath}/measurePoint/findAll.do" class="small-box-footer">详细 <i class="fa fa-arrow-circle-right"></i></a>
                </security:authorize>
            </div>
        </div>

        <div class="col-lg-3 col-xs-6">
            <!-- small box -->
            <div class="small-box bg-yellow">
                <div class="inner">
                    <h3 id="userNum">${unitInfo.userNum}</h3>

                    <p>用户数</p>
                </div>
                <div class="icon">
                    <i class="ion ion-person myicon" ></i>
                </div>
                <security:authorize access="not hasRole('ADMIN')">
                    <p class="small-box-footer">&nbsp</p>
                </security:authorize>
                <security:authorize access="hasRole('ADMIN') and not hasRole('ROOT')">
                    <a href="${pageContext.request.contextPath}/user/findAllInUnit.do?unitId=${sessionScope.unitId}" class="small-box-footer">详细 <i class="fa fa-arrow-circle-right"></i></a>
                </security:authorize>
                <security:authorize access="hasRole('ROOT')">
                    <a href="${pageContext.request.contextPath}/user/findAll.do" class="small-box-footer">详细 <i class="fa fa-arrow-circle-right"></i></a>
                </security:authorize>
            </div>
        </div>
        <!-- ./col -->
        <div class="col-lg-3 col-xs-6">
            <!-- small box -->
            <div class="small-box bg-green">
                <div class="inner">
                    <h3 id="deviceNum">${unitInfo.deviceNum}</h3>

                    <p>设备数</p>
                </div>
                <div class="icon">
                    <i class="ion ion-stats-bars myicon" ></i>
                </div>
                <security:authorize access="not hasRole('ADMIN')">
                    <p class="small-box-footer">&nbsp</p>
                </security:authorize>
                <security:authorize access="hasRole('ADMIN') and not hasRole('ROOT')">
                    <a href="${pageContext.request.contextPath}/device/findAllInUnit.do?unitId=${sessionScope.unitId}" class="small-box-footer">详细 <i class="fa fa-arrow-circle-right"></i></a>
                </security:authorize>
                <security:authorize access="hasRole('ROOT')">
                    <a href="${pageContext.request.contextPath}/device/findAll.do" class="small-box-footer">详细 <i class="fa fa-arrow-circle-right"></i></a>
                </security:authorize>
            </div>
        </div>
        <!-- ./col -->

        <!-- ./col -->
        <div class="col-lg-3 col-xs-6">
            <!-- small box -->
            <div class="small-box bg-red">
                <div class="inner">
                    <h3 id="dataNum">${unitInfo.dataNum}</h3>

                    <p>数据量</p>
                </div>
                <div class="icon">
                    <i class="ion ion-pie-graph myicon"></i>
                </div>
                <p class="small-box-footer">&nbsp</p>
            </div>
        </div>
        <!-- ./col -->
    </div>
    <!-- /.row -->

    <div class="row">

        <div class="col-lg-6">
            <div class="box box-info ">
                <div class="box-body">
                    <div id="map1" style="margin:10px 10px;height: 300px;" ></div>
                </div>
            </div>
        </div>
        <div class="col-lg-6">
            <div class="box box-success">
                <div class="box-body">
                    <div id="map2" style="margin:10px 10px;height: 300px;"></div>
                </div>
            </div>
        </div>
    </div>


    <!-- 单元 -->
    <div class="box box-primary">
        <div class="box-header with-border">
            <i class="fa fa-cube"></i>
            <h3 class="box-title">单元信息</h3>
        </div>

        <div class="box-body">

            <!-- 数据表格 -->
            <div class="table-box">

                <!--数据列表-->
                <table id="dataList" class="table table-bordered table-striped table-hover dataTable">
                    <thead>
                    <tr>
                        <th class="">ID</th>
                        <th class="">单元名称</th>
                        <th class="">地址</th>
                        <th class="">单元管理员</th>
                        <security:authorize access="hasRole('ADMIN') or hasRole('ROOT')">
                            <th class="text-center">操作</th>
                        </security:authorize>
                    </tr>
                    </thead>
                    <tbody>

                    <c:forEach items="${list}" var="unit">
                        <tr>
                            <td>${unit.id}</td>
                            <td>${unit.name}</td>
                            <td>${unit.address}</td>
                            <td>${unit.managerName}</td>
                            <security:authorize access="hasRole('ADMIN') or hasRole('ROOT')">
                                <td class="text-center">
                                    <button type="button" class="btn bg-olive btn-xs" onclick='location.href="${pageContext.request.contextPath}/unit/edit.do?id=${unit.id}"'>编辑</button>
                                </td>
                            </security:authorize>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
                <!--数据列表/-->

            </div>
            <!-- 数据表格 /-->

        </div>
        <!-- /.box-body -->

    </div>
    <!-- 单元 /-->


</section>


<script src="../plugins/echarts/echarts.min.js"></script>

<script src="../plugins/jQuery/jquery-2.2.3.min.js"></script>
<script src="../plugins/jQueryUI/jquery-ui.min.js"></script>
<script>
    $.widget.bridge('uibutton', $.ui.button);
</script>
<script src="../plugins/bootstrap/js/bootstrap.min.js"></script>
<script src="../plugins/raphael/raphael-min.js"></script>
<script src="../plugins/morris/morris.min.js"></script>
<script src="../plugins/sparkline/jquery.sparkline.min.js"></script>
<script src="../plugins/jvectormap/jquery-jvectormap-1.2.2.min.js"></script>
<script src="../plugins/jvectormap/jquery-jvectormap-world-mill-en.js"></script>
<script src="../plugins/knob/jquery.knob.js"></script>
<script src="../plugins/daterangepicker/moment.min.js"></script>
<script src="../plugins/daterangepicker/daterangepicker.js"></script>
<script src="../plugins/daterangepicker/daterangepicker.zh-CN.js"></script>
<script src="../plugins/datepicker/bootstrap-datepicker.js"></script>
<script
        src="../plugins/datepicker/locales/bootstrap-datepicker.zh-CN.js"></script>
<script
        src="../plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.all.min.js"></script>
<script src="../plugins/slimScroll/jquery.slimscroll.min.js"></script>
<script src="../plugins/fastclick/fastclick.js"></script>
<script src="../plugins/iCheck/icheck.min.js"></script>
<script src="../plugins/adminLTE/js/app.min.js"></script>
<script src="../plugins/treeTable/jquery.treetable.js"></script>
<script src="../plugins/select2/select2.full.min.js"></script>
<script src="../plugins/colorpicker/bootstrap-colorpicker.min.js"></script>
<script
        src="../plugins/bootstrap-wysihtml5/bootstrap-wysihtml5.zh-CN.js"></script>
<script src="../plugins/bootstrap-markdown/js/bootstrap-markdown.js"></script>
<script
        src="../plugins/bootstrap-markdown/locale/bootstrap-markdown.zh.js"></script>
<script src="../plugins/bootstrap-markdown/js/markdown.js"></script>
<script src="../plugins/bootstrap-markdown/js/to-markdown.js"></script>
<script src="../plugins/ckeditor/ckeditor.js"></script>
<script src="../plugins/input-mask/jquery.inputmask.js"></script>
<script src="../plugins/input-mask/jquery.inputmask.date.extensions.js"></script>
<script src="../plugins/input-mask/jquery.inputmask.extensions.js"></script>
<script src="../plugins/datatables/jquery.dataTables.min.js"></script>
<script src="../plugins/datatables/dataTables.bootstrap.min.js"></script>
<script src="../plugins/chartjs/Chart.min.js"></script>
<script src="../plugins/flot/jquery.flot.min.js"></script>
<script src="../plugins/flot/jquery.flot.resize.min.js"></script>
<script src="../plugins/flot/jquery.flot.pie.min.js"></script>
<script src="../plugins/flot/jquery.flot.categories.min.js"></script>
<script src="../plugins/ionslider/ion.rangeSlider.min.js"></script>
<script src="../plugins/bootstrap-slider/bootstrap-slider.js"></script>
<script>
    $(function () {

        var iframe = $('#content', window.parent.document)[0];

        iframe.style.height = 'auto';

        thisheight = iframe.contentWindow.document.documentElement.scrollHeight;

        iframe.style.height = thisheight + 51 +"px";

    });
    $(function () {

        var id = String('${sessionScope.unitId == null?"":sessionScope.unitId}')
        console.log(id)
        var myChart1 = echarts.init(document.getElementById('map1'));
        var myChart2 = echarts.init(document.getElementById('map2'));
        var option2 = {
            title: {
                text: '各个单元数据量'

            },
            tooltip: {},
            toolbox: {
                show: true,
                feature: {
                    saveAsImage: {}
                }
            },
            series: [{
                name: '数据量',
                type: 'pie',    // 设置图表类型为饼图
                radius: '55%',  // 饼图的半径，外半径为可视区尺寸（容器高宽中较小一项）的 55% 长度。
                data:[          // 数据数组，name 为数据项名称，value 为数据项值

                ]
            }]
        };

        var option1 = {
            title: {
                text: '近七天各个单元数据流量'
            },
            tooltip: {},
            toolbox: {
                show: true,
                feature: {
                    magicType: {
                        type: ['line', 'bar']
                    },
                    saveAsImage: {}
                }
            },
            legend: {
                y:'bottom',
                data: ['单元名称']
            },
            xAxis: {
                data: ['日期']
            },
            yAxis: {},
            series: [
                {
                    name: '单元名称',
                    type: 'line',
                    data: ['每天新增数据量']
                },
                {

                },
            ]
        };

        $.ajax({
            type: "GET",
            url: "${pageContext.request.contextPath}/home/data.do",
            data:{unitId:id},
            success: function(data){
                if(data.flag==true){
                    console.log(data.data)
                    if(id!=''){
                        option1.title.text = "近七天单元数据流量"
                    }
                    var vo = data.data;
                    var unitNames = vo.names;
                    var dates = vo.dateList;
                    var series = vo.lineVos;
                    option1.legend.data = unitNames;
                    option1.xAxis.data = dates;
                    option1.series = series;

                    myChart1.setOption(option1);



                }else {

                    console.log(data.message)
                }
            }
        });
        $.ajax({
            type: "GET",
            url: "${pageContext.request.contextPath}/home/pie.do",
            data:{unitId:id},
            success: function(data){
                if(data.flag==true){
                    console.log(data.data)
                    if(id!=''){
                        option2.title.text = "各个测点数据总量"
                    }

                    option2.series[0].data = data.data;

                    myChart2.setOption(option2);


                }else {

                    console.log(data.message)
                }
            }
        });



    })
    $(document).ready(function() {
        // 选择框
        $(".select2").select2();

        // WYSIHTML5编辑器
        $(".textarea").wysihtml5({
            locale : 'zh-CN'
        });
        $("#collapse-table").treetable({
            expandable : true
        });
    });

    // 设置激活菜单
    function setSidebarActive(tagUri) {
        var liObj = $("#" + tagUri);
        if (liObj.length > 0) {
            liObj.parent().parent().addClass("active");
            liObj.addClass("active");
        }
    }

    $(document).ready(function() {

        // 激活导航位置
        setSidebarActive("admin-datalist");

        // 列表按钮
        $("#dataList td input[type='checkbox']").iCheck({
            checkboxClass : 'icheckbox_square-blue',
            increaseArea : '20%'
        });
        // 全选操作
        $("#selall").click(function() {
            var clicks = $(this).is(':checked');
            if (!clicks) {
                $("#dataList td input[type='checkbox']").iCheck("uncheck");
            } else {
                $("#dataList td input[type='checkbox']").iCheck("check");
            }
            $(this).data("clicks", !clicks);
        });
    });
</script>
</body>

</html>
