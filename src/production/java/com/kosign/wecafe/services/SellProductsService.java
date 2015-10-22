package com.kosign.wecafe.services;

import java.util.List;

import javax.servlet.http.HttpSession;

import com.kosign.wecafe.entities.Order;
import com.kosign.wecafe.entities.OrderDetail;
import com.kosign.wecafe.entities.Product;
import com.kosign.wecafe.forms.Cart;

public interface SellProductsService {

	public List<Product> getAllProducts();
	public List<Order> getOrdered();
	public List<OrderDetail> getOrderedDetail(Long orderID);
	public Boolean addNewSaleProducts(List<Cart> carts);
}
