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
					"SELECT A.imp_id AS purchase_id "
				 + "   , A.imp_date AS purchase_date "
				 + "	   , CONCAT(C.lastname, ' ', C.firstname) AS purchase_by "
				 + "	   , SUM(pro_qty * unit_price) AS purchase_total_amount "
				 + "	   , '0' AS purchase_type "
				 + "	FROM import A "
				 + "	INNER JOIN import_detail B ON A.imp_id = B.imp_id "
				 + "	LEFT JOIN users C ON C.id = A.user_id "
				 + "	WHERE EXTRACT(YEAR FROM A.imp_date) = " + byyear
				 + "	GROUP BY 1,2,3 " 
				 + "	UNION ALL "
				 + "	SELECT A.expense_id AS purchase_id "
					+ "   , A.expense_date AS purchase_date "
				+ "	   , CONCAT(C.lastname, ' ', C.firstname) AS purchase_by "
				+ "	   , SUM(B.expense_qty * B.expense_unitprice) AS purhcase_total_amount "
				+ "	   , '1' AS purchase_type "
				+ "	FROM tbl_expense A "
				+ "	INNER JOIN tbl_expense_detail B ON A.expense_id = B.expense_id "
				+ "	LEFT JOIN users C ON A.expense_user_id = C.id "
							+ "	WHERE EXTRACT(YEAR FROM A.expense_date) = " + byyear
				+ "	GROUP BY 1,2,3 "
				+ "	ORDER BY 2 DESC;");
			query.setResultTransformer(AliasToEntityMapResultTransformer.INSTANCE);
			List<Map>	importProducts = (List<Map>)query.list();	
			return importProducts;
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
