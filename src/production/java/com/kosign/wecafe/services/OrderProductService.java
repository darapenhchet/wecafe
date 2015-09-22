package com.kosign.wecafe.services;

import java.util.List;

import com.kosign.wecafe.entities.Product;

public interface OrderProductService {
	public boolean addNewOrder();
	public List<Product> getProduct();
}
