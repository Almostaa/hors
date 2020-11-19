import request from "@/utils/request.js";
/* 
	用户登录
 */
export function login(params){
	
	 return request({
		 //如果是绝对路径就不会在使用配置里的url
		 url: "/user/login", 
		method: "post",
		data: params 
	 });
}
/* 
 注册验证码
 */
export function smsStudent(params){
	
	 return request({
		 //如果是绝对路径就不会在使用配置里的url
		 url: "/sms/smsStudent", 
		 method: "get",
		 params: params 
	 });
}

/* 
	用户注册
 */
export function registerform(params){
	
	 return request({
		 //如果是绝对路径就不会在使用配置里的url
		 url: "/user/register", 
		 method: "get",
		 params: params 
	 });
}

/* 
	重置密码
 */
export function forget(params){
	
	 return request({
		 url: "/user/improveInfoOrModifyPW", 
		 method: "post",
		 data: params 
	 });
}

/* 查询当前登录用户 */
export function queryUserInfo(params){
	
	 return request({
		 url: "/user/queryUserInfo", 
		 method: "get",
		 params: params 
	 });
}

/*查询用户挂号信息*/
export function apptInfoList(params){
	
	 return request({
		 url: "/apptInfo/list", 
		 method: "get",
		 params: params 
	 });
}
/*查询用户问诊信息*/
export function consultInfoList(params){	
	 return request({
		 url: "consultInfo/list", 
		 method: "get",
		 params: params 
	 });
}

