package com.kosign.wecafe.services.report;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.hibernate.HibernateException;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;
import org.hibernate.transform.AliasToEntityMapResultTransformer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kosign.wecafe.entities.Pagination;
import com.kosign.wecafe.entities.RequestStock;
import com.kosign.wecafe.forms.DateForm;

@Service
public class AdminReportRequestServiceImp implements AdminReportRequestService  {
	@Autowired
	private SessionFactory sessionFactory;

	@Override
	@Transactional
	public List<Map> getListReportDetailRequest(Pagination pagination,DateForm date) {
		Session session = null;
		String sql="SELECT "
						+"DISTINCT "
						+"rs.req_id, "
						+ "app_date, "
						+"to_char(rs.req_date, 'DD/MM/YYYY HH24:MI:SS') req_date, "
						+"(SELECT firstname ||' '|| lastname As request_by FROM users WHERE id=rs.use_id ), "
						+"SUM(rsd.pro_qty) as total_request_qty "
				   +"FROM "       
						+"request_stock rs,  "
						+"request_stock_detail  rsd, "
						+"users use, "
						+"product pro "      
				   +"WHERE 1=1 " 
						+"and rs.req_id=rsd.req_id "      
						+"and rs.use_id=use.id "     
						+"and rsd.pro_id=pro.pro_id "  
						+"and rs.status='f' "
						+ " "+checkDate(date)+" "				
						+"GROUP BY "
						+"rs.req_id "
				   + "ORDER BY app_date DESC "	;					
						
		try{
			session = sessionFactory.getCurrentSession();		
			SQLQuery query = session.createSQLQuery(sql);
		//	query.setParameter(0, byYear);
			query.setFirstResult(pagination.offset());
			query.setMaxResults(pagination.getPerPage());
			query.setResultTransformer(AliasToEntityMapResultTransformer.INSTANCE);
			List<Map>	requestReport = (List<Map>)query.list();	
			return requestReport;
		}catch(Exception e){
			e.printStackTrace();
		}	
		return null;
	}
	
	public String checkDate(DateForm date){
		String result="";
		String startDate=date.getStartdate();
		String endDate=date.getEnddate();
		String year=date.getYear();
		if(date!=null){
			if(date.getYear() !="" || date.getYear() !=null){
				result=" And EXTRACT(YEAR FROM rs.app_date)="+year;
				System.out.println("year========================="+year);
			}
			else if(date.getStartdate() !="" || date.getStartdate()!=null){
				result=" And to_char(req_date,''YYYY-mm-dd'')="+startDate;
				System.out.println("startdate========================="+startDate);
			}else if(startDate!="" && endDate!=""){
				result=" And to_char(req_date,''YYYY-mm-dd'') BETWEEN "+ startDate + " END " + endDate;
				System.out.println("year========================="+year);
			}
		}
		return result;
	}

	@Override
	public List<Map> getListReportDailyRequest(Pagination pagination, Date startdate) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Object getListReportWeeklyRequest(Date startdate, Date enddate) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Object getListReportMonthlyRequest(Date startDate, Date endDate) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Object getListReportYearlyRequest(Date startDate, Date endDate) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Map<String, Object> getAllRequestMonthlyReportsTotal(Date startDate, Date endDate) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Map> listAllrequestDetail(Long id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	@Transactional
	public Long countDetail(DateForm date) throws ParseException {
		String year=date.getYear();
		String startDate = year +"-01-01";
		String endDate = year + "-12-31";
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
		Date startdate = simpleDateFormat.parse(startDate);
		Date enddate = simpleDateFormat.parse(endDate);
		Session session = null;
		try{ 
			session = sessionFactory.getCurrentSession();
			return  (Long) session.createCriteria(RequestStock.class)
					.add(Restrictions.eq("status",false))
					.add(Restrictions.and(Restrictions.between("appDate", startdate ,enddate )))					
					.setProjection(Projections.rowCount()).uniqueResult(); 
		}catch(Exception ex){
			ex.printStackTrace();
		}
		return 0L;
	}

	@Override
	public Long countDaily(Date dateTime) throws HibernateException, ParseException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Long count() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Long getAllTotalAmount(Date startdate, Date enddate) {
		// TODO Auto-generated method stub
		return null;
	} 
	
}