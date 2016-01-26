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

<title>KOSIGN WeCafe Slide List</title>

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



<body class="fixed-left-void" ng-app="wecafe">

	<!-- Begin page -->
	<div id="wrapper" ng-controller="SlideController as controller">

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
							<h4 class="pull-left page-title">Slide List</h4>
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
							<table class="table table-bordered table-striped"
								id="datatable-editable">
								<thead>
									<tr>
										<th>#</th>
										<th>Image</th>
										<th>Created By</th>
										<th style="text-align: center;">Created Date</th>
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
								<option value="4">4</option>
								<option value="8">8</option>
								<option value="12">12</option>
								<option value="16">16</option>
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



	<script>
            var resizefunc = [];
            var ctx = "${pageContext.request.contextPath}"
        </script>
	<script
		src="https://ajax.googleapis.com/ajax/libs/angularjs/1.4.4/angular.js"></script>
	<script src="<c:url value='/resources/scripts/dirPagination.js' />"></script>
	<script src="<c:url value='/resources/scripts/app.js' />"></script>
	<script
		src="<c:url value='/resources/scripts/services/slide_service.js' />"></script>
	<script
		src="<c:url value='/resources/scripts/controllers/slide_controller.js' />"></script>

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

	<!-- CUSTOM JS -->
	<script src="${pageContext.request.contextPath}/resources/js/jquery.app.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/jquery.tmpl.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/jquery.bootpag.min.js"></script>
	<script id="CONTENT_Slidelist" type="text/x-jquery-tmpl"> 
	<tr>
		<td id="SLIDE_ID" style="display: none">{{= id}}</td>
		<td>{{= order}}</td>
		<td style="text-align: center;"><img src="${pageContext.request.contextPath}/resources/images/products/{{= image }}"
											class="img-thumbnail" alt="" width="240px" height="240px" /></td>
		<td>{{= createdBy.lastName }} {{= createdBy.firstName }}</td>
		<td style="text-align: center;">{{= createdDate}}</td>
		<td style="text-align: center;" class="actions"><a href="#" class="hidden on-editing save-row">
			<i class="fa fa-save"></i></a> <a href="#" class="hidden on-editing cancel-row">
			<i class="fa fa-times"></i></a> <a href="${pageContext.request.contextPath}/admin/slide/update/{{= id}}"
											class="on-default edit-row"><i class="fa fa-pencil"></i></a>
											<a class="on-default remove-row" href="javascript:;"
											id="btnRemove"><i class="fa fa-trash-o"></i></a></td>
	</tr> 
</script>
	<script type="text/javascript">
    	$(function(){
    		var check = true;
			var order = 1;
			var v=[];
			var b = true;
    		listSlideImage(1);
	    	$(document).on('click','#btnRemove',function(){
				var id = $(this).parents("tr").find("#SLIDE_ID").html();
				if(confirm("Do you want to delete that slide?")){
					$.ajax({ 
					    url: "${pageContext.request.contextPath}/admin/slide/delete/"+id, 
					    type: 'POST', 
					    dataType: 'JSON', 
					    //data: JSON.stringify(json), 
					    beforeSend: function(xhr) {
		                    xhr.setRequestHeader("Accept", "application/json");
		                    xhr.setRequestHeader("Content-Type", "application/json");
		                },
					    success: function(data) { 
					        if(data){
					        	alert('YOU HAVE BEEN DELETED SUCCESSFULLY.');
					        	location.href="${pageContext.request.contextPath}/admin/slides";
					        }else{
					        	alert('YOU HAVE ERRORS WHEN DELETE EXSITING CATEGORY.');
					        }
					    },
					    error:function(data,status,er) { 
					        console.log("error: "+data+" status: "+status+" er:"+er);
					    }
					});
					
				}
			}); 
	    	
	 function listSlideImage(currentPage){
		 var json = {
				 	"currentPage" : currentPage,
		    		"perPage"     : $("#PER_PAGE").val() 
			};
			$.ajax({ 
			    url: "${pageContext.request.contextPath}/admin/listslide/", 
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
					if(data.slides.length>0){  
						$("tbody#CONTENTS").html('');					
						for(i=0; i<data.slides.length;i++)
							{
								format(data.slides[i]); 
							}
						$("#CONTENT_Slidelist").tmpl(data.slides).appendTo("tbody#CONTENTS"); 
					}else{
						$("tbody#CONTENTS").html('<tr>NO CONTENTS</tr>'); 
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
	 format = function(value){ 
			value["createdDate"] = value["createdDate"].substring(0, 10);
			/* if(value["lastUpdatedDate"] != null)
				value["lastUpdatedDate"] = value["lastUpdatedDate"].substring(0, 10); */
	 		if(b){
	 			order = v.pagination.perPage * (v.pagination.currentPage-1);
	 			j = order + 1;
	 			value["order"] =j;
	 			b = false;
	 		}
	 		else  
	 		value["order"] = ++j;  
}
   	 $("#PER_PAGE").change(function(){
			check = true;
			listSlideImage(1);
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
	     	listSlideImage(currentPage);
	     }); 
	 };
    	});
    	</script>
</body>
</html>