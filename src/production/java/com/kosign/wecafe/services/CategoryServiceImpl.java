package com.kosign.wecafe.services;

import java.util.Date;
import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kosign.wecafe.entities.Category;

@Service
public class CategoryServiceImpl implements CategoryService{

	@Autowired
	private SessionFactory sessionFactory;
	
	@Override
	@Transactional
	public List<Category> getAllCategories() {
		try{
			return (List<Category>)sessionFactory.getCurrentSession().createCriteria(Category.class).list();
		}catch(Exception ex){
			System.out.println(ex.getMessage());
			ex.printStackTrace();
		}
		return null;
	}

	@Override
	@Transactional
	public Boolean addNewCategory(Category category) {
		try{
			sessionFactory.getCurrentSession().save(category);
			return true;
		}catch(Exception ex){
			System.out.println(ex.getMessage());
			ex.printStackTrace();
		}
		return null;
	}

	@Override
	@Transactional
	public Boolean updateCategory(Category category) {
		try{
			category.setLastUpdatedDate(new Date());
			sessionFactory.getCurrentSession().saveOrUpdate(category);
			return true;
		}catch(Exception ex){
			System.out.println(ex.getMessage());
			ex.printStackTrace();
		}
		return null;
	}

	@Override
	public Boolean deleteCategory(Long id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	@Transactional
	public Category findCategoryById(Long id) {
		try{
			return sessionFactory.getCurrentSession().get(Category.class, id);
		}catch(Exception ex){
			System.out.println(ex.getMessage());
			ex.printStackTrace();
		}
		return null;
	}
	
	

}
