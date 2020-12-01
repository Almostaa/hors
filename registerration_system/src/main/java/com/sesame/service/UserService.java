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
	
	/**通过id查询用户信息用于回显*/
	public User queryUserInfo( Integer id);
	
	/**完善用户信息*/
	public Integer improveUserInfo(User user);

    /*查询用户是否存在*/
    User selectuser(String name);

}
