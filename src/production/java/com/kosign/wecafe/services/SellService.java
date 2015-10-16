package com.kosign.wecafe.services;

import java.util.List;

import com.kosign.wecafe.entities.Order;
import com.kosign.wecafe.entities.Product;
import com.kosign.wecafe.entities.Sale;

public interface SellService {

	public List<Sale> getSellAllList();
	public List<Product> getDetailSellProduct(long id);
	public List<Order> getAllOrders();
}
