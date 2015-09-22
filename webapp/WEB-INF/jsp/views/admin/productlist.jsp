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

        <link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/images/favicon_1.ico">

        <title>KOSIGN - WECAFE</title>

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

        <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
        <![endif]-->

        <script src="${pageContext.request.contextPath}/resources/js/modernizr.min.js"></script>
        
    </head>



    <body class="fixed-left">
        
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
                                <ol class="breadcrumb pull-right">
                                    <li><a href="#">KOSIGN WECAFE</a></li>
                                    <li class="active">Product List</li>
                                </ol>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-12">
                                <div class="panel panel-default">
                                    <div class="panel-heading">
                                        <!-- <h3 class="panel-title">Product Lists</h3> -->
                                    </div>
                                    <div class="panel-body">
                                        <div class="row">
                                            <div class="col-md-12 col-sm-12 col-xs-12">
                                                <table id="datatable" class="table table-striped table-bordered">
                                                    <thead>
                                                        <tr>
                                                        	<th>#</th>
                                                            <th>Name</th>
                                                            <th style="text-align:right;">Quantity</th>
                                                            <th style="text-align:right;">Unit Price</th>
                                                            <th style="text-align:right;">Cost Price</th>
                                                            <th style="text-align:right;">Sale Price</th>
                                                            <th>Category</th>
                                                            <th>Image</th>
                                                        </tr>
                                                    </thead>

                                             
                                                    <tbody>
                                                    	<c:forEach items="${products}" var="product">
                                                        <tr>
                                                        	<td>${product.productId }</td>
                                                            <td>${product.productName}</td>
                                                            <td style="text-align:right;">${product.quantity}</td>
                                                            <td style="text-align:right;">${product.unitPrice} <span style="font-weight:bold;">Riel</span></td>
                                                            <td style="text-align:right;">${product.costPrice} <span style="font-weight:bold;">Riel</span>​</td>
                                                            <td style="text-align:right;">${product.salePrice} <span style="font-weight:bold;">Riel</span></td>
                                                            <td>${product.category.catName}</td>
                                                            <td>${product.image}</td>
                                                        </tr>
														</c:forEach>
                                                    </tbody>
                                                </table>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            
                        </div> <!-- End Row -->


                    </div> <!-- container -->
                               
                </div> <!-- content -->

                <%@ include file="footer.jsp" %>

            </div>
            <!-- ============================================================== -->
            <!-- End Right content here -->
            <!-- ============================================================== -->


<!--             Right Sidebar
            <div class="side-bar right-bar nicescroll">
                <h4 class="text-center">Chat</h4>
                <div class="contact-list nicescroll">
                    <ul class="list-group contacts-list">
                        <li class="list-group-item">
                            <a href="#">
                                <div class="avatar">
                                    <img src="images/users/avatar-1.jpg" alt="">
                                </div>
                                <span class="name">Chadengle</span>
                                <i class="fa fa-circle online"></i>
                            </a>
                            <span class="clearfix"></span>
                        </li>
                        <li class="list-group-item">
                            <a href="#">
                                <div class="avatar">
                                    <img src="images/users/avatar-2.jpg" alt="">
                                </div>
                                <span class="name">Tomaslau</span>
                                <i class="fa fa-circle online"></i>
                            </a>
                            <span class="clearfix"></span>
                        </li>
                        <li class="list-group-item">
                            <a href="#">
                                <div class="avatar">
                                    <img src="images/users/avatar-3.jpg" alt="">
                                </div>
                                <span class="name">Stillnotdavid</span>
                                <i class="fa fa-circle online"></i>
                            </a>
                            <span class="clearfix"></span>
                        </li>
                        <li class="list-group-item">
                            <a href="#">
                                <div class="avatar">
                                    <img src="images/users/avatar-4.jpg" alt="">
                                </div>
                                <span class="name">Kurafire</span>
                                <i class="fa fa-circle online"></i>
                            </a>
                            <span class="clearfix"></span>
                        </li>
                        <li class="list-group-item">
                            <a href="#">
                                <div class="avatar">
                                    <img src="images/users/avatar-5.jpg" alt="">
                                </div>
                                <span class="name">Shahedk</span>
                                <i class="fa fa-circle away"></i>
                            </a>
                            <span class="clearfix"></span>
                        </li>
                        <li class="list-group-item">
                            <a href="#">
                                <div class="avatar">
                                    <img src="images/users/avatar-6.jpg" alt="">
                                </div>
                                <span class="name">Adhamdannaway</span>
                                <i class="fa fa-circle away"></i>
                            </a>
                            <span class="clearfix"></span>
                        </li>
                        <li class="list-group-item">
                            <a href="#">
                                <div class="avatar">
                                    <img src="images/users/avatar-7.jpg" alt="">
                                </div>
                                <span class="name">Ok</span>
                                <i class="fa fa-circle away"></i>
                            </a>
                            <span class="clearfix"></span>
                        </li>
                        <li class="list-group-item">
                            <a href="#">
                                <div class="avatar">
                                    <img src="images/users/avatar-8.jpg" alt="">
                                </div>
                                <span class="name">Arashasghari</span>
                                <i class="fa fa-circle offline"></i>
                            </a>
                            <span class="clearfix"></span>
                        </li>
                        <li class="list-group-item">
                            <a href="#">
                                <div class="avatar">
                                    <img src="images/users/avatar-9.jpg" alt="">
                                </div>
                                <span class="name">Joshaustin</span>
                                <i class="fa fa-circle offline"></i>
                            </a>
                            <span class="clearfix"></span>
                        </li>
                        <li class="list-group-item">
                            <a href="#">
                                <div class="avatar">
                                    <img src="images/users/avatar-10.jpg" alt="">
                                </div>
                                <span class="name">Sortino</span>
                                <i class="fa fa-circle offline"></i>
                            </a>
                            <span class="clearfix"></span>
                        </li>
                    </ul>  
                </div>
            </div>
            /Right-bar -->


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
        <script src="${pageContext.request.contextPath}/resources/assets/jquery-detectmobile/detect.js"></script>
        <script src="${pageContext.request.contextPath}/resources/assets/fastclick/fastclick.js"></script>
        <script src="${pageContext.request.contextPath}/resources/assets/jquery-slimscroll/jquery.slimscroll.js"></script>
        <script src="${pageContext.request.contextPath}/resources/assets/jquery-blockui/jquery.blockUI.js"></script>


        <!-- CUSTOM JS -->
        <script src="${pageContext.request.contextPath}/resources/js/jquery.app.js"></script>

        <script src="${pageContext.request.contextPath}/resources/assets/datatables/jquery.dataTables.min.js"></script>
        <script src="${pageContext.request.contextPath}/resources/assets/datatables/dataTables.bootstrap.js"></script>


        <script type="text/javascript">
            $(document).ready(function() {
                $('#datatable').dataTable();
            } );
        </script>

	</body>
</html>