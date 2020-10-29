package com.sesame.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sesame.mapper.UserMapper;
import com.sesame.pojo.User;
import com.sesame.service.UserService;

/**
 * UserService实现类
 * @author JChiang
 * @currentTime 2020年10月23日下午2:27:04
 */
@Service
public class UserServiceImpl implements UserService {
	
	@Autowired
	private UserMapper userMapper;


	/** 注册用户*/
	@Override
	public Integer register(User user) {
		
		return userMapper.register(user);
	}
	
	/**验证用户登录*/
	@Override
	public User login(User user) {
		
		return userMapper.loginUser(user);
	}
	
	
	
	

}
