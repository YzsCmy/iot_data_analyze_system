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
					数据可视化 <small>设备数据可视化</small>
				</h1>
				<ol class="breadcrumb">
					<li><a target="_parent" href="${pageContext.request.contextPath}/index.jsp"><i
							class="fa fa-dashboard"></i> 首页</a></li>
					<li><a
							href="javascript:void(0)">数据可视化</a></li>

					<li class="active">设备数据可视化</li>
				</ol>
			</section>
			<!-- 内容头部 /-->

				<!-- 正文区域 -->
            <section class="content"> <!-- .box-body -->
				<div class="row">
					<div class="col-md-12">
						<div class="box box-primary ">
							<div class="box-header">

								<div class="row">

									<div class="col-md-4">
										<div class="input-group">
											<div class="input-group-addon">
												<i class="fa fa-bullseye"></i>
											</div>
											<select class="form-control select2" style="width: 100%"
                                                    onchange="changePoint(this.options[this.options.selectedIndex].value)"
													id="pointSelect" data-placeholder="请选择测点">
											</select>
										</div>
									</div>
									<div class="col-md-4">
										<div class="input-group">
											<div class="input-group-addon">
												<i class="fa fa-mobile"></i>
											</div>
											<select class="form-control select2" style="width: 100%"
                                                    onchange="changeDevice(this.options[this.options.selectedIndex].value)"
													id="deviceSelect" data-placeholder="请选择设备">
											</select>
										</div>
									</div>
									<div class="col-md-4">
										<div class="input-group">
											<div class="input-group-addon">
												<i class="fa fa-calendar"></i>
											</div>
											<input type="text" class="form-control pull-right" placeholder="请选择日期" id="mydatepicker">
										</div>
									</div>
								</div>
							</div>
                            <ul class="nav nav-list"><li class="nav-divider"></li></ul>
                            <div id="map2" style="margin:20px 10px;height: 500px;" ></div>
							<ul class="nav nav-list"><li class="nav-divider"></li></ul>
							<div id="map3" style="margin:20px 10px;height: 500px;" ></div>
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
        var myChart2 = echarts.init(document.getElementById('map2'));
        var myChart3 = echarts.init(document.getElementById('map3'));
        var option2 = {
            title: {
                text: '24小时设备数据走势'
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
                data: ['设备数据名称']
            },
            xAxis: {
                data: ['日期']
            },
            yAxis: {

            },
            series: [
                {
                    name: '设备数据名称',
                    type: 'line',
                    data: ['每天新增数据量']
                },
                {

                },
            ]
        };
        var option3 = {
            title: {
                text: '24小时设备数据增量'
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

        $(function () {

            var iframe = $('#content', window.parent.document)[0];

            iframe.style.height = 'auto';

            thisheight = iframe.contentWindow.document.documentElement.scrollHeight;

            iframe.style.height = thisheight + 51 +"px";

        });
        $('#mydatepicker').datepicker({
            autoclose: true,
			todayHighlight: true,
			defaultViewDate:'today',
            language: 'zh-CN',
            format: 'yyyy-mm-dd'
        });
        $('#mydatepicker').datepicker()
            .on('changeDate', function(ev) {

                var datestr = $('#mydatepicker').val();
                var deviceId = $("#deviceSelect option:selected").val();
                if(deviceId==undefined||deviceId.trim()==''){
                    $("#mymsg").text("请选择设备！")
                    $('#myModal').modal({
                        keyboard:false
                    })
                }else {

                    $.ajax({
                        type: "GET",
                        url: "${pageContext.request.contextPath}/chart/deviceData/dataValue.do",
                        data:{id:deviceId,date:datestr},
                        success: function(data){
                            if(data.flag==true){
                                console.log(data.data)
                                var vo = data.data.chartVo;
                                var unitNames = vo.names;
                                var dates = vo.dateList;
                                var series = vo.lineVos;
                                var unit = data.data.unit;
                                option2.legend.data = unitNames;
                                option2.xAxis.data = dates;
                                option2.yAxis = {
                                    axisLabel:{
                                        formatter:'{value}'+unit
                                    }
                                }
                                option2.series = series;

                                myChart2.setOption(option2);


                            }else {

                                console.log(data.message)
                            }
                        }
                    });

                    $.ajax({
                        type: "GET",
                        url: "${pageContext.request.contextPath}/chart/deviceData/data.do",
                        data:{id:deviceId,date:datestr},
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
                }

            });
        function deviceSelectInit(val) {
            console.log(val)
            //发起ajax,渲染测点下拉框
            $.ajax({
                type: "POST",
                url: "${pageContext.request.contextPath}/device/select.do",
                data: {pointId:val},
                success: function(data){
                    if(data.flag==true){
                        console.log(data.data)

                        var list = data.data;
                        $("#deviceSelect").empty()
                        for(k in list){
                            $("#deviceSelect").append('<option value="'+list[k].id+'">'+list[k].name+'</option>');
                        }
						$('#mydatepicker').datepicker("setDate",'now');

					}else {

                        console.log(data.data)
                    }
                }
            });

        }


        //初始化测点下拉框
        $(function () {

            $.ajax({
                type: "POST",
                url: "${pageContext.request.contextPath}/measurePoint/findByUnitId.do",
                data: {unitId:'${sessionScope.unitId}'},
                success: function(data){
                    if(data.flag==true){
                        console.log(data.data)

                        var list = data.data;
                        $("#pointSelect").empty()
                        $("#deviceSelect").empty()
                        for(k in list){
                            $("#pointSelect").append('<option value="'+list[k].id+'">'+list[k].name+'</option>');
                        }
                        //初始化设备下拉框
                        var pointId = $("#pointSelect option:selected").val();
                        deviceSelectInit(pointId)


                    }else {

                        console.log(data.data)
                    }
                }
            });

        })


        function changePoint(val) {
            console.log(val)
            //发起ajax,渲染测点下拉框
            $.ajax({
                type: "POST",
                url: "${pageContext.request.contextPath}/device/select.do",
                data: {pointId:val},
                success: function(data){
                    if(data.flag==true){
                        console.log(data.data)

                        var list = data.data;
                        $("#deviceSelect").empty()
                        for(k in list){
                            $("#deviceSelect").append('<option value="'+list[k].id+'">'+list[k].name+'</option>');
                        }
                        var deviceId = $("#deviceSelect option:selected").val();
                        changeDevice(deviceId)


                    }else {

                        console.log(data.data)
                    }
                }
            });

        }
        function changeDevice(val) {
            var datestr = $('#mydatepicker').val();
            console.log(val)

            $.ajax({
                type: "GET",
                url: "${pageContext.request.contextPath}/chart/deviceData/dataValue.do",
                data:{id:val,date:datestr},
                success: function(data){
                    if(data.flag==true){
                        console.log(data.data)
                        var vo = data.data.chartVo;
                        var unitNames = vo.names;
                        var dates = vo.dateList;
                        var series = vo.lineVos;
                        var unit = data.data.unit;
                        option2.legend.data = unitNames;
                        option2.xAxis.data = dates;
                        option2.yAxis = {
                            axisLabel:{
                                formatter:'{value}'+unit
                            }
                        }
                        option2.series = series;

                        myChart2.setOption(option2);


                    }else {

                        console.log(data.message)
                    }
                }
            });

            $.ajax({
                type: "GET",
                url: "${pageContext.request.contextPath}/chart/deviceData/data.do",
                data:{id:val,date:datestr},
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
        }








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