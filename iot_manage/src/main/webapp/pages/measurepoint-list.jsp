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
				测点管理 <small>全部测点</small>
			</h1>
			<ol class="breadcrumb">
				<li><a target="_parent" href="${pageContext.request.contextPath}/index.jsp"><i
						class="fa fa-dashboard"></i> 首页</a></li>
				<li><a
					href="${pageContext.request.contextPath}/measurePoint/findAll.do">测点管理</a></li>

				<li class="active">全部测点</li>
			</ol>
			</section>
			<!-- 内容头部 /-->

				<!-- 正文区域 -->
				<section class="content"> <!-- .box-body -->
				<div class="box box-primary">


					<div class="box-body">

						<!-- 数据表格 -->
						<div class="table-box">

							<!--工具栏-->
							<div class="pull-left">
								<div class="form-group form-inline">
									<div class="btn-group">

										<button type="button" class="btn btn-default" title="新建" onclick="location.href='${pageContext.request.contextPath}/measurePoint/addMeasurePoint.do'">
											<i class="fa fa-file-o"></i> 新建
										</button>

										<button type="button" class="btn btn-default" title="新建"
												onclick="editMeasurePoint()">
											<i class="fa fa-file-o"></i> 修改
										</button>
										
									</div>
								</div>
							</div>
							<div class="box-tools pull-right">
								<div class="has-feedback">
									<input type="text" class="form-control input-sm"
										placeholder="搜索" id="q-meas"> <span
										class="glyphicon glyphicon-search form-control-feedback"></span>
								</div>
							</div>
							<!--工具栏/-->

							<!--数据列表-->
							<table id="dataList"
								class="table table-bordered table-striped table-hover dataTable">
								<thead>
									<tr>
										<th class="" style="padding-right: 0px"><input
											id="selall" type="checkbox" class="icheckbox_square-blue">
										</th>
										<th class="sorting_asc">ID</th>
										<th class="sorting_desc">测点名称</th>
										<th class="sorting_desc sorting_desc_disabled">所属单元</th>
										<th class="sorting">状态</th>
										<%--<security:authorize access="hasRole('ROOT')">--%>
										<%--<th class="sorting_asc sorting_asc_disabled">所属单元</th>--%>
										<%--</security:authorize>--%>
										<%--<th class="text-center">操作</th>--%>
									</tr>
								</thead>
								<tbody>

									<c:forEach items="${pageInfo.list}" var="measurePoint">
										<tr>
											<td><input name="selectck" type="checkbox" value="${measurePoint.id}"></td>
											<td>${measurePoint.id }</td>
											<td>${measurePoint.name }</td>
											<td>${measurePoint.unitName }</td>
											<td>${measurePoint.statusStr }</td>
											<%--<security:authorize access="hasRole('ROOT')">--%>
											<%--<td>${user.unitName }</td>--%>
											<%--</security:authorize>--%>
											<%--<td class="text-center">--%>
												<%--<a href="${pageContext.request.contextPath}/unit/show.do?id=${unit.id}" class="btn bg-olive btn-xs">详情</a>--%>
											<%--</td>--%>
										</tr>
									</c:forEach>
								</tbody>

							</table>
							<!--数据列表/-->

						</div>
						<!-- 数据表格 /-->

					</div>
					<!-- /.box-body -->

					<!-- .box-footer-->
					<div class="box-footer">
						<div class="pull-left">
							<div class="form-group form-inline">
								总共${pageInfo.pages} 页，共${pageInfo.total} 条数据。 每页
								<select   class="form-control" id="changePageSize" onchange="changePageSize()">
									<option>5</option>
									<option>10</option>
									<option>20</option>
								</select> 条
							</div>
						</div>

						<div class="box-tools pull-right">
							<ul class="pagination">
								<li>
									<a href="${pageContext.request.contextPath}/measurePoint/findAll.do?page=1&size=${pageInfo.pageSize}&name=${query}" aria-label="Previous">首页</a>
								</li>
								<li id="preitem"><a href="${pageContext.request.contextPath}/measurePoint/findAll.do?page=${pageInfo.pageNum-1}&size=${pageInfo.pageSize}&name=${query}">上一页</a></li>
								<c:forEach begin="${pageInfo.pageNum-2<1?1:pageInfo.pageNum-2}" end="${pageInfo.pageNum+2>pageInfo.pages?pageInfo.pages:pageInfo.pageNum+2}"  var="pageNum">
									<li name="pageitem"><a href="${pageContext.request.contextPath}/measurePoint/findAll.do?page=${pageNum}&size=${pageInfo.pageSize}&name=${query}">${pageNum}</a></li>
								</c:forEach>
								<li id="nextitem"><a href="${pageContext.request.contextPath}/measurePoint/findAll.do?page=${pageInfo.pageNum+1}&size=${pageInfo.pageSize}&name=${query}">下一页</a></li>
								<li>
									<a href="${pageContext.request.contextPath}/measurePoint/findAll.do?page=${pageInfo.pages}&size=${pageInfo.pageSize}&name=${query}" aria-label="Next">尾页</a>
								</li>
							</ul>
						</div>

					</div>
					<!-- /.box-footer-->

				</div>

				</section>
				<!-- 正文区域 /-->

			<%--</div>--%>
			<%--<!-- @@close -->--%>
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
            $('#q-meas').bind('keypress', function(event) {
                if (event.keyCode == "13") {
                    event.preventDefault();
                    //回车执行查询
                    var query = $('#q-meas').val();
                    // alert(query)
                    //向服务器发送请求
                    location.href = "${pageContext.request.contextPath}/measurePoint/findAll.do?name="+query;
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

        // function setHeight(el) {
        //     el.style.height = el.contentWindow.document.body.offsetHeight + 'px'
        // }


        function editMeasurePoint() {
            var i=0;
            var condition=$("input[name='selectck']:checked");
            var id="";
            for(var j=0;i<condition.length;j++){
                if(condition[j].checked==true){
                    id = condition[j].value;
                    i++; //do something
                }
            }
            console.log(condition)
            console.log(i)
            console.log(id)
            if(i==0){
                $("#mymsg").text("请选择要修改的列！")
                $('#myModal').modal({
                    keyboard:false
                })
            }else if(i>1){
                $("#mymsg").text("只能选择一列！")
                $('#myModal').modal({
                    keyboard:false
                })

            }else{

                location.href='${pageContext.request.contextPath}/measurePoint/edit.do?id='+id;

            }
        }

        function changePageSize() {
            //获取下拉框的值
            var pageSize = $("#changePageSize").val();

            //向服务器发送请求，改变没页显示条数
            location.href = "${pageContext.request.contextPath}/measurePoint/findAll.do?page=1&size="
                + pageSize+"&name=${query}";
        }
        $(document).ready(function() {
            // 选择框
            $(".select2").select2();

            // WYSIHTML5编辑器
            $(".textarea").wysihtml5({
                locale : 'zh-CN'
            });

            <%--$("#changePageSize").find("option[text=${pageInfo.pageSize}]").attr("selected",true);--%>

            <%--// var select = $('#changePageSize')--%>
            <%--console.log(checkValue)--%>
            <%--// console.log(select);--%>
            <%--// for (var i = 0; i < select.options.length; i++){--%>
            <%--//     if (select.options[i].value == checkValue){--%>
            <%--//         select.options[i].selected = true;--%>
            <%--//         break;--%>
            <%--//     }--%>
            <%--// }--%>
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