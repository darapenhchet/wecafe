package com.kosign.wecafe.services.report;

import java.text.ParseException;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.hibernate.HibernateException;
import org.springframework.transaction.annotation.Transactional;

import com.kosign.wecafe.entities.Pagination;
import com.kosign.wecafe.forms.DateForm;

public interface AdminReportRequestService {
	
	public List<Map> getTotalProQty(DateForm date);
	public List<Map> getListReportDetailRequest(Pagination pagination,DateForm date);
	public List<Map> getListReportDailyRequest(Pagination pagination, DateForm date);
	public Object getListReportWeeklyRequest(DateForm date);
	public Object getListReportMonthlyRequest(Date startDate, Date endDate);
	public Object getListReportYearlyRequest(Date startDate, Date endDate);	
	public Long getTotalDailyRequest(DateForm date);
	public Map<String, Object> getAllRequestMonthlyReportsTotal(Date startDate, Date endDate);	
	public List<Map> listAllrequestDetail(Long id);
	public Long countDetail(DateForm date) throws ParseException;
	public Long countDaily(Date dateTime) throws HibernateException, ParseException;
	//public Long countWeekly(Date startDate, Date endDate);
	public Long count();
	public Long getAllTotalAmount(Date startdate, Date enddate);
}
