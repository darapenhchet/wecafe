package com.kosign.wecafe.services;

import java.util.List;

import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kosign.wecafe.entities.User;

@Service
public class UserServiceImpl implements UserService{

	@Autowired
	private SessionFactory sessionFactory;
	
	@Autowired
    private PasswordEncoder passwordEncoder;
	
	@Override
	@Transactional
	public User findUserById(Long id) {
		try{
			return sessionFactory.getCurrentSession().load(User.class, id);
		}catch(Exception ex){
			ex.printStackTrace();
		}
		return null;
	}

	@Override
	@Transactional
	public User findUserByEmail(String email) {
		try{
			return  (User) sessionFactory.getCurrentSession().createCriteria(User.class)
								.add(Restrictions.eq("email", email))
								.uniqueResult();
		}catch(Exception ex){
			ex.printStackTrace();
		}
		return null;
	}
	
	@Override
	@Transactional
	public User findUserByUsername(String username) {
		try{
			return  (User) sessionFactory.openSession().createCriteria(User.class)
								.add(Restrictions.eq("username", username))
								.uniqueResult();
		}catch(Exception ex){
			ex.printStackTrace();
		}
		return null;
	}
	
	@Override
	@Transactional
	public Boolean saveUser(User user) {
		try{
			System.out.println(user.getPassword());
			user.setPassword(passwordEncoder.encode(user.getPassword()));
			sessionFactory.openSession().save(user);
			return true;
		}catch(Exception ex){
			System.out.println(ex.getMessage());
			ex.printStackTrace();
		}
		return false;
	}

	
	@Override
	@Transactional
	public List<User> getAllUsers(){
		try{
			return (List<User>)sessionFactory.getCurrentSession().createCriteria(User.class).list();
		}catch(Exception ex){
			System.out.println(ex.getMessage());
			ex.printStackTrace();
		}
		return null;
	}
}
