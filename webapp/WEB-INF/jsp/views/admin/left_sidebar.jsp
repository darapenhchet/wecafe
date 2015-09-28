
            <div class="left side-menu">
                <div class="sidebar-inner slimscrollleft">
                    <div class="user-details">
                        <div class="pull-left">
                            <img src="${pageContext.request.contextPath}/resources/images/img/Coke.jpg" alt="" class="thumb-md img-circle">
                        </div>
                        <div class="user-info">
                            <div class="dropdown">
                                <a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-expanded="false">Administrator <span class="caret"></span></a>
                                <ul class="dropdown-menu">
                                    <li><a href="javascript:void(0)"><i class="md md-face-unlock"></i> Profile<div class="ripple-wrapper"></div></a></li>
                                    <li><a href="javascript:void(0)"><i class="md md-settings"></i> Settings</a></li>
                                    <!-- <li><a href="javascript:void(0)"><i class="md md-lock"></i> Lock screen</a></li> -->
                                    <li><a href="<c:url value='/admin/logout' />"><i class="md md-settings-power"></i> Logout</a></li>
                                </ul>
                            </div>
                            
                            <p class="text-muted m-0">Administrator</p>
                        </div>
                    </div>
                    <!--- Divider -->
                    <div id="sidebar-menu">
                        <ul>
                            <li>
                                <a href="${pageContext.request.contextPath}/admin/" class="waves-effect active"><i class="md md-home"></i><span> Dashboard </span></a>
                            </li>

                            <li class="has_sub">
                                <a href="#" class="waves-effect"><i class="ion-ios7-cart"></i><span> Product </span><span class="pull-right"><i class="md md-add"></i></span></a>
                                <ul class="list-unstyled">
                                    <li><a href="${pageContext.request.contextPath}/admin/products">Product List</a></li>
                                    <li><a href="${pageContext.request.contextPath}/admin/productadd">Add Product</a></li>
                                </ul>
                            </li>

                            <li>
                                <a href="#" class="waves-effect"><i class="md md-mail"></i><span> Category </span><span class="pull-right"><i class="md md-add"></i></span></a>
                                <ul class="list-unstyled">
                                    <li><a href="${pageContext.request.contextPath}/admin/categorylist">Category List</a></li>
                                    <li><a href="${pageContext.request.contextPath}/admin/categoryadd">Add Category</a></li>
                                </ul>
                            </li>

                            <li class="has_sub">
                                <a href="#" class="waves-effect"><i class="md md-palette"></i> <span> Import </span> <span class="pull-right"><i class="md md-add"></i></span></a>
                                <ul class="list-unstyled">
                                    <li><a href="${pageContext.request.contextPath}/admin/orderlist">Import List</a></li>
                                    <li><a href="${pageContext.request.contextPath}/admin/orderadd">Add Import</a></li>
                                </ul>
                            </li>

                            <li class="has_sub">
                                <a href="#" class="waves-effect"><i class="ion-social-usd"></i><span> Sale </span><span class="pull-right"><i class="md md-add"></i></span></a>
                                <ul class="list-unstyled">
                                    <li><a href="${pageContext.request.contextPath}/admin/salelist">Sale List</a></li>
                                    <%-- <li><a href="${pageContext.request.contextPath}/admin/saleadd">Add Sale</a></li> --%>
                                </ul>
                            </li>

                            <li class="has_sub">
                                <a href="#" class="waves-effect"><i class="md md-redeem"></i> <span> Supplier</span> <span class="pull-right"><i class="md md-add"></i></span></a>
                                <ul class="list-unstyled">
                                    <li><a href="${pageContext.request.contextPath}/admin/supplierlist">Supplier List</a></li>
                                    <li><a href="${pageContext.request.contextPath}/admin/supplieradd">Add Supplier</a></li>
                                </ul>
                            </li>
                            
                            <li class="has_sub">
                                <a href="#" class="waves-effect"><i class="md md-now-widgets"></i><span> Reports </span><span class="pull-right"><i class="md md-add"></i></span></a>
                               <ul class="list-unstyled">
                                    <li><a href="${pageContext.request.contextPath}/admin/supplierlist">Sale Reports</a></li>
                                    <li><a href="${pageContext.request.contextPath}/admin/supplierlist">Order Reports</a></li>
                                    <li><a href="${pageContext.request.contextPath}/admin/supplierlist">Import Reports</a></li>
                                    <li><a href="${pageContext.request.contextPath}/admin/supplierlist">Income Reports</a></li>
                                    <li><a href="${pageContext.request.contextPath}/admin/supplierlist">Expense Reports</a></li>
                                </ul>
                            </li>
                            
                            <li class="has_sub">
                                <a href="#" class="waves-effect"><i class="md md-now-widgets"></i><span> Users </span><span class="pull-right"><i class="md md-add"></i></span></a>
                               <ul class="list-unstyled">
                                    <li><a href="${pageContext.request.contextPath}/admin/userlist">User List</a></li>
                                    <li><a href="${pageContext.request.contextPath}/admin/useradd">Add User</a></li>
                                    <li><a href="${pageContext.request.contextPath}/admin/supplieradd">Change Password</a></li>
                                </ul>
                            </li>
                            
                            <li class="has_sub">
                                <a href="#" class="waves-effect"><i class="md md-view-list"></i><span> Setting </span><span class="pull-right"><i class="md md-add"></i></span></a>
                                <ul class="list-unstyled">
                                    <li><a href="${pageContext.request.contextPath}/admin/supplierlist">Slide List</a></li>
                                    <%-- <li><a href="${pageContext.request.contextPath}/admin/supplieradd">Add Supplier</a></li> --%>

                                </ul>
                            </li>                            
                           
                        </ul>
                        <div class="clearfix"></div>
                    </div>
                    <div class="clearfix"></div>
                </div>
            </div>