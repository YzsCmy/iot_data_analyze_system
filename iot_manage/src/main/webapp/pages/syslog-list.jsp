<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/plugins/bootstrap-datetimepicker/bootstrap-datetimepicker.css">
</head>

<%--<body class="hold-transition skin-blue sidebar-mini">--%>

	<%--<div class="wrapper">--%>

		<%--<!-- 页面头部 -->--%>
		<%--<jsp:include page="header.jsp"></jsp:include>--%>
		<%--<!-- 页面头部 /-->--%>

		<%--<!-- 导航侧栏 -->--%>
		<%--<jsp:include page="aside.jsp"></jsp:include>--%>
		<%--<!-- 导航侧栏 /-->--%>

		<%--<!-- 内容区域 -->--%>
		<%--<div class="content-wrapper">--%>

			<!-- 内容头部 -->
			<section class="content-header">
			<h1>
				日志管理 <small>全部日志</small>
			</h1>
			<ol class="breadcrumb">
				<li><a target="_parent" href="${pageContext.request.contextPath}/index.jsp"><i
						class="fa fa-dashboard"></i> 首页</a></li>
				<li><a
					href="${pageContext.request.contextPath}/sysLog/findAll.do">日志管理</a></li>

				<li class="active">全部日志</li>
			</ol>
			</section>
			<!-- 内容头部 /-->

			<!-- 正文区域 -->
			<section class="content"> <!-- .box-body -->
			<div class="box box-primary">
				<%--<div class="box-header with-border">--%>
					<%--<h3 class="box-title">列表</h3>--%>
				<%--</div>--%>

				<div class="box-body">

					<!-- 数据表格 -->
					<div class="table-box">

						<!--工具栏-->
						<div class="pull-left">
							<div class="form-group form-inline">
								<div class="btn-group">
									<button type="button" class="btn btn-default" title="刷新"
										onclick="window.location.reload();">
										<i class="fa fa-refresh"></i> 刷新
									</button>
								</div>
							</div>
						</div>
						<div class="box-tools pull-right">
							<div class="has-feedback">
								<input type="text" class="form-control input-sm"
									placeholder="搜索" id="q-log"> <span
									class="glyphicon glyphicon-search form-control-feedback"></span>
							</div>
						</div>
						<!--工具栏/-->

						<!--数据列表-->
						<table id="dataList"
							class="table table-bordered table-striped table-hover dataTable">
							<thead>
								<tr>
									<th class="" style="padding-right: 0px"><input id="selall"
										type="checkbox" class="icheckbox_square-blue"></th>
									<th class="sorting_asc">ID</th>
									<th class="sorting">访问时间</th>
									<th class="sorting">访问用户</th>
									<th class="sorting">访问IP</th>
									<th class="sorting">资源URL</th>
									<th class="sorting">执行时间</th>
									<th class="sorting">访问方法</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${pageInfo.list}" var="syslog">
									<tr>
										<td><input name="ids" type="checkbox"></td>
										<td>${syslog.id}</td>
										<td>${syslog.visitTimeStr }</td>
										<td>${syslog.username }</td>
										<td>${syslog.ip }</td>
										<td>${syslog.url}</td>
										<td>${syslog.executionTime}毫秒</td>
										<td>${syslog.method}</td>										
									</tr>
								</c:forEach>
							</tbody>

						</table>
						<!--数据列表/-->

						<%--<!--工具栏-->--%>
						<%--<div class="pull-left">--%>
							<%--<div class="form-group form-inline">--%>
								<%--<div class="btn-group">--%>
									<%--<button type="button" class="btn btn-default" title="刷新"--%>
										<%--onclick="window.location.reload();">--%>
										<%--<i class="fa fa-refresh"></i> 刷新--%>
									<%--</button>--%>
								<%--</div>--%>
							<%--</div>--%>
						<%--</div>--%>
						<%--<div class="box-tools pull-right">--%>
							<%--<div class="has-feedback">--%>
								<%--<input type="text" class="form-control input-sm"--%>
									<%--placeholder="搜索"> <span--%>
									<%--class="glyphicon glyphicon-search form-control-feedback"></span>--%>
							<%--</div>--%>
						<%--</div>--%>
						<%--<!--工具栏/-->--%>


					</div>
					<!-- 数据表格 /-->

				</div>
				<!-- /.box-body -->

				<!-- .box-footer-->
				<div class="box-footer">
					<div class="pull-left">
						<div class="form-group form-inline">
							总共${pageInfo.pages} 页，共${pageInfo.total} 条数据。 每页
							<select class="form-control" id="changePageSize" onchange="changePageSize()">
								<option>5</option>
								<option>20</option>
								<option>50</option>
							</select> 条
						</div>
					</div>

					<div class="box-tools pull-right">
						<ul class="pagination">
							<li>
								<a href="${pageContext.request.contextPath}/sysLog/findAll.do?page=1&size=${pageInfo.pageSize}&name=${query}" aria-label="Previous">首页</a>
							</li>
							<li id="preitem"><a href="${pageContext.request.contextPath}/sysLog/findAll.do?page=${pageInfo.pageNum-1}&size=${pageInfo.pageSize}&name=${query}">上一页</a></li>
							<c:forEach begin="${pageInfo.pageNum-2<1?1:pageInfo.pageNum-2}" end="${pageInfo.pageNum+2>pageInfo.pages?pageInfo.pages:pageInfo.pageNum+2}" var="pageNum">
								<li name="pageitem"><a  href="${pageContext.request.contextPath}/sysLog/findAll.do?page=${pageNum}&size=${pageInfo.pageSize}&name=${query}">${pageNum}</a></li>
							</c:forEach>
							<li id="nextitem"><a href="${pageContext.request.contextPath}/sysLog/findAll.do?page=${pageInfo.pageNum+1}&size=${pageInfo.pageSize}&name=${query}">下一页</a></li>
							<li>
								<a href="${pageContext.request.contextPath}/sysLog/findAll.do?page=${pageInfo.pages}&size=${pageInfo.pageSize}&name=${query}" aria-label="Next">尾页</a>
							</li>
						</ul>
					</div>

				</div>
				<!-- /.box-footer-->

			</div>

			</section>
			<!-- 正文区域 /-->

		<%--</div>--%>
		<%--<!-- 内容区域 /-->--%>

		<%--<!-- 底部导航 -->--%>
		<%--<footer class="main-footer">--%>
		<%--<div class="pull-right hidden-xs">--%>
			<%--<b>Version</b> 1.0.8--%>
		<%--</div>--%>
		<%--<strong>Copyright &copy; 2018-2020<a--%>
			<%--href="#">IOT数据分析系统</a>.--%>
		<%--</strong> All rights reserved. </footer>--%>
		<%--<!-- 底部导航 /-->--%>

	<%--</div>--%>

	<script
		src="${pageContext.request.contextPath}/plugins/jQuery/jquery-2.2.3.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/jQueryUI/jquery-ui.min.js"></script>
	<script>
		$.widget.bridge('uibutton', $.ui.button);
	</script>
	<script
		src="${pageContext.request.contextPath}/plugins/bootstrap/js/bootstrap.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/raphael/raphael-min.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/morris/morris.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/sparkline/jquery.sparkline.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/jvectormap/jquery-jvectormap-1.2.2.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/jvectormap/jquery-jvectormap-world-mill-en.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/knob/jquery.knob.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/daterangepicker/moment.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/daterangepicker/daterangepicker.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/daterangepicker/daterangepicker.zh-CN.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/datepicker/bootstrap-datepicker.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/datepicker/locales/bootstrap-datepicker.zh-CN.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.all.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/slimScroll/jquery.slimscroll.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/fastclick/fastclick.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/iCheck/icheck.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/adminLTE/js/app.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/treeTable/jquery.treetable.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/select2/select2.full.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/colorpicker/bootstrap-colorpicker.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/bootstrap-wysihtml5/bootstrap-wysihtml5.zh-CN.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/bootstrap-markdown/js/bootstrap-markdown.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/bootstrap-markdown/locale/bootstrap-markdown.zh.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/bootstrap-markdown/js/markdown.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/bootstrap-markdown/js/to-markdown.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/ckeditor/ckeditor.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/input-mask/jquery.inputmask.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/input-mask/jquery.inputmask.date.extensions.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/input-mask/jquery.inputmask.extensions.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/datatables/jquery.dataTables.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/datatables/dataTables.bootstrap.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/chartjs/Chart.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/flot/jquery.flot.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/flot/jquery.flot.resize.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/flot/jquery.flot.pie.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/flot/jquery.flot.categories.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/ionslider/ion.rangeSlider.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/bootstrap-slider/bootstrap-slider.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/bootstrap-datetimepicker/bootstrap-datetimepicker.min.js"></script>

	<script>

        $(function () {

            var iframe = $('#content', window.parent.document)[0];

            iframe.style.height = 'auto';

            thisheight = iframe.contentWindow.document.documentElement.scrollHeight;

            iframe.style.height = thisheight + 51 +"px";

        });

        $(function () {
            $('#q-log').bind('keypress', function(event) {
                if (event.keyCode == "13") {
                    event.preventDefault();
                    //回车执行查询
					var query = $('#q-log').val();
                    // alert(query)
                    //向服务器发送请求
                    location.href = "${pageContext.request.contextPath}/sysLog/findAll.do?name="+query;
                }
            });
        })

        $(function () {
            var select = $('#changePageSize')[0]
            var checkValue = ${pageInfo.pageSize}
            // console.log(checkValue)
            // console.log(select.length)
            for (var i = 0; i < select.length; i++) {

                // console.log("2222   ",select.options[i].text)
                if (select.options[i].text == checkValue) {
                    // console.log("3333   ",select.options[i].text)
                    select[i].selected = true;
                    break;
                }
            }
        })


		$(function () {
		    var pre = $("#preitem")[0]
		    var next = $("#nextitem")[0]
		    var page = ${pageInfo.pageNum}
		    var isfirst = ${pageInfo.isFirstPage}
		    var islast = ${pageInfo.isLastPage}
			// console.log(pre)
			if(isfirst){
                $("#preitem a")[0].href='javascript:void(0);'
			    pre.className+='disabled'

			}
			if(islast){
                $("#nextitem a")[0].href='javascript:void(0);'
				next.className+='disabled'
			}
			var pages = $("li[name='pageitem']")
			// console.log(pages)
			for(var i=0;i<pages.length;i++){
                // console.log(pages[i].textContent)

			    if(pages[i].textContent==page){
			        pages[i].className+='active'
					break;
				}
			}
        })

        function changePageSize() {
            //获取下拉框的值
            var pageSize = $("#changePageSize").val();

            //向服务器发送请求，改变没页显示条数
            location.href = "${pageContext.request.contextPath}/sysLog/findAll.do?page=1&size="
                + pageSize+"&name=${query}";
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

		$(document).ready(function() {

			// 激活导航位置
			setSidebarActive("order-manage");

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
<%--</body>--%>

</html>