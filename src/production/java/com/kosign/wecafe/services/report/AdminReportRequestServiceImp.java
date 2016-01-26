package com.kosign.wecafe.services.report;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.hibernate.Criteria;
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
						+"and  EXTRACT(YEAR FROM rs.app_date)=? "				
						+"GROUP BY "
						+"rs.req_id "
				   + "ORDER BY app_date DESC "	;					
						
		try{
			session = sessionFactory.getCurrentSession();		
			SQLQuery query = session.createSQLQuery(sql);
			query.setParameter(0, Integer.parseInt(date.getYear()));
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
	
	

	@Override
	@Transactional
	public List<Map> getListReportDailyRequest(Pagination pagination, DateForm date) {
		Session session = null;	
						
		try{
			session = sessionFactory.getCurrentSession();		
			SQLQuery query = session.createSQLQuery(getQueryDailyRequest(date));
			query.setParameter(0, date.getDay());
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
	
	
	@Override
	@Transactional
	public List<Map> getTotalProQty(DateForm date) {
		Session session = null;	
						
		try{
			String sql="SELECT "
								+"rsd.pro_id,"
							    +"sum(pro_qty) total_pro_qty,"
							    +"count(rsd.pro_id) total_row "
						    +"FROM "
						        +"request_stock rs, "
						        +"request_stock_detail  rsd,"
						        +"users use,"
						        +"product pro " 
						    +"WHERE "
						        +"1=1 " 
						        +"and rs.req_id=rsd.req_id " 
						        +"and rs.use_id=use.id "
						        +"and rsd.pro_id=pro.pro_id " 
						        +"and rs.status='f' "
						        +"and to_char(rs.app_date,'yyyy-mm-dd')=? "  
								+"GROUP BY "
								+"rsd.pro_id,"
								+"pro_name  "
							+"ORDER BY "
								+"pro_name ASC"	;
			session = sessionFactory.getCurrentSession();		
			SQLQuery query = session.createSQLQuery(sql);
			query.setParameter(0, date.getDay());
			query.setResultTransformer(AliasToEntityMapResultTransformer.INSTANCE);
			List<Map>	requestReport = (List<Map>)query.list();	
			return requestReport;
		}catch(Exception e){
			e.printStackTrace();
		}	
		return null;
	}
	
	
	@Override
	@Transactional
	public Long getTotalDailyRequest(DateForm date) {
		// TODO Auto-generated method stub
		Session session = null;
		Long cnt = 0L;
		try {

			try {
				session=sessionFactory.getCurrentSession();
				String sql = "SELECT count(*) cnt FROM(" + getQueryDailyRequest(date) + ") cnt ";
				SQLQuery query = session.createSQLQuery(sql);
				query.setResultTransformer(Criteria.ALIAS_TO_ENTITY_MAP);
				query.setParameter(0,date.getDay() );
				HashMap<String, Object> result = (HashMap<String, Object>) query.uniqueResult();
				cnt = Long.parseLong(result.get("cnt").toString());
			} catch (HibernateException e) {
				System.out.println(" error total remord");				
				e.printStackTrace();
			}
			return cnt;
		} catch (HibernateException e) {
			throw new RuntimeException("Could not begin transaction");
		}
	}
	
	public String getQueryDailyRequest(DateForm date){
		String sql="";
		 sql="SELECT " 
				+"pro.pro_name req_pro, "
				+"rsd.pro_qty req_qty,"
				+"(SELECT firstname ||' '|| lastname As approve_by FROM users WHERE id=rs.app_id ),"
				+"(SELECT firstname ||' '|| lastname As request_by FROM users WHERE id=rs.use_id ),"
				+"to_char(rs.req_date, 'DD/MM/YYYY HH24:MI:SS') req_date,"
		        +"to_char(rs.app_date, 'DD/MM/YYYY HH24:MI:SS') app_date ,"
		        + "(SELECT SUM(rsd1.pro_qty) total_req_qty from request_stock_detail rsd1, request_stock rs1 WHERE rs1.req_id=rsd1.req_id and rs1.status='f' and to_char(rs1.app_date,'yyyy-mm-dd')='"+date.getDay()+"') "
		  +"FROM "
			    +"request_stock rs,"
			    +"request_stock_detail  rsd,"
			    +"users use,"
			    +"product pro  "
		  +"WHERE "
			    +"1=1  "
			    +"and rs.req_id=rsd.req_id  "
			    +"and rs.use_id=use.id  "
			    +"and rsd.pro_id=pro.pro_id  "
			    +"and rs.status='f' " 
			    +"and to_char(rs.app_date,'yyyy-mm-dd')=? "  
	      +"GROUP BY "
		        +"pro_name, "
				+"rsd.pro_qty, "
				+"rs.app_id,"
				+"rs.use_id,"
				+"rs.req_date,"
				+"rs.app_date "
		   +"ORDER BY "
		        +"pro_name ASC";	
		 return sql;
	}
	
	

	@Override
	@Transactional
	public List<Map> getListReportWeeklyRequest(DateForm date) {
		Session session = null;
		
		/*SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		System.out.println("beforFomat = " + startdate);
		Calendar calStartDate = Calendar.getInstance();
		calStartDate.setTime(startdate);
		
		Calendar calEndDate = Calendar.getInstance();
		calEndDate.setTime(enddate);
		
		Calendar calendar = calStartDate;
		
		System.out.println("afterFomat = " + sdf.format(startdate));*/
		
		String[] days = new String[]{"day1","day2", "day3", "day4", "day5", "day6", "day7"};
		StringBuilder sb = new StringBuilder();
		StringBuilder sbSelect = new StringBuilder();
		
		
		for(int i=0 ; i<7 ; i++){
			sbSelect.append("COALESCE("+days[i]+") AS "+days[i].toUpperCase()+"_QTY ,");
			sb.append(days[i] + " NUMERIC,"); 
			
		}	
		
		String startDate=date.getStartdate();
	
		try {
			session = sessionFactory.getCurrentSession();
			SQLQuery query = 
					session.createSQLQuery("SELECT "
									+"ct.product_name,	"							 
									+"COALESCE(day1) AS day1_QTY, " 
									 +"COALESCE(day2) AS day2_QTY, "
									 +"COALESCE(day3) AS day3_QTY, " 
									 +"COALESCE(day4) AS day4_QTY, " 
									 +"COALESCE(day5) AS day5_QTY, " 
									 +"COALESCE(day6) AS day6_QTY, "
									 +"COALESCE(day7) AS day7_QTY "
								+ "FROM crosstab( "
								+"'SELECT " 
									+"pro.pro_name::text , "
									+"to_char(rs.app_date,''DD'')::TEXT app_date ," 
									+"SUM(rsd.pro_qty) "
								+"FROM request_stock rs," 
									+"request_stock_detail rsd,product pro " 
								+"WHERE " 
									+"rs.req_id=rsd.req_id " 
									+"and rsd.pro_id=pro.pro_id " 
									+"and rs.status=''f'' "
									+"and to_char(rs.app_date,''YYYY-mm-dd'') " 
									+"BETWEEN ''"+startDate+"'' And ''"+date.getEnddate()+"'' "
									+"GROUP BY 1,2 ORDER BY 1 ', "
								+"'SELECT to_char(date ''"+startDate+"'' + (n || '' day'')::interval, ''DD'') As short_mname "  
								+"FROM "
									+"generate_series(0,6) n;' "
									+") as ct(product_name text ," + sb.toString().substring(0, sb.toString().lastIndexOf(",")) + ") "); 		
			query.setResultTransformer(AliasToEntityMapResultTransformer.INSTANCE);
			List<Map> sales= (List<Map>)query.list();
			return sales;
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println(e.getMessage());
		}
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