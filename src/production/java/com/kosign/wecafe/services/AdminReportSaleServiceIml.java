package com.kosign.wecafe.services;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Projections;
import org.hibernate.transform.AliasToEntityMapResultTransformer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kosign.wecafe.entities.ImportProduct;
import com.kosign.wecafe.entities.Sale;
import com.kosign.wecafe.util.HibernateUtil;

@Service
public class AdminReportSaleServiceIml implements AdminReportSaleService {
	@Autowired
	private SessionFactory sessionFactory; 
	
	@Override
	@Transactional
	public List<Map> getListReportDetailSaleRest(int byyear) {
		Session session = null;
		try{
			session = sessionFactory.getCurrentSession();
			session.getTransaction().begin();
			SQLQuery query = session.createSQLQuery(
					"SELECT A.sale_id "
				 + "   , B.username "
				 + "	   , to_char(A.sale_datetime, 'YYYY-mm-dd') as sale_date "
				 + "	   , A.total_amount from sale A "
				 + "	    INNER JOIN users B on A.user_id = B.id "
				 + "	where EXTRACT(YEAR FROM A.sale_datetime) = " + byyear);
			query.setResultTransformer(AliasToEntityMapResultTransformer.INSTANCE);
			List<Map>	saleProducts = (List<Map>)query.list();	
			return saleProducts;
		}catch(Exception e){
			e.printStackTrace();
		}finally {
			
		}		
		return null;
	}

	@Override
	@Transactional
	public Long count(){
		Session session = null;
		try{ 
			session = sessionFactory.getCurrentSession();
			return  (Long) session.createCriteria(Sale.class).setProjection(Projections.rowCount()).uniqueResult(); 
		}catch(Exception ex){
			ex.printStackTrace();
		}
		return 0L;
	}

	@Override
	@Transactional
	public List<Map> getListReportDailySaleRest(Date startdate) {
		String startDate = new SimpleDateFormat("YYYY-MM-DD").format(startdate);
		System.out.println(startdate);
		Session session = null;
		try{
			session = sessionFactory.getCurrentSession();
			session.getTransaction().begin();
			SQLQuery query = session.createSQLQuery("SELECT B.pro_name, " 
							+ " to_char(C.sale_datetime,'YYYY-mm-dd')  as saleDate, "
							+ " SUM(A.pro_qty) as product_qty, "
							+ " A.pro_unit_price, "
							+ " sum(A.pro_qty*A.pro_unit_price) as total_amount, "
							+ " D.status "
							+ " from sale C INNER JOIN wecafe_order D on C.ord_id = D.order_id "
							+ " 		LEFT JOIN order_detail A ON C.ord_id = A.order_id "
							+ " 		LEFT JOIN product B on B.pro_id = A.pro_id "
							+ " WHERE D.status = 2 and to_char(C.sale_datetime,'YYYY-mm-dd') = '" + startDate
							+ "' GROUP BY 1,2,4,6");
			query.setResultTransformer(AliasToEntityMapResultTransformer.INSTANCE);
			List<Map>	saleProducts = (List<Map>)query.list();	
			return saleProducts;
		}catch(Exception e){
			e.printStackTrace();
		}finally {
			
		}
		
		return null;
	}

	@Override
	@Transactional
	public Object getListReportWeeklySaleRest(Date startdate, Date enddate) {	
	Session session = null;
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

	Calendar calStartDate = Calendar.getInstance();
	calStartDate.setTime(startdate);
	
	Calendar calEndDate = Calendar.getInstance();
	calEndDate.setTime(enddate);
	
	Calendar calendar = calStartDate;
	String[] months = new String[]{"day1","day2", "day3", "day4", "day5", "day6", "day7"};
	StringBuilder sb = new StringBuilder();
	StringBuilder sbSelect = new StringBuilder();
	
	
	for(int i=0 ; i<7 ; i++){
		sbSelect.append("COALESCE("+months[i]+"[1],0) AS "+months[i].toUpperCase()+"_QTY ,");
		sbSelect.append("COALESCE("+months[i]+"[2],0) AS "+months[i].toUpperCase()+"_AMOUNT ,");
		sb.append(months[i] + " NUMERIC[],"); 
		
	}	
	try {
		session = sessionFactory.getCurrentSession();
		SQLQuery query = 
				session.createSQLQuery("SELECT"
        + " mthreport.row_name AS pro_name, "
        + " COALESCE(day1[1], 0) AS day1_QTY, "
        + " COALESCE(day1[2], 0) AS day1_AMOUNT, "
        + " COALESCE(day2[1], 0) AS day2_QTY, "
        + " COALESCE(day2[2], 0) AS day2_AMOUNT, "
        + " COALESCE(day3[1], 0) AS day3_QTY, "
        + " COALESCE(day3[2], 0) AS day3_AMOUNT, "
        + " COALESCE(day4[1], 0) AS day4_QTY, "
        + " COALESCE(day4[2], 0) AS day4_AMOUNT, "
        + " COALESCE(day5[1], 0) AS day5_QTY, "
        + " COALESCE(day5[2], 0) AS day5_AMOUNT, "
        + " COALESCE(day6[1], 0) AS day6_QTY, "
        + " COALESCE(day6[2], 0) AS day6_AMOUNT, "
        + " COALESCE(day7[1], 0) AS day7_QTY, "
        + " COALESCE(day7[2], 0) AS day7_AMOUNT " 
    + " FROM crosstab (  'SELECT B.pro_name::text As row_name " 		   
    + " ,to_char(C.sale_datetime, ''DD'')::text As sale_date 	 "	   
    + " ,ARRAY[SUM(A.pro_qty) "
    + " ,sum(A.pro_qty*A.pro_unit_price)] AS row " 	 
    + " from sale C INNER JOIN wecafe_order D on C.ord_id = D.order_id "
		+ "LEFT JOIN order_detail A ON C.ord_id = A.order_id "
		+ "LEFT JOIN product B on B.pro_id = A.pro_id "
		+ "LEFT JOIN users E on E.id = C.user_id "
+ "WHERE D.status = 2 and to_char(C.sale_datetime,''YYYY-mm-dd'') BETWEEN ''"+sdf.format(startdate)+"'' And ''"+sdf.format(enddate)+"''" 	 
+ "GROUP BY 1,2   "
+ "ORDER BY 2', "
+ "        'SELECT to_char(date ''2016-01-01'' + (n || '' day'')::interval, ''DD'') As short_mname  FROM generate_series(0,6) n;' ) AS mthreport " 
+ "( row_name TEXT , " + sb.toString().substring(0, sb.toString().lastIndexOf(",")) + ")"									   
									   ); 	
		query.setResultTransformer(AliasToEntityMapResultTransformer.INSTANCE);
		List<Map<String, Object>> sales= (List<Map<String, Object>>)query.list();
		return sales;
	} catch (Exception e) {
		e.printStackTrace();
		System.out.println(e.getMessage());
	}
	return null;
	}

	@Override
	@Transactional
	public Object getListReportMonthlySaleRest(Date startdate, Date enddate) {

		Session session = null;
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

		Calendar calStartDate = Calendar.getInstance();
		calStartDate.setTime(startdate);
		
		Calendar calEndDate = Calendar.getInstance();
		calEndDate.setTime(enddate);
		System.out.println("Enddate = " + calEndDate.get(Calendar.DAY_OF_MONTH));
		System.out.println("start Date = " + calStartDate.get(Calendar.DAY_OF_MONTH));
		
		String[] months = new String[calEndDate.get(Calendar.DAY_OF_MONTH)];
		for(int i=0;i<calEndDate.get(Calendar.DAY_OF_MONTH);i++)
		{
			months[i] = "day" + (i+1);
		}
		StringBuilder sb = new StringBuilder();
		StringBuilder sbSelect = new StringBuilder();
		
		
		for(int i=0 ; i<calEndDate.get(Calendar.DAY_OF_MONTH) ; i++){  
			sbSelect.append("COALESCE("+months[i]+"[1],0) AS "+months[i].toUpperCase()+"_QTY ,");
			sbSelect.append("COALESCE("+months[i]+"[2],0) AS "+months[i].toUpperCase()+"_AMOUNT ,");
			sb.append(months[i] + " NUMERIC[],"); 
			
		}
		System.out.println(sb.toString().substring(0, sb.toString().lastIndexOf(",")));
		
		System.out.println(calStartDate.getTime());
		System.out.println(calEndDate.getTime());
		  
		try {
			session = sessionFactory.getCurrentSession();
			SQLQuery query = 
					session.createSQLQuery("SELECT mthreport.row_name  AS pro_name, " 
							+ sbSelect.toString().substring(0, sbSelect.toString().lastIndexOf(",")) 
							+ " FROM crosstab ( " 
							+ " 'SELECT B.pro_name::text As row_name " 		   
							+ " ,to_char(C.sale_datetime, ''DD'')::text As sale_date 	 "	   
							+ " ,ARRAY[SUM(A.pro_qty) "
							+ " ,sum(A.pro_qty*A.pro_unit_price)] AS row " 	 
						    + " from sale C INNER JOIN wecafe_order D on C.ord_id = D.order_id "
							+ "LEFT JOIN order_detail A ON C.ord_id = A.order_id "
							+ "LEFT JOIN product B on B.pro_id = A.pro_id "
							+ "LEFT JOIN users E on E.id = C.user_id "
							+ "WHERE D.status = 2 and to_char(C.sale_datetime,''YYYY-mm-dd'') BETWEEN ''"+sdf.format(startdate)+"'' And ''"+sdf.format(enddate)+"''" 	 
							+ "GROUP BY 1,2   "
							+ "ORDER BY 2', " +
						   "'SELECT to_char(date ''"+sdf.format(startdate)+"'' + (n || '' day'')::interval, ''DD'') As short_mname " +									   
						   " FROM generate_series(0,"+ (calEndDate.get(Calendar.DAY_OF_MONTH) -1) +") n;' " +
						   ") AS mthreport ( " +
						   "row_name TEXT, " + sb.toString().substring(0, sb.toString().lastIndexOf(",")) + ")" 
			   ); 	 
			query.setResultTransformer(AliasToEntityMapResultTransformer.INSTANCE);
			List<Map<String, Object>> sales = (List<Map<String, Object>>)query.list();
			return sales;
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println(e.getMessage());
		}
		return null;
	}

	@Override
	@Transactional
	public Object getListReportYearlySale(Date startDate, Date endDate) {

		// TODO Auto-generated method stub
		Session session = null;
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		
		System.out.println(sdf.format(startDate));
		System.out.println(sdf.format(endDate));
		Calendar calStartDate = Calendar.getInstance();
		calStartDate.setTime(startDate);
		
		Calendar calEndDate = Calendar.getInstance();
		calEndDate.setTime(endDate);
		
		Calendar calendar = calStartDate;
		String[] months = new String[]{"jan","feb", "mar", "apr", "may", "jun", "jul", "aug", "sep", "oct", "nov", "dec"};
		StringBuilder sb = new StringBuilder();
		StringBuilder sbSelect = new StringBuilder();
		for(int i=calStartDate.get(Calendar.MONTH) ; i<=calEndDate.get(Calendar.MONTH) ; i++){
			calendar.add(Calendar.MONTH, i);
			System.out.println(months[i]);
			sbSelect.append("COALESCE("+months[i]+"[1],0) AS "+months[i].toUpperCase()+"_QTY ,");
			sbSelect.append("COALESCE("+months[i]+"[2],0) AS "+months[i].toUpperCase()+"_AMOUNT ,");
			sb.append(months[i] + " NUMERIC[],");
			
		}
		System.out.println(sb.toString().substring(0, sb.toString().lastIndexOf(",")));
		
		System.out.println(calStartDate.getTime());
		System.out.println(calEndDate.getTime());
		try {
			session = sessionFactory.getCurrentSession();
			SQLQuery query = 
					session.createSQLQuery("SELECT " +										   
										   "mthreport.row_name AS pro_name, " + 
										   "COALESCE(jan[1],0) AS JAN_QTY, " +
										   "COALESCE(jan[2],0) AS JAN_AMOUNT, " +
										   "COALESCE(feb[1],0) AS FEB_QTY, " +
										   "COALESCE(feb[2],0) AS FEB_AMOUNT, " +
										   "COALESCE(mar[1],0) AS MAR_QTY, " +
										   "COALESCE(mar[2],0) AS MAR_AMOUNT, " +
										   "COALESCE(apr[1],0) AS APR_QTY, " +
										   "COALESCE(apr[2],0) AS APR_AMOUNT, " +
										   "COALESCE(may[1],0) AS MAY_QTY," +
										   "COALESCE(may[2],0) AS MAY_AMOUNT," +
										   "COALESCE(jun[1],0) AS JUN_QTY," +
										   "COALESCE(jun[2],0) AS JUN_AMOUNT," +
										   "COALESCE(jul[1],0) AS JUL_QTY," +
										   "COALESCE(jul[2],0) AS JUL_AMOUNT," +
										   "COALESCE(aug[1],0) AS AUG_QTY," +
										   "COALESCE(aug[2],0) AS AUG_AMOUNT, " +
										   "COALESCE(sep[1],0) AS SEP_QTY, " +
										   "COALESCE(sep[2],0) AS SEP_AMOUNT, " +
										   "COALESCE(oct[1],0) AS OCT_QTY, " +
										   "COALESCE(oct[2],0) AS OCT_AMOUNT, " +
										   "COALESCE(nov[1],0) AS NOV_QTY, " +
										   "COALESCE(nov[2],0) AS NOV_AMOUNT, " +
										   "COALESCE(DEC[1],0) AS DEC_QTY, " +
										   "COALESCE(DEC[2],0) AS DEC_AMOUNT " +  
										   "FROM " +
										   "	crosstab ( " 
										   	+ " 'SELECT B.pro_name::text As row_name " 		   
											+ " ,to_char(C.sale_datetime, ''mon'')::text As sale_date 	 "	   
											+ " ,ARRAY[SUM(A.pro_qty) "
											+ " ,sum(A.pro_qty*A.pro_unit_price)] AS row " 	 
										    + " from sale C INNER JOIN wecafe_order D on C.ord_id = D.order_id "
											+ "LEFT JOIN order_detail A ON C.ord_id = A.order_id "
											+ "LEFT JOIN product B on B.pro_id = A.pro_id "
											+ "LEFT JOIN users E on E.id = C.user_id "
											+ "WHERE D.status = 2 and to_char(C.sale_datetime,''YYYY-mm-dd'') BETWEEN ''"+sdf.format(startDate)+"'' And ''"+sdf.format(endDate)+"''" 	 
											+ "GROUP BY 1,2   "
											+ "ORDER BY 2', " +
										   "'SELECT to_char(date ''"+sdf.format(startDate)+"'' + (n || '' month'')::interval, ''mon'') As short_mname " +										   
										   " FROM generate_series(0,11) n' " +
										   ") AS mthreport ( " +
										   "row_name TEXT , " + sb.toString().substring(0, sb.toString().lastIndexOf(",")) + ")" 
										   ); 	
			query.setResultTransformer(AliasToEntityMapResultTransformer.INSTANCE);
			List<Map<String, Object>> sales= (List<Map<String, Object>>)query.list();
			return sales;
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println(e.getMessage());
		}
		return null;
	}

	@Override
	@Transactional
	public Map<String, Object> getAllSaleMonthlyReportsTotal(Date startDate, Date endDate) {
		// TODO Auto-generated method stub
		return null;
	}

}
