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

/*查询用户问诊信息*/
export function consultInfoList(params){	
	 return request({
		 url: "consultInfo/list", 
		 method: "get",
		 params: params 
	 });
}

/*确认订单后插入数据*/
export function insertOrder(params){	
	 return request({
		 url: "apptInfo/insertOrder", 
		 method: "get",
		 params: params 
	 });
}

/*支付成功后更新状态码*/
export function updateOrder(params){	
	 return request({
		 url: "apptInfo/updateOrder", 
		 method: "get",
		 params: params 
	 });
}


/**
 * 保存订单并支付
 * @param params
 * @returns {AxiosPromise}
 */
export function saveOrderAndPay(params) {
  return request({
    url: "/apptInfo/toSaveAndPay", //如果是绝对路径就不会在使用配置里的url
    method: "post",
    data: params //注意：如果是post请求请使用 data: params
  });
}


//门诊

/**
 * 保存订单并支付
 * @param params
 * @returns {AxiosPromise}
 */
export function saveOrderAndPayC(params) {
  return request({
    url: "/consultInfo/toSaveAndPay", //如果是绝对路径就不会在使用配置里的url
    method: "post",
    data: params //注意：如果是post请求请使用 data: params
  });
}

/*确认订单后插入数据*/
export function insertOrderC(params){	
	 return request({
		 url: "consultInfo/insertOrder", 
		 method: "get",
		 params: params 
	 });
}

/*支付成功后更新状态码*/
export function updateOrderC(params){	
	 return request({
		 url: "consultInfo/updateOrder", 
		 method: "get",
		 params: params 
	 });
}

/*根据门诊编号查询支付状态码*/
export function getConsultInfoState(params){	
	 return request({
		 url: "consultInfo/getConsultInfoState", 
		 method: "get",
		 params: params 
	 });
}

/*退出咨询页面更新结束时间*/
export function updateDate(params){	
	 return request({
		 url: "consultInfo/updateDate", 
		 method: "get",
		 params: params 
	 });
}