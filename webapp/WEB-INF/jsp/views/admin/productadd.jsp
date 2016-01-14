<%@page import="com.kosign.wecafe.entities.Unit"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<%@page import="java.util.ArrayList"%>
<%@page import="com.kosign.wecafe.entities.Category"%>
<%@page import="java.util.List"%>


<!-- Modal -->
<div class="modal fade" id="form_add_product" role="dialog ">
	<div class="modal-dialog modal-lg" style="width: 80%">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
				<h4 class="modal-title">Form Add Products</h4>
			</div>
			<div class="modal-body">

				<div class=" form">
					<form class="cmxform form-horizontal tasi-form" id="frmProductAdd"
						enctype="multipart/form-data" method="POST"
						action="/admin/product/add">
						<div class="form-group ">
							<label for="productname" class="control-label col-lg-2">Product
								Name *</label>
							<div class="col-lg-10">
								<input class=" form-control" id="productName" name="productName"
									type="text" required="required">
							</div>
						</div>
						<div class="form-group ">
							<label for="unit" class="control-label col-lg-2">Unit *</label>
							<div class="col-lg-10">
								<select class="form-control" id="optUnit" name="unitId"
									required="required">
									<option value="">Please choose your Unit</option>
									<%
										List<Unit> units = (ArrayList<Unit>) request.getAttribute("units");
										for (Unit unit : units) {
											out.println("<option value=" + unit.getUnitId() + ">" + unit.getUnitName() + " (" + unit.getQty() + " "
													+ unit.getTo() + ")" + "</option>");
										}
									%>
								</select>
							</div>
						</div>
						<div class="form-group ">
							<label for="category" class="control-label col-lg-2">Category
								*</label>
							<div class="col-lg-10">
								<select class="form-control" id="optCategory" name="categoryId"
									required="required">
									<option value="">Please choose your category</option>
									<%
										List<Category> categories = (ArrayList<Category>) request.getAttribute("categories");
										for (Category category : categories) {
											out.println("<option value=" + category.getCatId() + ">" + category.getCatName() + "</option>");
										}
									%>

								</select>
							</div>
						</div>

						<div class="form-group ">
							<label for="costprice" class="control-label col-lg-2">Image
								*</label>
							<div class="col-lg-10">
								<input class="form-control " id="images" name="images"
									type="file"> <input type="hidden" id="image"
									name="image" /> <img src="" id="images_sample"
									name="images_sample" class="img-thumbnail"
									style="display: none;">
							</div>
						</div>
						<div class="form-group">
							<div class="col-lg-offset-2 col-lg-10">
								<button class="btn btn-primary waves-effect waves-light"
									type="submit">Save</button>
								<a href="#none"class="btn btn-default waves-effect" type="button" id="btn_cancel">Cancel</a>
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




