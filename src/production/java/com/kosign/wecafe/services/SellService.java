package com.kosign.wecafe.services;

import java.util.List;
import java.util.Map;

import com.kosign.wecafe.entities.Order;
import com.kosign.wecafe.entities.Sale;

public interface SellService {

	public List<Sale> getSellAllList();
	public List<Map<String, Object>> getDetailSellProduct(long id);
	public List<Order> getAllOrders();
}
