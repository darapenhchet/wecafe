package com.kosign.wecafe.services;

import java.util.List;

import com.kosign.wecafe.entities.ImportDetail;
import com.kosign.wecafe.entities.Product;
import com.kosign.wecafe.entities.Supplier;
import com.kosign.wecafe.entities.User;

public interface ImportService {

	
	public Boolean saveImportPro(ImportDetail importDetail);
	public List<Product> listAllProduct();
	public List<Supplier> listAllSupplier();
}
