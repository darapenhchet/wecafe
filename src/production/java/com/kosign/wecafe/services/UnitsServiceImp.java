package com.kosign.wecafe.services;

import java.util.List;

import org.hibernate.Hibernate;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kosign.wecafe.entities.Category;
import com.kosign.wecafe.entities.Unit;
import com.kosign.wecafe.util.HibernateUtil;

@Service
public class UnitsServiceImp implements UnitService {

	@Autowired
	private SessionFactory sessionFactory;
	
	@Override
	public List<Unit> getAllUnits() {
		Session session = HibernateUtil.getSessionFactory().openSession();
		try {
			session.getTransaction().begin();
			Query query = session.createQuery("FROM Unit");
			List<Unit> units = query.list();
			return units;
			
		} catch (Exception e) {
			e.getStackTrace();
			System.out.println(e.getMessage());
			session.getTransaction().rollback();
		}finally {
			session.close();
		}
		return null;
	}

	@Override
	@Transactional
	public Boolean addNewUnit(Unit unit) {
		try{
			sessionFactory.getCurrentSession().save(unit);
			return true;
		}catch(Exception ex){
			System.out.println(ex.getMessage());
			ex.printStackTrace();
		}
		return false;
	}

	@Override
	@Transactional
	public Unit findUnit(Long unitid) {
		try{
			return sessionFactory.getCurrentSession().get(Unit.class, unitid);
		}catch(Exception ex){
			System.out.println(ex.getMessage());
			ex.printStackTrace();
		}
		return null;
	}

}
