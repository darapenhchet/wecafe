<%@page import="com.kosign.wecafe.enums.Status"%>
<%@page import="com.kosign.wecafe.entities.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description"
	content="A fully featured admin theme which can be used to build CRM, CMS, etc.">
<meta name="author" content="Coderthemes">

<link rel="shortcut icon" href="images/favicon_1.ico">

<title>KOSIGN WeCafe...</title>

<!-- Base Css Files -->
<link
	href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css"
	rel="stylesheet" />

<!-- Font Icons -->
<link
	href="${pageContext.request.contextPath}/resources/assets/font-awesome/css/font-awesome.min.css"
	rel="stylesheet" />
<link
	href="${pageContext.request.contextPath}/resources/assets/ionicon/css/ionicons.min.css"
	rel="stylesheet" />
<link
	href="${pageContext.request.contextPath}/resources/css/material-design-iconic-font.min.css"
	rel="stylesheet">

<!-- animate css -->
<link
	href="${pageContext.request.contextPath}/resources/css/animate.css"
	rel="stylesheet" />

<!-- Waves-effect -->
<link
	href="${pageContext.request.contextPath}/resources/css/waves-effect.css"
	rel="stylesheet">

<!-- sweet alerts -->
<link
	href="${pageContext.request.contextPath}/resources/assets/sweet-alert/sweet-alert.min.css"
	rel="stylesheet">

<!-- Custom Files -->
<link href="${pageContext.request.contextPath}/resources/css/helper.css"
	rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/resources/css/style.css"
	rel="stylesheet" type="text/css" />

<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
        <![endif]-->

<script
	src="${pageContext.request.contextPath}/resources/js/modernizr.min.js"></script>
<style>

table{
	font-family: 'Khmer OS', 'Khmer OS System'; font-size: 10pt;
}

thead tr th {
	text-align: center !important;
	font-size: 14px !important;
	font-weight: bold;
}
</style>

</head>



<body class="fixed-left-void" ng-app="wecafe">

	<!-- Begin page -->
	<div id="wrapper" ng-controller="UserController as controller">

		<!-- Top Bar Start -->
		<%@ include file="topbar.jsp"%>
		<!-- Top Bar End -->


		<!-- ========== Left Sidebar Start ========== -->
		<%@ include file="left_sidebar.jsp"%>
		<!-- Left Sidebar End -->



		<!-- ============================================================== -->
		<!-- Start right Content here -->
		<!-- ============================================================== -->
		<div class="content-page">
			<!-- Start content -->
			<div class="content">
				<div class="container">

					<!-- Page-Title -->
					<div class="row">
						<div class="col-sm-12">
							<h4 class="pull-left page-title">User List</h4>
						</div>
					</div>


					<div class="panel">
						<div class="panel-heading">
							<!-- <h3 class="panel-title">Product Lists</h3> -->
							<form class="form-inline">
								<div class="form-group">
									<label>Search</label> <input type="text" ng-model="search"
										class="form-control" placeholder="Search" width="400%">
								</div>
							</form>
						</div>
						<div class="panel-body">
							
							<table class="table table-bordered table-striped" id="datatable">
								<thead>
									<tr>
										<th>#</th>
										<th>Name</th>									
										<th>Email</th>
										<th>Username</th>
										<th>Type</th>
										<th>Created By</th>
										<th>Created Date</th>
										<th>Updated By</th>
										<th>Updated Date</th>
										<th>Status</th>
										<th>Actions</th>
									</tr>
								</thead>
								<tbody id="CONTENTS">
									<%-- <tr
										dir-paginate="(key,user) in users|filter:search|itemsPerPage:perPage|orderBy : user.createdDate">
										<td id="USER_ID">{{user.id }}
										<td>{{user.lastName +" "+ user.firstName }}</td>								
										<td>{{user.email }}</td>
										<td>{{user.username }}</td>
										<td>{{user.userRoles[0].type }}</td>
										<td>{{user.createdBy.lastName }}
											{{user.createdBy.firstName }}</td>
										<td>{{user.createdDate | date:'dd/MM/yyyy'}}</td>
										<td>{{user.lastUpdatedBy.lastName }}
											{{user.lastUpdatedBy.firstName }}</td>
										<td>{{user.lastUpdatedDate | date:'dd/MM/yyyy' }}</td>
										<td style="text-align: center;"><span
											ng-if="user.status=='ACTIVE'"> <a href="javascript:;"
												class="btn btn-success waves-effect" type="button"
												id="btnStatus">Active</a>
										</span> <span ng-if="user.status=='INACTIVE'"> <a
												href="javascript:;" class="btn btn-warning waves-effect"
												type="button" id="btnStatus">Inactive</a>
										</span> <span ng-if="user.status=='DELETED'"> <a
												href="javascript:;" class="btn btn-danger waves-effect"
												type="button" id="btnStatus">Deleted</a>
										</span> <span ng-if="user.status=='LOCKED'"> <a
												href="javascript:;" class="btn btn-info waves-effect"
												type="button" id="btnStatus">Locked</a>
										</span></td>
										</td>
										<td class="actions" style="width: 10%;"><a href="#"
											class="hidden on-editing save-row"><i class="fa fa-save"></i></a>
											<a href="#" class="hidden on-editing cancel-row"><i
												class="fa fa-times"></i></a> <a
											href="${pageContext.request.contextPath}/admin/user/{{user.id}}"
											class="on-default edit-row"><i class="fa fa-pencil"></i></a>
											<a href="#" class="on-default remove-row" id="btnDeleteUser"><i
												class="fa fa-trash-o"></i></a> <a href="#"
											class="on-default remove-row" id="btnChangePassword"><i
												class="fa fa-cog fa-fw"></i></a></td>
									</tr> --%>
								</tbody>
							</table>
							<div class="row">
										<div class="col-md-2">
											<select id="PER_PAGE" class="form-control"> 
												<option value="15">15</option>
												<option value="30">30</option>
												<option value="50">50</option>
												<option value="100">100</option>
											</select>
										</div> 
										<div id="PAGINATION" class="pull-right"></div>
							</div> 
						</div>
						<!-- end: page -->					
					</div>
					<!-- end Panel -->

				</div>
				<!-- container -->

			</div>
			<!-- content -->

			<%@ include file="footer.jsp"%>

		</div>

	</div>
	<!-- END wrapper -->



	<script>
            var resizefunc = [];
            var ctx = "${pageContext.request.contextPath}"
        </script>
	<script
		src="https://ajax.googleapis.com/ajax/libs/angularjs/1.4.4/angular.js"></script>
	<script src="<c:url value='/resources/scripts/dirPagination.js' />"></script>
	<script src="<c:url value='/resources/scripts/app.js' />"></script>
	<script
		src="<c:url value='/resources/scripts/services/user_service.js' />"></script>
	<script
		src="<c:url value='/resources/scripts/controllers/user_controller.js' />"></script>

	<!-- jQuery  -->
	<script
		src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/waves.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/wow.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/jquery.nicescroll.js"
		type="text/javascript"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/jquery.scrollTo.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/assets/chat/moment-2.2.1.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/assets/jquery-sparkline/jquery.sparkline.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/assets/jquery-detectmobile/detect.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/assets/fastclick/fastclick.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/assets/jquery-slimscroll/jquery.slimscroll.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/assets/jquery-blockui/jquery.blockUI.js"></script>

	<!-- sweet alerts -->
	<script
		src="${pageContext.request.contextPath}/resources/assets/sweet-alert/sweet-alert.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/assets/sweet-alert/sweet-alert.init.js"></script>

	<!-- flot Chart -->
	<script
		src="${pageContext.request.contextPath}/resources/assets/flot-chart/jquery.flot.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/assets/flot-chart/jquery.flot.time.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/assets/flot-chart/jquery.flot.tooltip.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/assets/flot-chart/jquery.flot.resize.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/assets/flot-chart/jquery.flot.pie.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/assets/flot-chart/jquery.flot.selection.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/assets/flot-chart/jquery.flot.stack.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/assets/flot-chart/jquery.flot.crosshair.js"></script>

	<!-- Counter-up -->
	<script
		src="${pageContext.request.contextPath}/resources/assets/counterup/waypoints.min.js"
		type="text/javascript"></script>
	<script
		src="${pageContext.request.contextPath}/resources/assets/counterup/jquery.counterup.min.js"
		type="text/javascript"></script>

	<!-- CUSTOM JS -->
	<script
		src="${pageContext.request.contextPath}/resources/js/jquery.app.js"></script>

	<!-- Dashboard -->
	<script
		src="${pageContext.request.contextPath}/resources/js/jquery.dashboard.js"></script>

	<!-- Chat -->
	<script
		src="${pageContext.request.contextPath}/resources/js/jquery.chat.js"></script>

	<!-- Todo -->
	<script
		src="${pageContext.request.contextPath}/resources/js/jquery.todo.js"></script>

	<script
		src="${pageContext.request.contextPath}/resources/assets/datatables/jquery.dataTables.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/assets/datatables/dataTables.bootstrap.js"></script>
		
		<script id="CONTENT_Importlist" type="text/x-jquery-tmpl">
	<tr>
		<td>{{= importDetail}} </td>
		<td><a herf="javascript:" style="cursor:pointer" id="impid">{{= impId}}</a></td>
		<td>{{= impDate}}</td>
		<td>{{= user.firstName +' '+ user.lastName}} </td>
		<td>{{= totalAmount}}</td>  
		<td class="actions" style="text-align: center;">
			<a class="on-default edit-row" href="${pageContext.request.contextPath}/admin/viewById/{{= impId}}">
				<i class="fa fa-pencil"></i>
			</a> 
		</td>
	</tr>
</script>
	<script type="text/javascript">
            /* ==============================================
            Counter Up
            =============================================== */
            jQuery(document).ready(function($) {
                $('.counter').counterUp({
                    delay: 100,
                    time: 1200
                });
            });
        </script>

	<!-- Examples -->
	<%-- <script src="${pageContext.request.contextPath}/resources/assets/magnific-popup/magnific-popup.js"></script>
	    <script src="${pageContext.request.contextPath}/resources/assets/jquery-datatables-editable/jquery.dataTables.js"></script> 
	    <script src="${pageContext.request.contextPath}/resources/assets/datatables/dataTables.bootstrap.js"></script>
	    <script src="${pageContext.request.contextPath}/resources/assets/jquery-datatables-editable/datatables.editable.init.js"></script> --%>

	<script>
    	$(function(){
    		listAllUsers(1);
    		
    		function listAllUsers(currentPage){
    			$.ajax({ 
				    url: "${pageContext.request.contextPath}/admin/listuser/", 
				    type: 'POST', 
				    dataType: 'JSON',  
				    beforeSend: function(xhr) {
	                    xhr.setRequestHeader("Accept", "application/json");
	                    xhr.setRequestHeader("Content-Type", "application/json");
	                },
				    success: function(data) {  
				   			console.log(data);
				    },
				    error:function(data,status,er) { 
				        console.log("error: "+data+" status: "+status+" er:"+er);
				    }
				});
    		}
    		
	    	$(document).on('click','#btnStatus',function(){
				var id = $(this).parents("tr").find("#USER_ID").html();
				var _this = $(this);
				$.ajax({ 
				    url: "${pageContext.request.contextPath}/admin/users/status/"+id, 
				    type: 'POST', 
				    dataType: 'JSON', 
				    //data: JSON.stringify(json), 
				    beforeSend: function(xhr) {
	                    xhr.setRequestHeader("Accept", "application/json");
	                    xhr.setRequestHeader("Content-Type", "application/json");
	                },
				    success: function(data) { 
				        if(data){
				        	if(_this.hasClass('btn-success')){
				        		_this.removeClass('btn-success');
				        		_this.addClass('btn-warning');
				        		_this.html('Inactive');
				        	}else if(_this.hasClass('btn-warning')){
				        		_this.removeClass('btn-warning');
				        		_this.addClass('btn-success');
				        		_this.html('Active');
				        	}else{
				        		_this.removeClass('btn-warning');
				        		_this.removeClass('btn-success');
				        		_this.removeClass('btn-danger');
				        		_this.removeClass('btn-info');
				        		_this.addClass('btn-success');
				        		_this.html('Active');
				        	}
				        }else{
				        	alert('YOU HAVE ERRORS WHEN CHANGING THE STATUS.');
				        }
				    },
				    error:function(data,status,er) { 
				        console.log("error: "+data+" status: "+status+" er:"+er);
				    }
				});
	    	});
	    	
	    	$(document).on('click','#btnDeleteUser',function(){
				var id = $(this).parents("tr").find("#USER_ID").html();
				var _this = $(this);
				$.ajax({ 
				    url: "${pageContext.request.contextPath}/admin/users/delete/"+id,
				    type: 'POST', 
				    dataType: 'JSON', 
				    //data: JSON.stringify(json), 
				    beforeSend: function(xhr) {
	                    xhr.setRequestHeader("Accept", "application/json");
	                    xhr.setRequestHeader("Content-Type", "application/json");
	                },
				    success: function(data) { 
				        if(data){
			        		_this.parents('tr').find("#btnStatus").removeClass('btn-warning');
			        		_this.parents('tr').find("#btnStatus").removeClass('btn-success');
			        		_this.parents('tr').find("#btnStatus").addClass('btn-danger');
			        		_this.parents('tr').find("#btnStatus").html('Deleted');
				        }else{
				        	alert('YOU HAVE ERRORS WHEN DELETE THE USER.');
				        }
				    },
				    error:function(data,status,er) { 
				        console.log("error: "+data+" status: "+status+" er:"+er);
				    }
				});
	    	});
	    	
	    	 
    	});
    	</script>
</body>
</html>