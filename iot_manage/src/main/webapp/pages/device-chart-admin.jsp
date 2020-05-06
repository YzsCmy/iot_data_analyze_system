<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
</head>

<body class="hold-transition skin-blue sidebar-mini">


			<!-- 内容头部 -->
			<section class="content-header">
			<h1>
				设备可视化 <small>全部设备</small>
			</h1>
			<ol class="breadcrumb">
				<li><a target="_parent" href="${pageContext.request.contextPath}/index.jsp"><i
						class="fa fa-dashboard"></i> 首页</a></li>
				<li><a
					href="javascript:void(0)">设备可视化</a></li>

				<li class="active">全部设备</li>
			</ol>
			</section>
			<!-- 内容头部 /-->

				<!-- 正文区域 -->
				<section class="content"> <!-- .box-body -->
                    <div class="row">
                        <div class="col-lg-6">
                            <div class="box box-primary ">

                                <div id="map1" style="margin:10px auto; padding: 0; height: 300px;" ></div>
                            </div>
                        </div>
                        <div class="col-lg-6">
                            <div class="box box-info">

                                <div id="map2" style="margin:10px auto;padding: 0; height: 300px;"></div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="box box-success ">

                                <div id="map3" style="margin:10px auto;padding: 0;height: 400px;" ></div>
                            </div>
                        </div>

                    </div>

				</section>
				<!-- 正文区域 /-->


		<!-- 模态框（Modal） -->
		<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog modal-sm">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
						<h4 class="modal-title" id="myModalLabel">提示</h4>
					</div>
					<div class="modal-body" id="mymsg"></div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">确定</button>
						<%--<button type="button" class="btn btn-primary">提交更改</button>--%>
					</div>
				</div><!-- /.modal-content -->
			</div><!-- /.modal -->
		</div>

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
		<script
			src="../plugins/input-mask/jquery.inputmask.date.extensions.js"></script>
		<script src="../plugins/input-mask/jquery.inputmask.extensions.js"></script>
		<script src="../plugins/datatables/jquery.dataTables.min.js"></script>
		<script src="../plugins/datatables/dataTables.bootstrap.min.js"></script>
		<script src="../plugins/chartjs/Chart.min.js"></script>
		<script src="../plugins/flot/jquery.flot.min.js"></script>
	<script>

        $(function () {

            var iframe = $('#content', window.parent.document)[0];

            iframe.style.height = 'auto';

            thisheight = iframe.contentWindow.document.documentElement.scrollHeight;

            iframe.style.height = thisheight + 51 +"px";

        });
        $(function () {
            var myChart1 = echarts.init(document.getElementById('map1'));
            var myChart2 = echarts.init(document.getElementById('map2'));
            var myChart3 = echarts.init(document.getElementById('map3'));
            var option1 = {
                title: {
                    text: '各种设备类型设备数'
                },
                tooltip: {},
                toolbox: {
                    show: true,
                    feature: {
                        saveAsImage: {}
                    }
                },
                series: [{
                    name: '设备数',
                    type: 'pie',    // 设置图表类型为饼图
                    radius: '55%',  // 饼图的半径，外半径为可视区尺寸（容器高宽中较小一项）的 55% 长度。
                    data:[          // 数据数组，name 为数据项名称，value 为数据项值

                    ]
                }]
            };
            var option2 = {
                title: {
                    text: '各种设备类型总数据量'
                },
                tooltip: {},
                toolbox: {
                    show: true,
                    feature: {
                        saveAsImage: {}
                    }
                },
                series: [{
                    name: '总数据量',
                    type: 'pie',    // 设置图表类型为饼图
                    radius: '55%',  // 饼图的半径，外半径为可视区尺寸（容器高宽中较小一项）的 55% 长度。
                    data:[          // 数据数组，name 为数据项名称，value 为数据项值

                    ]
                }]
            };
            var option3 = {
                title: {
                    text: '近七天各种设备数据流量'
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
                    data: ['设备名称']
                },
                xAxis: {
                    data: ['日期']
                },
                yAxis: {},
                series: [
                    {
                        name: '设备名称',
                        type: 'line',
                        data: ['每天新增数据量']
                    },
                    {

                    },
                ]
            };
            $.ajax({
                type: "GET",
                url: "${pageContext.request.contextPath}/chart/device/device.do",
                success: function(data){
                    if(data.flag==true){
                        console.log(data.data)
                        option1.series[0].data = data.data;

                        myChart1.setOption(option1);


                    }else {

                        console.log(data.message)
                    }
                }
            });
            $.ajax({
                type: "GET",
                url: "${pageContext.request.contextPath}/chart/device/deviceData.do",
                success: function(data){
                    if(data.flag==true){
                        console.log(data.data)

                        option2.series[0].data = data.data;

                        myChart2.setOption(option2);


                    }else {

                        console.log(data.message)
                    }
                }
            });
            $.ajax({
                type: "GET",
                url: "${pageContext.request.contextPath}/chart/device/dataPerType.do",
                success: function(data){
                    if(data.flag==true){
                        console.log(data.data)
                        var vo = data.data;
                        var unitNames = vo.names;
                        var dates = vo.dateList;
                        var series = vo.lineVos;
                        option3.legend.data = unitNames;
                        option3.xAxis.data = dates;
                        option3.series = series;

                        myChart3.setOption(option3);


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


        });

        // 设置激活菜单
        function setSidebarActive(tagUri) {
            var liObj = $("#" + tagUri);
            if (liObj.length > 0) {
                liObj.parent().parent().addClass("active");
                liObj.addClass("active");
            }
        }

        $(document)
            .ready(
                function() {

                    // 激活导航位置
                    setSidebarActive("admin-datalist");

                    // 列表按钮
                    $("#dataList td input[type='checkbox']")
                        .iCheck(
                            {
                                checkboxClass : 'icheckbox_square-blue',
                                increaseArea : '20%'
                            });
                    // 全选操作
                    $("#selall")
                        .click(
                            function() {
                                var clicks = $(this).is(
                                    ':checked');
                                if (!clicks) {
                                    $(
                                        "#dataList td input[type='checkbox']")
                                        .iCheck(
                                            "uncheck");
                                } else {
                                    $(
                                        "#dataList td input[type='checkbox']")
                                        .iCheck("check");
                                }
                                $(this).data("clicks",
                                    !clicks);
                            });
                });
	</script>
	<script src="../plugins/flot/jquery.flot.resize.min.js"></script>
	<script src="../plugins/flot/jquery.flot.pie.min.js"></script>
	<script src="../plugins/flot/jquery.flot.categories.min.js"></script>
	<script src="../plugins/ionslider/ion.rangeSlider.min.js"></script>
	<script src="../plugins/bootstrap-slider/bootstrap-slider.js"></script>
</body>

</html>