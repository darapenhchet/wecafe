package com.kosign.wecafe.services;

import com.kosign.wecafe.entities.User;

public interface UserService {

	public User findUserById(Long id);
	
	public User findUserByUsername(String username);
	
	public User findUserByEmail(String email);
	
	public Boolean saveUser(User user);
}
