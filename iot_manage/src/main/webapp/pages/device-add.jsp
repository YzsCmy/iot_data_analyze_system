<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
				设备管理 <small>设备表单</small>
			</h1>
			<ol class="breadcrumb">
				<li><a target="_parent" href="${pageContext.request.contextPath}/index.jsp"><i
						class="fa fa-dashboard"></i> 首页</a></li>
				<li><a
					href="${pageContext.request.contextPath}/device/findAll.do">设备管理</a></li>
				<li class="active">设备表单</li>
			</ol>
			</section>
			<!-- 内容头部 /-->

			<c:if test="${isEdit}">
			<form id="myform" action="${pageContext.request.contextPath}/device/update.do"
				method="post" onsubmit="return check()">

				</c:if>
			<c:if test="${!isEdit}">
			<form id="myform" action="${pageContext.request.contextPath}/device/save.do"
				method="post" onsubmit="return check()">
				</c:if>
				<!-- 正文区域 -->
				<section class="content"> <!--产品信息-->
					<input type="hidden" name="id" value="${device.id}">

					<%--<security:authorize access="(not hasRole('ROOT')) or (hasRole('ROOT') and )">--%>
					<c:if test="${!isRootAdd}">
						<c:if test="${isEdit}">
							<input type="hidden" name="unitId" value="${device.unitId}">
							<input type="hidden" name="pointId" value="${device.pointId}">
							<input type="hidden" name="typeId" value="${device.typeId}">

						</c:if>
						<c:if test="${!isEdit}">

							<input type="hidden" name="unitId" value="${sessionScope.unitId}">
						</c:if>
					</c:if>
					<%--</security:authorize>--%>
				<div class="panel panel-default">
					<div class="panel-heading">设备信息</div>
					<div class="row data-type" style="margin-left: 0px">

						<div class="col-md-2 title">设备名称</div>
						<div class="col-md-4 data">
							<input type="text" class="form-control" name="name"
								placeholder="设备名称" value="${device.name}">
						</div>
                        <c:if test="${!isEdit}">
                            <div class="col-md-2 title">设备类型</div>
                            <div class="col-md-4 data">
                                <select class="form-control select2" style="width: 100%"
                                        name="typeId" >
                                    <c:forEach items="${typeMap}" var="type">
                                        <option value="${type.key}" >${type.value}</option>
                                    </c:forEach>
                                </select>
                            </div>
                        </c:if>
						<security:authorize access="hasRole('ROOT')">
							<c:if test="${isRootAdd}">
								<div class="col-md-2 title">所属单元</div>
								<div class="col-md-4 data">
									<select class="form-control select2" style="width: 100%"
											name="unitId" id="unitSelect" onchange="changeUnit(this.options[this.options.selectedIndex].value)">
										<c:forEach items="${unitMap}" var="unit">
											<option value="${unit.key}" >${unit.value}</option>
										</c:forEach>
									</select>
								</div>
							</c:if>
						</security:authorize>
						<security:authorize access="hasRole('ADMIN')">
							<c:if test="${!isEdit}">
								<div class="col-md-2 title">所属测点</div>
								<div class="col-md-4 data">
									<select class="form-control select2" style="width: 100%"
											name="pointId" id="pointSelect">
										<%--<c:forEach items="${pointMap}" var="point">--%>
											<%--<option value="${point.key}" >${point.value}</option>--%>
										<%--</c:forEach>--%>
									</select>
								</div>
							</c:if>
						</security:authorize>

						<div class="col-md-2 title">状态</div>
						<div class="col-md-4 data">
							<select class="form-control select2" style="width: 100%"
									name="status">
								<option value="0" ${device.status==0?'selected':''}>关闭</option>
								<option value="1" ${device.status==1?'selected':''}>开启</option>
							</select>
						</div>
					</div>
				</div>
				<!--订单信息/--> <!--工具栏-->
				<div class="box-tools text-center">
					<button type="submit" class="btn bg-maroon">保存</button>
					<button type="button" class="btn bg-default"
						onclick="history.back(-1);">返回</button>
				</div>
				<!--工具栏/-->
				</section>
				<!-- 正文区域 /-->
			</form>
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
		<!-- 底部导航 /-->
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

	<%--</div>--%>


	<script
		src="${pageContext.request.contextPath}/plugins/jQuery/jquery-2.2.3.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/jQuery/jquery.form.js"></script>
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
            var unitid = $("#unitSelect option:selected").val();
            if(unitid===undefined){
                unitid = '${sessionScope.unitId}';
            }
            console.log(unitid)

            $.ajax({
                type: "POST",
                url: "${pageContext.request.contextPath}/measurePoint/findByUnitId.do",
                data: {unitId:unitid},
                success: function(data){
                    if(data.flag==true){
                        console.log(data.data)

                        var list = data.data;
                        $("#pointSelect").empty()
                        for(k in list){
                            $("#pointSelect").append('<option value="'+list[k].id+'">'+list[k].name+'</option>');
                        }


                    }else {

                        console.log(data.data)
                    }
                }
            });
        })

        function changeUnit(val) {
            console.log(val)
            //发起ajax,渲染测点下拉框
            $.ajax({
                type: "POST",
                url: "${pageContext.request.contextPath}/measurePoint/findByUnitId.do",
                data: {unitId:val},
                success: function(data){
                    if(data.flag==true){
                        console.log(data.data)

                        var list = data.data;
                        $("#pointSelect").empty()
                        for(k in list){
                            $("#pointSelect").append('<option value="'+list[k].id+'">'+list[k].name+'</option>');
                        }


                    }else {

                        console.log(data.data)
                    }
                }
            });

        }

		function check(){
		    var name = $("input[name='name']").val()
		    // var address = $("input[name='address']").val()
			console.log(name)
		    if(name==undefined||name.trim()==''){
                $("#mymsg").text("设备名称不能为空！")
                $('#myModal').modal({
                    keyboard:false
                })
		        return false
			}
		    // if(address==undefined||address.trim()==''){
            //     $("#mymsg").text("地址不能为空！")
            //     $('#myModal').modal({
            //         keyboard:false
            //     })
		    //     return false
			// }
		    return true
		}

		$(function () {
			$("#myform").ajaxForm(function (data) {
                if(data.flag==true){
                    $("#mymsg").text("保存成功！")
                    $('#myModal').modal({
                        keyboard:false
                    })
                    $('#myModal').on('hide.bs.modal', function () {
                        // 执行一些动作...
                        <%--<security:authorize access="hasRole('ROOT')">--%>
                        location.href='${pageContext.request.contextPath}/device/findAll.do';
                        // return;
						<%--</security:authorize>--%>
                        <%--location.href='${pageContext.request.contextPath}/unit/show.do?id=${unit.id}';--%>
                    })

                }else {
                    $("#mymsg").text(data.message)
                    $('#myModal').modal({
                        keyboard:false
                    })
                    // alert(  );
                }

            })
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
	</script>


</body>

</html>