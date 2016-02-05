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
	
<link href="${pageContext.request.contextPath}/resources/css/customize.css" rel="stylesheet" type="text/css" />

<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
        <![endif]-->

<script
	src="${pageContext.request.contextPath}/resources/js/modernizr.min.js"></script>

</head>



<body class="fixed-left-void" ng-app="wecafe">

	<!-- Begin page -->
	<div id="wrapper" ng-controller="CategoryController as controller">

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
							<h4 class="pull-left page-title">Unit List</h4>
						</div>
					</div>


					<div class="panel">
						<div class="panel-heading">
							<!-- <h3 class="panel-title">Product Lists</h3> -->
							<div class="row">
								<!-- <h3 class="panel-title">Product Lists</h3> -->
								<div class="col-md-8">
									<form class="form-inline">
										<div class="form-group">
											<label>Search</label> <input type="text" id="txtSearch"
												class="form-control" placeholder="Search" width="400%">
												<input type="button" class="btn btn-default" id="btnSearch" value="Search">
										</div>
										
									</form>
								</div>	
									
										<div class="col-md-2 pull-right" style="text-align: right;">
										<button id="btn_add_unit" class="btn btn-primary">Add
											Unit</button>
											
										</div>
									
								</div>
						</div>
						<div class="panel-body">
							<table class="overflow-x"
								id="datatable-editable">
								<thead>
									<tr>
										<th>#</th>
										<th>Unit Name</th>
										<th>QTY</th>
										<th>Type</th>
										<th style="text-align: center;">Actions</th>
									</tr>
								</thead>
								<tbody id="CONTENTS">
									
								</tbody>
							</table>
						</div>
						<!-- end: page -->

					</div>
					<!-- end Panel -->
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
				<!-- container -->

			</div>
			<!-- content -->

			<%@ include file="footer.jsp"%>

		</div>
		<!-- ============================================================== -->
		<!-- End Right content here -->
		<!-- ============================================================== -->

	</div>
	<!-- END wrapper -->


	<!-- ========== Include category add ========== -->
	<%@ include file="unitadd.jsp"%>


	<script>
            var resizefunc = [];
            var ctx = "${pageContext.request.contextPath}"
    </script>
	<script
		src="https://ajax.googleapis.com/ajax/libs/angularjs/1.4.4/angular.js"></script>
	<script src="<c:url value='/resources/scripts/dirPagination.js' />"></script>
	<script src="<c:url value='/resources/scripts/app.js' />"></script>
	
	<script
		src="<c:url value='/resources/scripts/services/category_service.js' />"></script>
	<script
		src="<c:url value='/resources/scripts/controllers/category_controller.js' />"></script>

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
	<script	src="${pageContext.request.contextPath}/resources/js/numeral.min.js"></script>
		<!-- CUSTOM JS -->
	<script
		src="${pageContext.request.contextPath}/resources/js/jquery.app.js"></script>
	<!-- Chat -->
	<script
		src="${pageContext.request.contextPath}/resources/js/jquery.chat.js"></script>

	<!-- Todo -->
	<script
		src="${pageContext.request.contextPath}/resources/js/jquery.todo.js"></script>

	<script
		src="${pageContext.request.contextPath}/resources/assets/notifications/notify.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/assets/notifications/notify-metro.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/assets/notifications/notifications.js"></script>
			<script
		src="${pageContext.request.contextPath}/resources/js/jquery.tmpl.min.js"></script>
		<script	src="${pageContext.request.contextPath}/resources/js/numeral.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/jquery.bootpag.min.js"></script>
	<script id="CONTENT_Unitlist" type="text/x-jquery-tmpl">
	<tr> 
			<td id="unitId" style="display: none;">{{= unitId}}</td>
			<td>{{= order}}</td>  
			<td>{{= unitName }}</td> 
			<td>{{= qty }}</td>
			<td>{{= to }}</td>
			<td style="text-align: center;" class="actions">
				<a href="#" class="hidden on-editing save-row"><i class="fa fa-save"></i></a>
				<a href="#" class="hidden on-editing cancel-row"><i class="fa fa-times"></i></a>
				<a href="${pageContext.request.contextPath}/admin/updateunit/{{= unitId}}"
					class="on-default edit-row"><i class="fa fa-pencil"></i></a>
	</tr>
	</script>

	<!--  <script src="http://malsup.github.com/jquery.form.js"></script> -->

	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/jquery.form/3.51/jquery.form.min.js"></script>	

	<script type="text/javascript">
	var isAdded=false;
    	$(function(){
    		var check = true;
    		var order = 1;
    		var v=[];
    		var b = true;
    		listunit(1);
    		$("#btnSearch").click(function(){
				str = $("#txtSearch").val();
				if(str == ""){
					listunit(1);
					return ;
				} 
				$.ajax({
					url: "${pageContext.request.contextPath}/admin/searchunit/" + str,
					type: 'GET',
					dataType: 'JSON',
					beforeSend: function(xhr){
						xhr.setRequestHeader("Accept", "application/json");
						xhr.setRequestHeader("Context-Type", "application/json");
					},
					success: function(data){
						console.log(data); 
						b =true;
					//	v=data; 
				    	 if(data.unitSearch.length>0){  
								$("tbody#CONTENTS").html(''); 
								for(i=0; i<data.unitSearch.length;i++)
								{ 
									format(data.unitSearch[i]); 
								}
								$("#CONTENT_Unitlist").tmpl(data.unitSearch).appendTo("tbody#CONTENTS"); 
							}else{
								$("tbody#CONTENTS").html('');
								$("#allTotalAmount").val("");
							}
					},
					error:function(data,status,er){
						console.log("error: "+data+" status: "+status+" er:"+er);
					}
				});
			});
    		
    		function listunit(currentPage){
    			var json = {
					 	"currentPage" : currentPage, 
			    		"perPage"     : $("#PER_PAGE").val()  
				};
    			$.ajax({
				    url: "${pageContext.request.contextPath}/admin/listunit/",
				    type: 'GET', 
				    data: json,
				    beforeSend: function(xhr) {
	                    xhr.setRequestHeader("Accept", "application/json");
	                    xhr.setRequestHeader("Content-Type", "application/json");
	                },
				    success: function(data) { 
				    	console.log(data);
				    	b =true;
						v=data; 
				    	 if(data.units.length>0){  
								$("tbody#CONTENTS").html(''); 
								for(i=0; i<data.units.length;i++)
								{ 
									format(data.units[i]); 
								}
								$("#CONTENT_Unitlist").tmpl(data.units).appendTo("tbody#CONTENTS"); 
							}else{
								$("tbody#CONTENTS").html('<tr>NO CONTENTS</tr>');
								$("#allTotalAmount").val("");
							}
					    	if(check){
					    		setPagination(data.pagination.totalPages,1);
					    		check=false;
					    	} 
				    },
				    error:function(data,status,er) { 
				        console.log("error: "+data+" status: "+status+" er:"+er);
				    }
				}); 
    		}
    		
    		function format(value){
    			value["qty"] = (numeral(value["qty"]).format('0,0'));   
    		 	if(b){
		 			order = v.pagination.perPage * (v.pagination.currentPage-1);
		 			j = order + 1;
		 			value["order"] =j;
		 			b = false;
		 		}
		 		else  
		 		value["order"] = ++j; 
    		}
    		
			$("#btnSubmit").click(function(e){
				e.preventDefault();
				
				if($("#unitname").val()==""){
					alert("Unitname is required");
					return;
				}
				if($("#unitqty").val()==""){
					alert("Unitqty is required");
					return;
				}
				if($("#unittype").val()==""){
					alert("Unittype is required");
					return;
				}
				
				$("#frmAddCategory").ajaxSubmit({
					url: "${pageContext.request.contextPath}/admin/addnewunit",
					dataType: 'JSON', 
					type: 'POST',
					success: function(data) { 
						console.log(data);
 				        if(data){
 				        	alert('Has been successfully added.');
 				        	isAdded=true;
 				        	clearFormUnit();
 				        }else{
 				        	alert('YOU HAVE ERRORS WHEN INSERT NEW CATEGORY.');
 				        }
 				    },
 				    error:function(data,status,er) { 
 				        console.log("error: "+data+" status: "+status+" er:"+er);
 				    }
				});
			});    		
    		
	    	
	    	$('#form_add_unit').on('hidden.bs.modal', function (event) {
	    		if(isAdded==true)location.href="${pageContext.request.contextPath}/admin/unitlist";
			})
    		
    		$("#btn_cancel").click(function(){
    			$('#form_add_unit').modal('hide');
    			
    		});
        		
			$("#btn_add_unit").click(function(){    	
				clearFormUnit();
				$('#form_add_unit').modal({
					"backdrop":"static"
				}) ;
			});	
			$("#PER_PAGE").change(function(){
	 			check = true;
	 			listunit(1);
			    });

			setPagination = function(totalPage, currentPage){
		    	$('#PAGINATION').bootpag({
			        total: totalPage,
			        page: currentPage,
			        maxVisible: 10,
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
			    	listunit(currentPage);
			    }); 
			};
    	});
    	
    	
    	function clearFormUnit(){
    		$("#unitname").val("");
    		$("#unitqty").val("");
    		$("#unittype").val("");
    		$("#unitname").focus();
    	}
    	</script>
</body>
</html>