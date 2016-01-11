<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
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

</head>



<body class="fixed-left-void">

	Dear
	<strong>${user}</strong>, Welcome to Admin Page.

	<sec:authorize access="isFullyAuthenticated()">
		<label><a href="#">Create New User</a> | <a href="#">View
				existing Users</a></label>
	</sec:authorize>
	<sec:authorize access="isRememberMe()">
		<label><a href="#">View existing Users</a></label>
	</sec:authorize>

	<!-- Begin page -->
	<div id="wrapper">


		<%@ include file="topbar.jsp"%>

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
							<h4 class="pull-left page-title">Welcome !</h4>
							<ol class="breadcrumb pull-right">
								<li><a href="#">KOSIGN WECAFE</a></li>
								<li class="active">Dashboard</li>
							</ol>
						</div>
					</div>

					<!-- Start Widget -->
					<div class="row">
						<div class="col-md-6 col-sm-6 col-lg-3">
							<div class="mini-stat clearfix bx-shadow">
								<span class="mini-stat-icon bg-info"><i
									class="ion-social-usd"></i></span>
								<div class="mini-stat-info text-right text-muted">
									<span class="counter">${TOTAL_SALES }</span> Total Sales
								</div>
							</div>
						</div>
						<div class="col-md-6 col-sm-6 col-lg-3" style="cursor: pointer;" id="request_stock">
							<div class="mini-stat clearfix bx-shadow">
								<span class="mini-stat-icon bg-purple"><i
									class="ion-ios7-cart"></i></span>
								<div class="mini-stat-info text-right text-muted">
									<span class="counter">${REQUEST_STOCK }</span> New Request
								</div>
							</div>
						</div>

						<div class="col-md-6 col-sm-6 col-lg-3">
							<div class="mini-stat clearfix bx-shadow">
								<span class="mini-stat-icon bg-primary"><i
									class="ion-android-contacts"></i></span>
								<div class="mini-stat-info text-right text-muted">
									<span class="counter">${TOTAL_USERS }</span> Total Users
								</div>
							</div>
						</div>
					</div>
					<!-- End row-->
				</div>

			</div>
			<!-- content -->

			<%@ include file="footer.jsp"%>

		</div>
		<!-- ============================================================== -->
		<!-- End Right content here -->
		<!-- ============================================================== -->

	</div>
	<!-- END wrapper -->

	<%@ include file="requeststocklist.jsp"%>

	<script>
		var resizefunc = [];
	</script>

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
		
	<!-- bpopup -->
	<script
		src="${pageContext.request.contextPath}/resources/js/jquery.bpopup.min.js"></script>
	<!-- Pageination -->
		<script
		src="${pageContext.request.contextPath}/resources/js/jquery.bootpag.min.js"></script>
		
	<script type="text/javascript">
		var req_id="";
		var check = true;
		var products = {};
		$(function(){
	
			$("#request_stock").click(function() {		
				get_request_stock_detail("",1);
				 $('#request_stock_list').bPopup();
			});
			$("#req_no").change(function(){
				req_id=$(this).val();			
				get_request_stock_detail(req_id,1);
			});
			
		});
		
		function setPagination(totalPage, currentPage){
	    	$('#PAGINATION').bootpag({
		        total: totalPage,
		        page: currentPage,
		        maxVisible:10,
		        leaps: true,
		        firstLastUse: true,
		        first: 'First',
		        last: 'Last',
		        wrapClass: 'pagination',
		        activeClass: 'active',
		        disabledClass: 'disabled',
		        nextClass: 'next',
		        prevClass: 'prev',
		        lastClass: 'last',
		        firstClass: 'first'
		    }).on("page", function(event, currentPage){
		    	check = false;
		    	get_request_stock_detail(req_id,currentPage);
		    }); 
		};
			
		function get_request_stock_detail(id,currentPage){		
			var result="",result1=""; 	
 			$.ajax({
 				 url: "${pageContext.request.contextPath}/admin/list_request_stock_detail?req_id="+id, 
				 type: 'POST',
				 data: {
			    		"currentPage" :currentPage,
			    		"perPage"     :10
				    },
 				datatype: 'JSON',
 				beforeSend: function(xhr) {
 		            xhr.setRequestHeader("Accept", "application/json");
 		            xhr.setRequestHeader("Content-Type", "application/json");
 		        },
 				success: function(v){
 				//	console.log(data);
 					if(v!=""){
 										
 						$("#req_no").html("");
 						for(var i=0;i<v.RSD.length;i++){
 							result+="<tr>"
									+"<td>"+v.RSD[i].req_id+"</td>"
									+"<td>"+v.RSD[i].pro_id+"</td>"
									+"<td>"+v.RSD[i].pro_name+"</td>"
									+"<td>"+v.RSD[i].pro_qty+"</td>"
									+"<td>"+v.RSD[i].remain_qty+"</td>"
									+"<td>"+v.RSD[i].stock_qty+"</td>"
									+"<td>"+v.RSD[i].firstname +" "+v.RSD[i].lastname+"</td>"
									+"<td>"+v.RSD[i].req_date+"</td>"
								+"</tr>";
 						}
 						
 						$("#request_stock_info").html(result);
 						
 						$("#req_no").prepend("<option value=''>--Select Approve--</option><option value='0'>Approve All</option>");
 						for(var i=0;i<v.RS.length;i++){
 						
 							var req_id1=v.RS[i].req_id;
 							var selected = "";
 							
 							if (req_id1 == req_id) {
 								selected = "selected";
 							}
 							
 							result1+= "<option value='" + req_id1 + "'" + selected+ "> " + req_id1 + " </option>";
 						}
 						req_id="";
 						$("#req_no").append(result1);
 						
 						if(check){
				    		setPagination(v.pagination.totalPages,currentPage);
				    		check=false;
				    	}
 						
 					}
 				},
 				error:function(data, status,er){
 					console.log("error: " + data + "status: " + status + "er: ");
 				}
 			});    
		}
	</script>

</body>
</html>