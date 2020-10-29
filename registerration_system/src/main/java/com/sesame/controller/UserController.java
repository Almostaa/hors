package com.sesame.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.sesame.pojo.User;
import com.sesame.service.UserService;
import com.sesame.utils.JwtTokenUtils;
import com.sesame.utils.RespBean;
import com.sesame.utils.ResponseData;


/**
 * UserController
 * @author JChiang
 * @currentTime 2020年10月23日下午2:57:18
 */

@RestController
@RequestMapping("/user")
public class UserController {
	
	@Autowired
	private UserService userService;
	@Autowired
	HttpSession session;
	
	/**用户注册*/
	@RequestMapping(value="/register",method = RequestMethod.POST)
	public RespBean  registeredUser(@RequestBody User user,@RequestParam String code) {
		
		System.out.println(session.getAttribute("codes"));
		try {
			String vCode = session.getAttribute("codes").toString();
			//拿session中存储的验证码与用户输入的验证码进行比较
			if (vCode.equals(code)) {

				int res = userService.register(user);
				if (res > 0) {
					return new RespBean("success", "注册成功!");
				} else {
					return new RespBean("error", "注册失败!");
				}
			} else {
				return new RespBean("error", "验证码错误!");
			} 
		} catch (Exception e) {
			
			return  new RespBean("error", "验证码不存在");
		}
				
	}
	
	/**用户登录：电话号+验证码or电话号+密码*/
	@RequestMapping(value = "/login",method = RequestMethod.POST)
	public ResponseData loginUser(@RequestBody User user,@RequestParam(required = false) String code) {
		
		
		ResponseData responseData=null;		
		String vCode=null;
		try {
			 vCode = session.getAttribute("codes").toString();
			
		} catch (Exception e) {}

		//判断用户使用什么方式登录		
		if((user.getPhoneNumber()!=null&&user.getPassWord()!=null)) {
		
			User loginUser = userService.login(user); 
			
			//通过用户传入的参数查询数据库看数据是否为空。
			if(loginUser!=null) {
				
				responseData = ResponseData.ok();								
				//生成一个token串
				String token=JwtTokenUtils.encryptionToken(user);
				//向浏览器返回token，客户端收到此token后存入cookie中，或者h5的本地存储中
				responseData.putDataValue("token", token);			
				//以及用户
				responseData.putDataValue("user", loginUser);
				//将用户信息存入session 可用于判断用户是否登录。
				session.setAttribute("loginUser",loginUser);					
								
			}else{
			
				//用户或者密码错误
				responseData = ResponseData.login();
			}
			
		}else if((code!=null&&user.getPhoneNumber()!=null)){
			
			   User loginUser = userService.login(user); 
				if(code.equals(vCode)&&loginUser!=null) {
															
				    responseData = ResponseData.ok();
					
					//生成一个token串
					String token=JwtTokenUtils.encryptionToken(user);
					//向浏览器返回token，客户端收到此token后存入cookie中，或者h5的本地存储中
					responseData.putDataValue("token", token);
					
					//以及用户
					responseData.putDataValue("user", loginUser);					
					session.setAttribute("loginUser",loginUser);	
				}else {
					
					String str ="电话号或验证码错误";
					//用户或者验证码错误
					responseData = ResponseData.customerError(str);
				}					
		}else {
			
//			String str="username or password is wrong";
//			//用户或者密码错误
//			responseData.customerError(str);
		}
		return  responseData;		
	}
	

}
