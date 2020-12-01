package com.sesame.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.sesame.im.GetToken;
import com.sesame.interceptor.MD5UtilConfig;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.alibaba.fastjson.JSON;
import com.sesame.mapper.UserMapper;
import com.sesame.pojo.User;
import com.sesame.pojo.UserIM;
import com.sesame.service.IMService;
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
	private GetToken getToken;
	
	@Autowired
	private IMService im;
	
	/**用户注册*/
	@RequestMapping(value="/register",method = RequestMethod.GET)
	public RespBean  registeredUser(HttpServletRequest request,@RequestParam String phoneNumber,@RequestParam String passWord,@RequestParam String code) {

		User user =new User();
		user.setPhoneNumber(phoneNumber);
		user.setPassWord(passWord);
		//user.setPassWord(MD5UtilConfig.string2MD5(passWord));
		//System.out.println(getToken.getTokens(phoneNumber));

        //手机号是否被注册
        User ui = userService.selectuser(phoneNumber);
        if (ui == null) {
            try {
                String vCode =(String) request.getServletContext().getAttribute(AliyunSmsController.getTel());
                System.out.println(vCode+"qwe");
                //拿session中存储的验证码与用户输入的验证码进行比较
                if (vCode.equals(code)) {

					int res = userService.register(user);
                    if (res > 0) {  
                    	//调用IM生成一个用户IM　token信息返回表中
                    	getToken.getUserTokens(phoneNumber);
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
        else{
            return  new RespBean("error", "电话已经被注册");
        }
				
	}
	
	/**用户登录：电话号+验证码or电话号+密码*/
	@RequestMapping(value = "/login",method = RequestMethod.POST)
	public ResponseData loginUser2(@RequestBody Map<String,Object>UserMap,HttpServletRequest request) throws Exception{

		UserIM userIM=new UserIM();


		String code=null;
		String vCode=null;
		ResponseData responseData=null;
		
		User user =new User();
		user.setPhoneNumber(UserMap.get("phoneNumber").toString());

		String pw="";
		try {
			pw=UserMap.get("passWord").toString();
			user.setPassWord(pw);
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(""+user.getPassWord());
		}

		code = (String) UserMap.get("code");


		try {
			vCode =(String) request.getServletContext().getAttribute(AliyunSmsController.getTel());									
		} catch (Exception e) {
			// TODO: handle exception
		}	

		//判断用户使用什么方式登录		
		if((user.getPhoneNumber()!=null&&user.getPassWord()!=null)) {
		
			User loginUser = userService.login(user); 
			
			//通过用户传入的参数查询数据库看数据是否为空。
			if(loginUser!=null) {
				
				userIM=im.selectUserToken(UserMap.get("phoneNumber").toString());
				
				responseData = ResponseData.ok();								
				//生成一个token串
				String token=JwtTokenUtils.encryptionToken(user);
				//向浏览器返回token，客户端收到此token后存入cookie中，或者h5的本地存储中
				responseData.putDataValue("token", token);	
				//以及用户
				responseData.putDataValue("user", loginUser);
				//返回IM token
				responseData.putDataValue("userImInfo", userIM);
				//将用户信息存入session 可用于判断用户是否登录。
				request.getServletContext().setAttribute("loginUser",loginUser);					
								
			}else{
			
				//用户或者密码错误
				responseData = ResponseData.login();
			}
			
		}else if((code!=null&&user.getPhoneNumber()!=null)){
			
			   User loginUser = userService.login(user); 
				if(code.equals(vCode)&&loginUser!=null) {
					
					userIM=im.selectUserToken(UserMap.get("phoneNumber").toString());
				    responseData = ResponseData.ok();
					
					//生成一个token串
					String token=JwtTokenUtils.encryptionToken(user);
					//向浏览器返回token，客户端收到此token后存入cookie中，或者h5的本地存储中
					responseData.putDataValue("token", token);
					
					//以及用户
					responseData.putDataValue("user", loginUser);	
					
					//返回IM token
					responseData.putDataValue("userImInfo", userIM);
					
					request.getServletContext().setAttribute("loginUser",loginUser);	
				}else {
					
					String str ="电话号或验证码错误";
					//用户或者验证码错误
					responseData = ResponseData.customerError(str);
				}					
		}else {			

		}
		return  responseData;		
	}
		
	/**通过传入的id查询用户信息*/
	@RequestMapping(value = "/queryUserInfo",method = RequestMethod.GET)
	public User queryUserInfo(@RequestParam("userNo") Integer userNo) {

		return userService.queryUserInfo(userNo);
		
	}

    /**
     * 完善用户信息
     * 忘记（修改）密码
     * @param request
     * @param UserMap
     * @return
     */
	@RequestMapping(value = "/improveInfoOrModifyPW",method = RequestMethod.POST)
	public RespBean improveInfoOrModifyPassWord(HttpServletRequest request,@RequestBody Map<String,Object>UserMap) throws Exception{
		User user =new User();
		int count=0;
		String vCode=null;
		System.out.println(UserMap);
		//通过判断是否有验证码来判断是修改密码还是完善信息		
		if(UserMap.containsKey("code")) {
			
			String code = UserMap.get("code").toString();			
			user.setPhoneNumber(UserMap.get("phoneNumber").toString());			
			String newPossWd = UserMap.get("newPossWd").toString();
			String comfirmPassWd = UserMap.get("comfirmPassWd").toString();
			User users = userService.login(user);
			
			try {
				vCode =(String) request.getServletContext().getAttribute(AliyunSmsController.getTel());											
			} catch (Exception e) {
				e.printStackTrace();
			}
			if(users!=null) {
				//修改密码
				if(vCode.equalsIgnoreCase(code)&&newPossWd.equalsIgnoreCase(comfirmPassWd)) {										
					users.setPassWord(newPossWd);
					count=userService.improveUserInfo(users);					
				}else {					
					return new RespBean("error", "验证码或两次密码输入结果不一致");
				}				
			}else {
				return new RespBean("error", "手机号不存在!");
			}			
		}else {
			//完善信息
			User userInfo =JSON.parseObject(JSON.toJSONString(UserMap),User.class);			
			count= userService.improveUserInfo(userInfo);
		}
		
		if(count>0) {			
			return new RespBean("success", "操作成功！!");
		}else {
			return new RespBean("success", "操作失败！!");
		}
		
	}
	
	
}
