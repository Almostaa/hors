package com.sesame.mapper;

import com.sesame.pojo.User;

/**
 * UserMapper
 * @author JChiang
 * @currentTime 2020年10月23日下午2:27:38
 */

public interface UserMapper {
	
	/**注册用户*/
	public Integer register(User user);
	
	/**用户登录*/
	public User loginUser(User user);
	

}
