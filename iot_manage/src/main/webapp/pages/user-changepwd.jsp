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
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/plugins/bootstrap-datetimepicker/bootstrap-datetimepicker.css">
</head>

<body class="hold-transition skin-purple sidebar-mini">

	<%--<div class="wrapper">--%>

		<!-- 模态框（Modal） -->
		<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog">
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
				用户管理 <small>修改密码</small>
			</h1>
			<ol class="breadcrumb">
				<li><a target="_parent" href="${pageContext.request.contextPath}/index.jsp"><i
						class="fa fa-dashboard"></i> 首页</a></li>
				<%--<li><a--%>
					<%--href="${pageContext.request.contextPath}/user/findAll.do">用户管理</a></li>--%>
				<li class="active">修改密码</li>
			</ol>
			</section>
			<!-- 内容头部 /-->

			<%--<form action="${pageContext.request.contextPath}/user/save.do"--%>
				<%--method="post">--%>
				<!-- 正文区域 -->
				<section class="content"> <!--产品信息-->

					<div class="row data-type center-block">

						<div class="col-md-2 title">当前密码</div>
						<div class="col-md-10 data">
							<input type="password" class="form-control" name="pwd"
								   placeholder="登入密码" value="">

						</div>

						<div class="col-md-2 title">修改密码</div>
						<div class="col-md-10 data">
							<input type="password" class="form-control" name="epwd"
								   placeholder="修改密码" value="">
						</div>

						<div class="col-md-2 title">确认修改密码</div>
						<div class="col-md-10 data">
							<input type="password" class="form-control" name="repwd"
								   placeholder="确认修改密码" value="">
						</div>
						<!--订单信息/--> <!--工具栏-->
						<div class="box-tools text-center">
							<button onclick="changPwd()" class="btn bg-maroon">保存</button>
							<%--<button type="button" class="btn bg-default"--%>
							<%--onclick="history.back(-1);">返回</button>--%>
						</div>
					</div>


					
				<!--工具栏/-->
				</section>
				<!-- 正文区域 /-->
			<%--</form>--%>
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
		
		function changPwd() {
			var pwd = $("input[name='pwd']").val()
			var epwd = $("input[name='epwd']").val()
			var repwd = $("input[name='repwd']").val()
			if(pwd==undefined||pwd.trim()===""){

			    $("#mymsg").text("密码不能为空！")
                $('#myModal').modal({
                    keyboard:false
                })

			}else if(epwd==undefined||epwd.trim()===""){

                $("#mymsg").text("密码不能为空！")
                $('#myModal').modal({
                    keyboard:false
                })
			}else if(repwd==undefined||repwd.trim()===""){

                $("#mymsg").text("密码不能为空！")
                $('#myModal').modal({
                    keyboard:false
                })
			}else if(epwd!=repwd){
                $("#mymsg").text("两次输入密码不一致！")
                $('#myModal').modal({
                    keyboard:false
                })
				//清空输入框
                $("input[name='pwd']").val("")
                $("input[name='epwd']").val("")
                $("input[name='repwd']").val("")
			}else {
                $.ajax({
                    type: "POST",
                    url: "${pageContext.request.contextPath}/user/changePwd.do",
                    data: {pwd:pwd,repwd:repwd},
                    success: function(data){
                        if(data.flag==true){
                            $("#mymsg").text("密码修改成功！")
                            $('#myModal').modal({
                                keyboard:false
                            })

                        }else {
                            $("#mymsg").text(data.message)
                            $('#myModal').modal({
                                keyboard:false
                            })
                            // alert(  );
                        }
                    }
                });
                //清空输入框
                $("input[name='pwd']").val("")
                $("input[name='epwd']").val("")
                $("input[name='repwd']").val("")
			}


        }
	</script>


</body>

</html>