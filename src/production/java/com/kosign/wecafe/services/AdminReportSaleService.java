package com.kosign.wecafe.services;

import java.util.List;
import java.util.Map;

public interface AdminReportSaleService {
	public List<Map> getListReportDetailSaleRest(int byYear);
	
	
	
	public Long count();
}
