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
	
<!-- bootstrap switch  -->
<link href="${pageContext.request.contextPath}/resources/css/bootstrap-switch.min.css"rel="stylesheet">

<!-- Custom Files -->
<link href="${pageContext.request.contextPath}/resources/css/helper.css"
	rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/resources/css/style.css"
	rel="stylesheet" type="text/css" />



<script
	src="${pageContext.request.contextPath}/resources/js/modernizr.min.js"></script>

<style>
	.out_stock{
			color: :red;
	};
.carousel-inner>.item>img, .carousel-inner>.item>a>img {
	width: 70%;
	margin: auto;
}

.panel-body:hover {
	cursor: pointer;
}

.panel-body img {
	width: 80px;
	height: 100px;
}

#addtocart {
	width: 80%;
}

.modal-content {
	border-radius: 0;
}

.hidebtn {
	display: none;
}
.borderRed {
	border-color: red;
}
</style>

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
	
	<!-- Bootstrap switch -->
		<script
		src="${pageContext.request.contextPath}/resources/js/bootstrap-switch.min.js"></script>	
	
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
<%-- 	<!-- Pageination -->
		<script
		src="${pageContext.request.contextPath}/resources/js/jquery.bootpag.min.js"></script> --%>
	
<!-- Pageination -->
		<script src="${pageContext.request.contextPath}/resources/js/jquery.simplePagination.js"></script>
		
	<script type="text/javascript">
		var request_id="";
		var check = true;
		var products = {};
		var st=0;
		var data=[];
		var currentPage=1;
		$(function(){
			
			$("#PAGINATION").pagination({
				items: 10,
				itemsOnPage:10,
				cssStyle: 'light-theme',
				edges:3,
				displayedPages:3,
				currentPage:1,
				onPageClick:pageingClick
			});
			
			$("#out_of_stock").change(function(){
				
				$('tbody tr').each(function(){
					
					if($("#out_of_stock").val()=="out"){
					 if ($(this).hasClass("out_stock")){
						    $(this).show();	
						    st=1;
					}else{					 
							 $(this).hide();
						}
					}else{
						$(this).show();
						st=0;
					}						
				});
			});
			
			$("#btn_approve").click(function() {
				var error=false;
				if($("#req_no").val()!=0){
					$('tbody tr').each(function(){	
						 if ($(this).hasClass("out_stock")){
							 alert("Please check some product qty is out of stock"); 
							 error=true;
							 return false;
						 }
					});
					if(error==false){					 
						 approve_request();																											
					}
				}else{
					alert("Please select approve");				
				}
					
			});
	
			$("#request_stock").click(function() {	
					
				get_request_stock_detail(1);
				$('#request_stock_list').modal({
					"backdrop":"static"
				}) ;
				
			});
			
			$("#req_no").change(function(){		
			
				$("#out_of_stock option[value='all']").prop("selected",true);	
				request_id=$(this).val();			

				get_request_stock_detail(1);			
						
			});			
			
		});
		
		function pageingClick(pageN,event){
			currentPage=pageN;
			get_request_stock_detail(pageN);
			$("#out_of_stock option[value='all']").prop("selected",true);
		}
		
		function edit_qty(qty,remain_qty,obj){	
			var qty=$(obj).parent().siblings("#pro_qty").html();
			$(obj).parent().siblings("#pro_qty").html("<input type='text' value='"+qty+"' class='form-control'>");
			$(obj).parent().siblings("#remain_qty").html("<input type='text' value='"+remain_qty+"' class='form-control'>");
			$(obj).parent().find("#icon_edit").hide();
			$(obj).parent().find("#icon_save").show();
		
		}
		
		function update_qty(req_id,pro_id,obj){		
			
			var pro_qty=0, remain_qty=0;		
			
			$(obj).parent().find("#icon_edit").show();
			
			$(obj).parent().find("#icon_save").hide();
			
			pro_qty=parseInt($(obj).parent().siblings("#pro_qty").find("input").val());
			
			remain_qty=parseInt($(obj).parent().siblings("#remain_qty").find("input").val());
			
			$(obj).parent().siblings("#pro_qty").find("input").remove() ;
			
			$(obj).parent().siblings("#remain_qty").find("input").remove() ;		
			
			var input={
				"reqId" :req_id,
				"proId" :pro_id,
				"proQty" : pro_qty,
				"remainQty" : remain_qty
			}
		
			$.ajax({
				 url: "${pageContext.request.contextPath}/admin/update_req_qty", 
				 type: 'POST',
				 data:JSON.stringify(input),
				datatype: 'JSON',
				beforeSend: function(xhr) {
		            xhr.setRequestHeader("Accept", "application/json");
		            xhr.setRequestHeader("Content-Type", "application/json");
		        },
				success: function(data){
					if(data==true){
						get_request_stock_detail(currentPage);
					$("#out_of_stock option[value='all']").prop("selected",true);
					}
				},
				error:function(data, status,er){
					console.log("error: " + data + "status: " + status + "er: ");
				}
			});    
			
		}
		
		function approve_request(){
			
			var products=[];
		
					
			for(var i=0;i<data.RSD.length;i++){		
				
				var  pro_qty=data.RSD[i].pro_qty;							
				var  pro_id=data.RSD[i].pro_id;
				var  req_id=data.RSD[i].req_id;	
				
				var json={"reqId":req_id,"proId":pro_id,"proQty":pro_qty};
				products.push(json);
			}
	
			 $.ajax({
				 url: "${pageContext.request.contextPath}/admin/approve_request", 
				 type: 'POST',
				 data : JSON.stringify(products),
				datatype: 'JSON',
				beforeSend: function(xhr) {
		            xhr.setRequestHeader("Accept", "application/json");
		            xhr.setRequestHeader("Content-Type", "application/json");
		        },
				success: function(data){
					if(data==true){
						alert("Request has successfully approved");
						get_request_stock_detail(1);			
						$("#out_of_stock option[value='all']").prop("selected",true);
					};
				},
				error:function(data, status,er){
					console.log("error: " + data + "status: " + status + "er: ");
				}
			}); 
		}
			
		function get_request_stock_detail(currentPage){
			
			var result="",result1=""; 	
			var input={
					"currentPage" :currentPage,
		    		"perPage"     :10		
			}
 			$.ajax({
 				 url: "${pageContext.request.contextPath}/admin/list_request_stock_detail?req_id="+request_id, 
				 type: 'POST',
				 data:JSON.stringify(input),
 				datatype: 'JSON',
 				beforeSend: function(xhr) {
 		            xhr.setRequestHeader("Accept", "application/json");
 		            xhr.setRequestHeader("Content-Type", "application/json");
 		        },
 				success: function(v){
 					data=v;
 					if(v!=""){
 										
 						$("#req_no").html("");
 						
 						$("#PAGINATION").html("");

 						$("#PAGINATION").pagination('updateItems',v.pagination.totalCount);
 						
 						for(var i=0;i<v.RSD.length;i++){
 							
 							var pro_qty=v.RSD[i].pro_qty;							
 							var qty_stock=v.RSD[i].stock_qty;
 							var remain_qty=v.RSD[i].remain_qty;
 							var req_id=v.RSD[i].req_id;
 							var pro_id=v.RSD[i].pro_id;
 							var out_stock_style="";
 							var classOutStock="";
 							if(pro_qty > qty_stock ){
 								out_stock_style="color:red";	
 								classOutStock="out_stock";
 							}
 							
 							result+="<tr style='"+out_stock_style+"'  class='"+classOutStock+"'>"
									+"<td>"+req_id+"</td>"
									+"<td>"+pro_id+"</td>"
									+"<td>"+v.RSD[i].pro_name+"</td>"
									+"<td id='pro_qty'>"+pro_qty+"</td>"
									+"<td id='remain_qty'>"+remain_qty+"</td>"
									+"<td id='stock_qty'>"+qty_stock+"</td>"
									+"<td>"+v.RSD[i].firstname +" "+v.RSD[i].lastname+"</td>"
									+"<td>"+v.RSD[i].req_date+"</td>"
									+"<td>"
									+"<a id='icon_save' style='display: none;' href='#none' onclick='return update_qty("+req_id+","+pro_id+",this)'>"
									+ "<span  class='glyphicon glyphicon-save'></span></a>"
									+ "&nbsp;"
									+ "<a id='icon_edit'  href='#none' onclick='return edit_qty("+ pro_qty +","+remain_qty+",this)'>"
									+ "<span class='glyphicon glyphicon-pencil'></span></a></td>"
								+"</tr>";							
 							
 						}
 						
 						$("#request_stock_info").html(result);
 						
 						$("#req_no").prepend("<option value='0'>---Select Approve--</option>");
 						for(var i=0;i<v.RS.length;i++){
 						
 							var req_id1=v.RS[i].req_id;										
 												
 							result1+= "<option value='" + req_id1 + "'> " + req_id1 + " </option>";
 						}						
 						
 					
 						
 						$("#req_no").append(result1);
 						
 						$("#req_no option[value="+request_id+"]").attr("selected","selected");	
 						
 						request_id="";
 						 
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