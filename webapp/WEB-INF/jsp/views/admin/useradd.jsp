<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- Modal -->
<div class="modal fade" id="form_add_user" role="dialog ">
	<div class="modal-dialog modal-lg" style="width: 80%">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
				<h4 class="modal-title">Form Add Products</h4>
			</div>
			<div class="modal-body">
				<div class=" form">
										<form class="cmxform form-horizontal tasi-form"
											id="frmAddNewUser" method="POST"
											action="${pageContext.request.contextPath}/admin/users/add"
											novalidate="novalidate">
											<div class="form-group ">
												<label for="productname" class="control-label col-lg-2">First
													Name *</label>
												<div class="col-lg-10">
													<input class=" form-control" id="firstName"
														name="firstName" type="text">
												</div>
											</div>
											<div class="form-group ">
												<label for="productname" class="control-label col-lg-2">Last
													Name *</label>
												<div class="col-lg-10">
													<input class=" form-control" id="lastName" name="lastName"
														type="text">
												</div>
											</div>
											<div class="form-group ">
												<label for="productname" class="control-label col-lg-2">Username
													*</label>
												<div class="col-lg-10">
													<input class=" form-control" id="username" name="username"
														type="text">
												</div>
											</div>
											<div class="form-group ">
												<label for="productname" class="control-label col-lg-2">Password
													*</label>
												<div class="col-lg-10">
													<input class=" form-control" id="password" name="password"
														type="password">
												</div>
											</div>
											<div class="form-group ">
												<label for="productname" class="control-label col-lg-2">Confirm
													Password *</label>
												<div class="col-lg-10">
													<input class=" form-control" id="confirmation_password"
														name="confirmation_password" type="password">
												</div>
											</div>
											<div class="form-group ">
												<label for="costprice" class="control-label col-lg-2">Email
													*</label>
												<div class="col-lg-10">
													<input class="form-control " id="email" name="email"
														type="email">
												</div>
											</div>
											<div class="form-group ">
												<label for="category" class="control-label col-lg-2">Gender
													*</label>
												<div class="col-lg-10">
													<select class="form-control" id="gender" name="gender">
														<option value="Male">Male</option>
														<option value="Female">Female</option>
													</select>
												</div>
											</div>
											<div class="form-group ">
												<label for="category" class="control-label col-lg-2">User
													Type *</label>
												<div class="col-lg-10">
													<select class="form-control" id="USER_ROLE"
														name="userRoles[0].id"> 
														<option value="0">-- SELECT USER ROLE --</option>
														<c:forEach items="${roles}" var="role">
															<option value="${role.id }">${role.type}</option>
														</c:forEach>
													</select>
												</div>
											</div>
											<div class="form-group">
												<div class="col-lg-offset-2 col-lg-10">
													<button class="btn btn-success waves-effect waves-light"  
														type="submit">Save</button>
													<button class="btn btn-default waves-effect" data-dismiss="modal" type="button">Cancel</button>
												</div>
											</div>
										</form>
									</div>
									<!-- .form --> 
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
			</div>
		</div>
	</div>
</div>








									