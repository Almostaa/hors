import request from "@/utils/request.js";

//挂号费
export function getDoctorInforList(params){
	
	 return request({
		 url: "/doctorPrice/registerFee", 
		 method: "get",
		 params: params 
	 });
}

//问诊费
export function getDoctorinquiryFee(params){
	
	 return request({
		 url: "/doctorPrice/inquiryFee", 
		 method: "get",
		 params: params 
	 });
}

//通过医生id查询以当天日期为准的 往后7天的排班记录
export function selectRecord(params){
	
	 return request({
		 url: "/app/selectRecord", 
		 method: "get",
		 params: params
	 });
}

//修改医生预约量
//先通过值班记录查询对应时间点的预约量之后在进行修改
export function updateCount(params){
	
	 return request({
		 url: "/app/updateCount", 
		 method: "post",
		 data: params 
	 });
}
