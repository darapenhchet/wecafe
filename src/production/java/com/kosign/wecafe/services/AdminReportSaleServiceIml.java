package com.kosign.wecafe.services;

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
				 + "	   , INNER JOIN users B on A.user_id = B.id "
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

}
