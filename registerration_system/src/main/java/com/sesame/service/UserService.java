package com.sesame.service;

import com.sesame.pojo.User;

/**
 * User
 * @author JChiang
 * @currentTime 2020年10月22日上午11:30:53
 */
public interface UserService {
	
	/*
	 * 注册用户
	 */
   Integer register(User user);
   
   /**用户登录*/
	public User login(User user);

}
