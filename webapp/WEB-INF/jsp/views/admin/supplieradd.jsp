<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- Modal -->
<div class="modal fade" id="form_add_supplier" role="dialog ">
	<div class="modal-dialog modal-lg" style="width: 80%">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
				<h4 class="modal-title">Form Add Supplier</h4>
			</div>
			<div class="modal-body">
				<div class=" form">
										<form class="cmxform form-horizontal tasi-form" id="frmAddNewSupplier" method="POST"
											<%-- action="${pageContext.request.contextPath}/admin/addSupplier" --%> novalidate="novalidate"> 
											<div class="form-group ">
												<label for="productname" class="control-label col-lg-2">Supplier
													Name *</label>
												<div class="col-lg-10">
													<input class=" form-control" id="supplierName"
														name="supplierName" type="text">
												</div>
											</div>
											<div class="form-group ">
												<label for="quantity" class="control-label col-lg-2">Phone
													Number *</label>
												<div class="col-lg-10">
													<input class="form-control " id="phoneNumber"
														name="phoneNumber" type="text">
												</div>
											</div>
											<div class="form-group ">
												<label for="price" class="control-label col-lg-2">Address
													*</label>
												<div class="col-lg-10">
													<input class="form-control " id="address" name="address"
														type="text">
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



											<div class="form-group">
												<div class="col-lg-offset-2 col-lg-10">
													<button class="btn btn-success waves-effect waves-light"
														id="save" type="button">Save</button>
													<button class="btn btn-default waves-effect" type="button">Cancel</button>
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








									