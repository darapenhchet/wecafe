package com.kosign.wecafe.services;

import java.util.Date;
import java.util.List;
import java.util.Map;

import com.kosign.wecafe.entities.ImportProduct;
import com.kosign.wecafe.forms.DateForm;

public interface AdminReportService {
	
	public List<Map> getReportListAllSellProduct();
	
	public List<Map> getReportListAllOrderProduct();
	
	public List<Map> getListReportDetailPurchaseRest(int byYear);
	
	public List<Map> getListReportDetailPurchase();
	
	public List<Map> getSearchSellbyDate(DateForm dateForm);

	public List<Map> getSearchOrderbyDate(DateForm dateForm);
	
	public List<Object[]> getReportListAllBeverageStock(DateForm dateForm);
	
	public List<Object[]> getReportListAllCupStockbyDate(DateForm dateForm);

	public Long count();

	public Object getListReportMonthlyPurcase(Date startDate, Date endDate);
	public Map<String, Object> getAllPurchaseMonthlyReportsTotal(Date startDate, Date endDate);
	
}
