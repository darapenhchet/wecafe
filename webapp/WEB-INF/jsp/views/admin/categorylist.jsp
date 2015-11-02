<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="A fully featured admin theme which can be used to build CRM, CMS, etc.">
        <meta name="author" content="Coderthemes">

        <link rel="shortcut icon" href="images/favicon_1.ico">

        <title>KOSIGN WeCafe...</title>

        <!-- Base Css Files -->
        <link href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css" rel="stylesheet" />

        <!-- Font Icons -->
        <link href="${pageContext.request.contextPath}/resources/assets/font-awesome/css/font-awesome.min.css" rel="stylesheet" />
        <link href="${pageContext.request.contextPath}/resources/assets/ionicon/css/ionicons.min.css" rel="stylesheet" />
        <link href="${pageContext.request.contextPath}/resources/css/material-design-iconic-font.min.css" rel="stylesheet">

        <!-- animate css -->
        <link href="${pageContext.request.contextPath}/resources/css/animate.css" rel="stylesheet" />

        <!-- Waves-effect -->
        <link href="${pageContext.request.contextPath}/resources/css/waves-effect.css" rel="stylesheet">

        <!-- sweet alerts -->
        <link href="${pageContext.request.contextPath}/resources/assets/sweet-alert/sweet-alert.min.css" rel="stylesheet">

        <!-- Custom Files -->
        <link href="${pageContext.request.contextPath}/resources/css/helper.css" rel="stylesheet" type="text/css" />
        <link href="${pageContext.request.contextPath}/resources/css/style.css" rel="stylesheet" type="text/css" />

        <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
        <![endif]-->

        <script src="${pageContext.request.contextPath}/resources/js/modernizr.min.js"></script>
        
    </head>



    <body class="fixed-left-void">
        
        <!-- Begin page -->
        <div id="wrapper">
        
            <!-- Top Bar Start -->
			<%@ include file="topbar.jsp" %>
            <!-- Top Bar End -->


            <!-- ========== Left Sidebar Start ========== -->
            <%@ include file="left_sidebar.jsp" %>
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
                                <h4 class="pull-left page-title">Product List</h4>
                            </div>
                        </div>


                        <div class="panel">
                            
                            <div class="panel-body">
                                <div class="row">
                                    <div class="col-sm-6">
                                        <div class="m-b-30">
                                            <button id="addToTable" class="btn btn-primary waves-effect waves-light">Add <i class="fa fa-plus"></i></button>
                                        </div>
                                    </div>
                                </div>
                                <table class="table table-bordered table-striped" id="datatable-editable">
                                    <thead>
                                        <tr>
                                            <th>#</th>
                                            <th>Category Name</th>
                                            <th>Image</th>
                                            <th>Created By</th>
                                            <th>Created Date</th>
                                            <th>Updated By</th>
                                            <th>Updated Date</th>                                        
                                            <th>Actions</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach items="${categories}" var="category" varStatus="theCount">
                                        <tr class="gradeX">
                                            <td id="CATEGORY_ID" style="display : none;">${category.catId}</td>
                                            <td >${theCount.count }</td>
                                            <td>${category.catName }</td>
                                            <td style="text-align:center;"><img src="${pageContext.request.contextPath}/resources/images/categories/${category.img }" class="img-thumbnail" alt="${category.catName}" width="30px" height="30px" /></td>
                                            <td>${category.createdBy.lastName } ${category.createdBy.firstName }</td>
                                            <td>${category.createdDate}</td>
                                            <td>${category.lastUpdatedBy.lastName } ${category.lastUpdatedBy.firstName }</td>
                                            <td>${category.lastUpdatedDate}</td>
                                            <td style="text-align:center;" class="actions">
                                                <a href="#" class="hidden on-editing save-row"><i class="fa fa-save"></i></a>
                                                <a href="#" class="hidden on-editing cancel-row"><i class="fa fa-times"></i></a>
                                                <a href="${pageContext.request.contextPath}/admin/category/update/${category.catId}" class="on-default edit-row"><i class="fa fa-pencil"></i></a>
                                                <a class="on-default remove-row" href="javascript:;" id="btnRemove"><i class="fa fa-trash-o"></i></a>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                            <!-- end: page -->

                        </div> <!-- end Panel -->

                    </div> <!-- container -->
                               
                </div> <!-- content -->

                <%@ include file="footer.jsp" %>

            </div>
            <!-- ============================================================== -->
            <!-- End Right content here -->
            <!-- ============================================================== -->


            <!-- Right Sidebar -->
            <div class="side-bar right-bar nicescroll">
                <h4 class="text-center">Chat</h4>
                <div class="contact-list nicescroll">
                    <ul class="list-group contacts-list">
                        <li class="list-group-item">
                            <a href="#">
                                <div class="avatar">
                                    <img src="${pageContext.request.contextPath}/resources/images/users/avatar-1.jpg" alt="">
                                </div>
                                <span class="name">Chadengle</span>
                                <i class="fa fa-circle online"></i>
                            </a>
                            <span class="clearfix"></span>
                        </li>
                        <li class="list-group-item">
                            <a href="#">
                                <div class="avatar">
                                    <img src="${pageContext.request.contextPath}/resources/images/users/avatar-2.jpg" alt="">
                                </div>
                                <span class="name">Tomaslau</span>
                                <i class="fa fa-circle online"></i>
                            </a>
                            <span class="clearfix"></span>
                        </li>
                        <li class="list-group-item">
                            <a href="#">
                                <div class="avatar">
                                    <img src="${pageContext.request.contextPath}/resources/images/users/avatar-3.jpg" alt="">
                                </div>
                                <span class="name">Stillnotdavid</span>
                                <i class="fa fa-circle online"></i>
                            </a>
                            <span class="clearfix"></span>
                        </li>
                        <li class="list-group-item">
                            <a href="#">
                                <div class="avatar">
                                    <img src="${pageContext.request.contextPath}/resources/images/users/avatar-4.jpg" alt="">
                                </div>
                                <span class="name">Kurafire</span>
                                <i class="fa fa-circle online"></i>
                            </a>
                            <span class="clearfix"></span>
                        </li>
                        <li class="list-group-item">
                            <a href="#">
                                <div class="avatar">
                                    <img src="${pageContext.request.contextPath}/resources/images/users/avatar-5.jpg" alt="">
                                </div>
                                <span class="name">Shahedk</span>
                                <i class="fa fa-circle away"></i>
                            </a>
                            <span class="clearfix"></span>
                        </li>
                        <li class="list-group-item">
                            <a href="#">
                                <div class="avatar">
                                    <img src="${pageContext.request.contextPath}/resources/images/users/avatar-6.jpg" alt="">
                                </div>
                                <span class="name">Adhamdannaway</span>
                                <i class="fa fa-circle away"></i>
                            </a>
                            <span class="clearfix"></span>
                        </li>
                        <li class="list-group-item">
                            <a href="#">
                                <div class="avatar">
                                    <img src="${pageContext.request.contextPath}/resources/images/users/avatar-7.jpg" alt="">
                                </div>
                                <span class="name">Ok</span>
                                <i class="fa fa-circle away"></i>
                            </a>
                            <span class="clearfix"></span>
                        </li>
                        <li class="list-group-item">
                            <a href="#">
                                <div class="avatar">
                                    <img src="${pageContext.request.contextPath}/resources/images/users/avatar-8.jpg" alt="">
                                </div>
                                <span class="name">Arashasghari</span>
                                <i class="fa fa-circle offline"></i>
                            </a>
                            <span class="clearfix"></span>
                        </li>
                        <li class="list-group-item">
                            <a href="#">
                                <div class="avatar">
                                    <img src="${pageContext.request.contextPath}/resources/images/users/avatar-9.jpg" alt="">
                                </div>
                                <span class="name">Joshaustin</span>
                                <i class="fa fa-circle offline"></i>
                            </a>
                            <span class="clearfix"></span>
                        </li>
                        <li class="list-group-item">
                            <a href="#">
                                <div class="avatar">
                                    <img src="${pageContext.request.contextPath}/resources/images/users/avatar-10.jpg" alt="">
                                </div>
                                <span class="name">Sortino</span>
                                <i class="fa fa-circle offline"></i>
                            </a>
                            <span class="clearfix"></span>
                        </li>
                    </ul>  
                </div>
            </div>
            <!-- /Right-bar -->

        </div>
        <!-- END wrapper -->


    
        <script>
            var resizefunc = [];
        </script>

        <!-- jQuery  -->
        <script src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script>
        <script src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>
        <script src="${pageContext.request.contextPath}/resources/js/waves.js"></script>
        <script src="${pageContext.request.contextPath}/resources/js/wow.min.js"></script>
        <script src="${pageContext.request.contextPath}/resources/js/jquery.nicescroll.js" type="text/javascript"></script>
        <script src="${pageContext.request.contextPath}/resources/js/jquery.scrollTo.min.js"></script>
        <script src="${pageContext.request.contextPath}/resources/assets/chat/moment-2.2.1.js"></script>
        <script src="${pageContext.request.contextPath}/resources/assets/jquery-sparkline/jquery.sparkline.min.js"></script>
        <script src="${pageContext.request.contextPath}/resources/assets/jquery-detectmobile/detect.js"></script>
        <script src="${pageContext.request.contextPath}/resources/assets/fastclick/fastclick.js"></script>
        <script src="${pageContext.request.contextPath}/resources/assets/jquery-slimscroll/jquery.slimscroll.js"></script>
        <script src="${pageContext.request.contextPath}/resources/assets/jquery-blockui/jquery.blockUI.js"></script>

        <!-- sweet alerts -->
        <script src="${pageContext.request.contextPath}/resources/assets/sweet-alert/sweet-alert.min.js"></script>
        <script src="${pageContext.request.contextPath}/resources/assets/sweet-alert/sweet-alert.init.js"></script>

        <!-- CUSTOM JS -->
        <script src="${pageContext.request.contextPath}/resources/js/jquery.app.js"></script>

    	<script type="text/javascript">
    	$(function(){
	    	$(document).on('click','#btnRemove',function(){
				var id = $(this).parents("tr").find("#CATEGORY_ID").html();
				if(confirm("Do you want to delete that category?")){
					$.ajax({ 
					    url: "${pageContext.request.contextPath}/admin/category/delete/"+id, 
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
					        	location.href="${pageContext.request.contextPath}/admin/categorylist";
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
    	});
    	</script>
    </body>
</html>