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

/*根据编号查询医生所有信息*/
export function getDoctorInfor(params){
	
	 return request({
		 //如果是绝对路径就不会在使用配置里的url
		 url: "/doctor/doctorInfor", 
		 method: "get",
		 params: params 
	 });
}
