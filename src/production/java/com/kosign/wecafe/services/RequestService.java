package com.kosign.wecafe.services;

import java.util.List;
import java.util.Map;

import com.kosign.wecafe.entities.ImportDetail;
import com.kosign.wecafe.entities.ImportProduct;
import com.kosign.wecafe.entities.Product;
import com.kosign.wecafe.entities.Supplier;
import com.kosign.wecafe.forms.ImportForm;
import com.kosign.wecafe.forms.RequestForm;

public interface RequestService {

	public List<ImportProduct> listAllImportProduct();
	public Boolean saveRequestPro(List<RequestForm> requestForm);
	public List<Product> listAllProduct();
	public List<Supplier> listAllSupplier();
	public Boolean updateRequestPro(List<RequestForm> requestForm, Long id);	 
	public List<Map> listAllRequestDetail(Long id);
	Boolean deleteRequestPro(List<RequestForm> requestForm, Long id);
	
}