package com.kosign.wecafe.services;

import java.util.List;

import com.kosign.wecafe.entities.Product;

public interface ProductService {
	public List<Product> getAllProducts();
	public Product findProductById(Long id);
	public boolean addNewProduct(Product product);
	public boolean updateProduct(Product product);
	public boolean deleteProduct(Long id);
}
