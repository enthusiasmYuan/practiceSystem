<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="description" content="Propeller_Admin_Dashboard">
<meta content="width=device-width, initial-scale=1, user-scalable=no"
	name="viewport">

<title>成都大学|信工学院实训实习系统</title>
<link rel="shortcut icon" type="image/x-icon"
	href="../assets/images/favicon1.ico">

<!-- Google icon -->
<!--<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">-->

<!-- Bootstrap css -->
<link rel="stylesheet" type="text/css"
	href="../assets/css/bootstrap.min.css">
<!-- Select2 css-->
<link rel="stylesheet" type="text/css"
	href="../components/select2/css/select2.min.css" />
<link rel="stylesheet" type="text/css"
	href="../components/select2/css/select2-bootstrap.css" />
<!-- Propeller select2 css-->
<link rel="stylesheet" type="text/css"
	href="../components/select2/css/pmd-select2.css" />
<!-- Propeller css -->
<link rel="stylesheet" type="text/css"
	href="../assets/css/propeller.min.css">

<!-- Propeller theme css-->
<link rel="stylesheet" type="text/css"
	href="../assets/css/propeller-theme.css" />

<!-- Propeller admin theme css-->
<link rel="stylesheet" type="text/css"
	href="../assets/css/propeller-admin.css">
<!--my style css-->
<link rel="stylesheet" type="text/css" href="../assets/css/style.css">
<!-- Propeller textbox -->
<link href="http://propeller.in/components/textfield/css/textfield.css"
	type="text/css" rel="stylesheet" />

<!-- Propeller table -->
<link href="http://propeller.in/components/table/css/table.css"
	type="text/css" rel="stylesheet" />

<!-- Propeller card -->
<link href="http://propeller.in/components/card/css/card.css"
	type="text/css" rel="stylesheet" />

<!-- Propeller Datatables bootstrap -->
<link
	href="https://cdn.datatables.net/1.10.12/css/dataTables.bootstrap.min.css"
	type="text/css" rel="stylesheet" />

<!-- Propeller Datatables bootstrap responsive  -->
<link
	href="https://cdn.datatables.net/responsive/2.1.0/css/responsive.bootstrap.min.css"
	type="text/css" rel="stylesheet" />

<!-- Propeller Datatables select -->
<link
	href="https://cdn.datatables.net/select/1.2.0/css/select.dataTables.min.css"
	type="text/css" rel="stylesheet" />
<!-- Propeller Datatable -->
<link href="../assets/css/pmd-datatable.css" type="text/css"
	rel="stylesheet" />
<!-- Styles Ends -->
</head>

<body>
	<%@include file="test.jsp"%>
	<!--content area start-->
	<div id="content" class="pmd-content inner-page">
		<!--tab start-->
		<div
			class="container-fluid full-width-container value-added-detail-page">
			<div>
				<div class="pull-right table-title-top-action">
					<div class="pmd-textfield pull-left">
						<input type="text" id="exampleInputAmount" class="form-control"
							placeholder="关于...">
					</div>
					<a href="javascript:void(0);"
						class="btn btn-primary pmd-btn-raised add-btn pmd-ripple-effect pull-left">搜索</a>
				</div>
				<!-- Title -->
				<h1 class="section-title" id="services">
					<span>实训方案管理</span>
				</h1>
				<!-- End Title -->
				<!--breadcrum start-->
				<ol class="breadcrumb text-left">
					<li><a href="index.html">主页</a></li>
					<li class="active">企业管理学生</li>
				</ol>
				<!--breadcrum end-->
			</div>

			<div class="col-md-12">
				<!-- responsive table example -->
				<div class="pmd-card pmd-z-depth pmd-card-custom-view">
					<h2 style="text-align: center;">企业管理学生</h2>
					<!--<form class="col-md-3">
                  <label class="checkbox-inline pmd-checkbox pmd-checkbox-ripple-effect">
                    <input type="radio" name="program" value="" >
                    <span>所有方案</span>
                  </label>
                  <label class="checkbox-inline pmd-checkbox pmd-checkbox-ripple-effect">
                    <input type="radio" name="program"value="">
                    <span>我的方案</span>
                  </label>
                </form>-->
					<form action="">
						<div class="col-md-2 form-inline">
							<select class="select-simple form-control pmd-select2">
								<option>我的方案</option>
							</select>
						</div>
						<div class="col-md-3">
							<select class="select-simple form-control pmd-select2"
								name="selectChoiceByPNo">
								<c:forEach items="${cUserAllProject }" var="project">
									<option value="${project.no }">${project.name }</option>
								</c:forEach>
							</select>
						</div>
						<input type="hidden" value="2" name="selectChoiceType">
						<div class="PM-nav">
							<button class="btn pmd-btn-raised pmd-ripple-effect btn-primary"
								type="submit">查询</button>
							<a class="btn pmd-btn-raised pmd-ripple-effect btn-primary"
								href="recording-results.html">录入成绩</a> <a
								class="btn pmd-btn-raised pmd-ripple-effect btn-primary"
								href="#">导出成绩</a>
						</div>
					</form>
					<table id="example"
						class="table pmd-table table-hover table-striped display responsive nowrap"
						cellspacing="0" width="100%">
						<thead>
							<tr class="trcustom">
								<th>方案号</th>
								<th>方案名称</th>
								<th>学生学号</th>
								<th>学生姓名</th>
								<th>学生年级</th>
								<th>校外指导老师</th>
								<th>校外指导老师职称</th>
								<th>方案类别</th>
								<th>年级下限</th>
								<th>发布日期</th>
								<th>理由</th>
								<th>操作</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${proProSelStuViews }" var="proProSelStuView">
								<tr>
									<td>${proProSelStuView.project.no }</td>
									<td>${proProSelStuView.project.name }</td>
									<td>${proProSelStuView.student.no }</td>
									<td>${proProSelStuView.student.name }</td>
									<td>${proProSelStuView.student.grade }</td>
									<td>${proProSelStuView.project.companyTeacher }</td>
									<td>${proProSelStuView.project.companyTeacherTitle }</td>
									<td>${proProSelStuView.project.category }</td>
									<td>${proProSelStuView.project.grade }</td>
									<td>${proProSelStuView.project.releaseDate }</td>
									<td><button
											data-target="#form-dialog-${proProSelStuView.project.no }"
											data-toggle="modal"
											class="btn pmd-btn-raised pmd-ripple-effect btn-info pmd-z-depth"
											type="button">查看详情</button></td>
									<td><c:if
											test="${proProSelStuView.projectSelect.companySelDate==null&&stuHasProject.get(proProSelStuView.student.no) }">
											<a type="button"
												href="ChoiceStudentServlet?type=1&stu_no=${proProSelStuView.student.no }&p_no=${proProSelStuView.project.no }"
												class="btn pmd-btn-raised pmd-ripple-effect btn-success pmd-z-depth">
												选择 </a>
										</c:if> <c:if
											test="${proProSelStuView.projectSelect.companySelDate!=null }">
											<a type="button"
												href="ChoiceStudentServlet?type=2&stu_no=${proProSelStuView.student.no }&p_no=${proProSelStuView.project.no }"
												class="btn pmd-btn-raised pmd-ripple-effect btn-danger pmd-z-depth">
												退选 </a>
										</c:if></td>
								</tr>
								<div tabindex="-1" class="modal fade"
									id="form-dialog-${proProSelStuView.project.no }"
									style="display: none;" aria-hidden="true">
									<div class="modal-dialog">
										<div class="modal-content">
											<div class="modal-header pmd-modal-bordered">
												<button aria-hidden="true" data-dismiss="modal"
													class="close" type="button">×</button>
												<h2 class="pmd-card-title-text">选题理由</h2>
											</div>
											<div class="modal-body">
												<div class="form-group pmd-textfield">
													<div class="input-group col-md-4">
														<div class="input-group-addon">
															<label class="control-label col-md-2">学号：</label>
														</div>
														<input type="text" disabled=""
															value="${proProSelStuView.student.no }"
															class="mat-input form-control">
													</div>
												</div>
												<div class="form-group pmd-textfield">
													<div class="input-group col-md-4">
														<div class="input-group-addon">
															<label class="control-label col-md-2">姓名：</label>
														</div>
														<input type="text" disabled=""
															value="${proProSelStuView.student.name }"
															class="mat-input form-control">
													</div>
												</div>
												<div class="form-group pmd-textfield">
													<div class="input-group col-md-4">
														<div class="input-group-addon">
															<label class="control-label col-md-2">方案号：</label>
														</div>
														<input type="text" disabled=""
															value="${proProSelStuView.project.no }"
															class="mat-input form-control">
													</div>
												</div>
												<div class="form-group pmd-textfield">
													<div class="input-group col-md-4">
														<div class="input-group-addon">
															<label class="control-label col-md-2">方案名：</label>
														</div>
														<input type="text" disabled=""
															value="${proProSelStuView.project.name }"
															class="mat-input form-control">
													</div>
												</div>
												<div class="form-group pmd-textfield col-md-8">
													<label class="control-label  arer-lable">学科背景:</label>
													<textarea required readonly="" class="form-control">${proProSelStuView.student.subjectBackground }</textarea>
												</div>
												<div class="form-group pmd-textfield col-md-8">
													<label class="control-label  arer-lable">学习经历:</label>
													<textarea required readonly="" class="form-control">${proProSelStuView.student.learningExperience }</textarea>
												</div>
												<div class="form-group pmd-textfield col-md-8">
													<label class="control-label  arer-lable">研究方向:</label>
													<textarea required readonly="" class="form-control">${proProSelStuView.student.researchDirection }</textarea>
												</div>
												<div class="form-group pmd-textfield col-md-8">
													<label class="control-label  arer-lable">选题理由:</label>
													<textarea required readonly="" class="form-control">${proProSelStuView.projectSelect.selReason }</textarea>
												</div>
											</div>
										</div>
									</div>
								</div>
							</c:forEach>

						</tbody>
					</table>
					<!-- 分页 -->
					第 <input type="text" value="${choiceProjectInfoPageUtils.pageNow }"
						size="2"> / ${choiceProjectInfoPageUtils.totalPage }页
					<c:if test="${choiceProjectInfoPageUtils.isHasFirst() }">
						<a href="ChoicePracticeInfoServlet?nowPage=1">首页&nbsp;</a>
					</c:if>
					<c:if test="${choiceProjectInfoPageUtils.isHasPre() }">
						<a
							href="ChoicePracticeInfoServlet?nowPage=${choiceProjectInfoPageUtils.pageNow-1 }">上一页&nbsp;</a>
					</c:if>
					<c:if test="${choiceProjectInfoPageUtils.isHasNext() }">
						<a
							href="ChoicePracticeInfoServlet?nowPage=${choiceProjectInfoPageUtils.pageNow+1 }">下一页&nbsp;</a>
					</c:if>
					<c:if test="${choiceProjectInfoPageUtils.isHasLast() }">
						<a
							href="ChoicePracticeInfoServlet?nowPage=${choiceProjectInfoPageUtils.totalPage }">尾页</a>
					</c:if>
				</div>
				<!-- responsive table example end -->

			</div>



		</div>
	</div>

	<!-- Footer Starts -->
	<!--footer start-->
	<footer class="admin-footer">
	<div class="container-fluid">
		<ul class="list-unstyled list-inline">
			<li><span class="pmd-card-subtitle-text">信息科学与工程学院 &copy;
					2017. 版权所有.</span>
				<h3 class="pmd-card-subtitle-text">
					技术支持 BY <a href="http://computer.cdu.edu.cn/" target="_blank">信工学院.</a>
				</h3></li>
			<li class="pull-right download-now"><a
				onClick="downloadPMDadmintemplate()" href="javascript：void(0);">
					<div>
						<i class="material-icons media-left pmd-sm">settings</i>
					</div>
					<div>
						<span class="pmd-card-subtitle-text">Version- 1.0.0</span>
						<h3 class="pmd-card-title-text">By cduyzh</h3>
					</div>
			</a></li>
			<li class="pull-right for-support"><a
				href="mailto:support@propeller.in">
					<div>
						<i class="material-icons media-left pmd-sm">email</i>
					</div>
					<div>
						<span class="pmd-card-subtitle-text">For Support</span>
						<h3 class="pmd-card-title-text">450311265@qq.com</h3>
					</div>
			</a></li>
		</ul>
	</div>
	</footer>
	<!--footer end-->
	<!-- Footer Ends -->

	<!-- Scripts Starts -->
	<script src="../assets/js/jquery-1.12.2.min.js"></script>
	<script src="../assets/js/bootstrap.min.js"></script>
	<!--控制左侧工具栏选择状态-->
	<script>
		$(document).ready(
				function() {
					var sPath = window.location.pathname;
					var sPage = sPath.substring(sPath.lastIndexOf('/') + 1);
					$(".pmd-sidebar-nav").each(
							function() {
								$(this).find(
										"a[href='../PracticeManagement/"
												+ sPage + "']").parents(
										".dropdown").addClass("open");
								$(this).find(
										"a[href='../PracticeManagement/"
												+ sPage + "']").parents(
										".dropdown").find('.dropdown-menu')
										.css("display", "block");
								$(this).find(
										"a[href='../PracticeManagement/"
												+ sPage + "']").parents(
										".dropdown").find('a.dropdown-toggle')
										.addClass("active");
								$(this).find(
										"a[href='../PracticeManagement/"
												+ sPage + "']").addClass(
										"active");
							});
				});
	</script>
	<script type="text/javascript">
		(function() {
			"use strict";
			var toggles = document.querySelectorAll(".c-hamburger");
			for (var i = toggles.length - 1; i >= 0; i--) {
				var toggle = toggles[i];
				toggleHandler(toggle);
			}
			;

			function toggleHandler(toggle) {
				toggle
						.addEventListener(
								"click",
								function(e) {
									e.preventDefault();
									(this.classList.contains("is-active") === true) ? this.classList
											.remove("is-active")
											: this.classList.add("is-active");
								});
			}

		})();
	</script>

	<script src="../assets/js/propeller.min.js"></script>

	<!-- Select2 js-->
	<script type="text/javascript"
		src="../components/select2/js/select2.full.js"></script>
	<!-- Datatable js -->
	<script type="text/javascript" language="javascript"
		src="https://cdn.datatables.net/1.10.12/js/jquery.dataTables.min.js"></script>

	<!-- Datatable Bootstrap -->
	<script type="text/javascript" language="javascript"
		src="https://cdn.datatables.net/1.10.12/js/dataTables.bootstrap.min.js"></script>

	<!-- Datatable responsive js-->
	<script type="text/javascript" language="javascript"
		src="https://cdn.datatables.net/responsive/2.1.0/js/dataTables.responsive.min.js"></script>

	<!-- Datatable select js-->
	<script type="text/javascript" language="javascript"
		src="https://cdn.datatables.net/select/1.2.0/js/dataTables.select.min.js"></script>
	<!-- Propeller Select2 -->
	<script type="text/javascript">
		$(document).ready(function() {

			$(".select-simple").select2({
				theme : "bootstrap",
				minimumResultsForSearch : Infinity,
			});

			$(".select-with-search").select2({
				theme : "bootstrap"
			});

			$(".select-tags").select2({
				tags : false,
				theme : "bootstrap",
			});

			$(".select-add-tags").select2({
				tags : true,
				theme : "bootstrap",
			});
		});
	</script>
	<script type="text/javascript"
		src="../components/select2/js/pmd-select2.js"></script>
	<script>
		//Propeller  Customised Javascript code 
		$(document)
				.ready(
						function() {
							var exampleDatatable = $('#example')
									.DataTable(
											{
												responsive : {
													details : {
														type : 'column',
														target : 'tr'
													}
												},
												columnDefs : [ {
													className : 'control',
													orderable : false,
													targets : 1
												} ],
												order : [ 1, 'asc' ],
												bFilter : true,
												bLengthChange : true,
												pagingType : "simple",
												"paging" : true,
												"searching" : true,
												"language" : {
													"info" : " _START_ - _END_ of _TOTAL_ ",
													"sLengthMenu" : "<span class='custom-select-title'>每页显示行数:</span> <span class='custom-select'> _MENU_ </span>",
													"sSearch" : "",
													"sSearchPlaceholder" : "搜索",
													"paginate" : {
														"sNext" : " ",
														"sPrevious" : " "
													},
												},
												dom : "<'pmd-card-title'<'data-table-title-responsive'><'search-paper pmd-textfield'f>>"
														+ "<'row'<'col-sm-12'tr>>"
														+ "<'pmd-card-footer' <'pmd-datatable-pagination' l i p>>",
											});

							/// Select value
							$('.custom-select-info').hide();

							$("div.data-table-title")
									.html(
											'<h2 class="pmd-card-title-text">Table Card</h2>');
							$("div.data-table-title")
									.html(
											'<h2 class="pmd-card-title-text">Table Responsive</h2>');
							$(".custom-select-action")
									.html(
											'<button class="btn btn-sm pmd-btn-fab pmd-btn-flat pmd-ripple-effect btn-primary" type="button"><i class="material-icons pmd-sm">delete</i></button><button class="btn btn-sm pmd-btn-fab pmd-btn-flat pmd-ripple-effect btn-primary" type="button"><i class="material-icons pmd-sm">more_vert</i></button>');

						});
	</script>
</body>

</html>