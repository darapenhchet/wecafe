package com.kosign.wecafe.services;

import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kosign.wecafe.entities.Category;
import com.kosign.wecafe.entities.Slide;

@Service
public class SlideServiceImpl implements SlideService{

	@Autowired
	private SessionFactory sessionFactory;
	
	@Override
	@Transactional
	public List<Slide> getAllSlides() {
		try{
			return sessionFactory.getCurrentSession().createCriteria(Slide.class).list();
		}catch(Exception ex){
			ex.printStackTrace();
		}
		return null;
	}

	@Override
	public Boolean addNewSlide(Slide slide) {
		try{
			sessionFactory.getCurrentSession().save(slide);
			return true;
		}catch(Exception ex){
			ex.printStackTrace();
		}
		return false;
	}

	@Override
	public Boolean updateSlide(Slide slide) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Boolean deleteSlide(Integer id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Category findSlideById(Integer id) {
		// TODO Auto-generated method stub
		return null;
	}
	

}
