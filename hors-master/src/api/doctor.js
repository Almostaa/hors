import request from "@/utils/request.js";
/* 
	根据科室编号获取科室下的医生
 */
export function getDoctorList(params){
	
	 return request({
		 //如果是绝对路径就不会在使用配置里的url
		 url: "/doctor/roomdoctor", 
		 method: "get",
		 params: params 
	 });
}
