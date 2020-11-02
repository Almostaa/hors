package com.sesame.mapper;

import org.springframework.web.bind.annotation.RequestParam;

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
	
	/**通过id查询用户信息用于回显*/
	public User queryUserInfo( Integer id);
	/**完善用户信息*/
	public Integer improveUserInfo(User user);
	

}
