import request from "@/utils/request.js";


/* 获取轮播图图片 */
export function rotationlist(params){
	
	 return request({
		 url: "/rotation/rotationlist", 
		 method: "get",
		 params: params 
	 });
}

/* 根据编号查询新闻信息 */
export function newsById(params){
	
	 return request({
		 url: "/rotation/newsById", 
		 method: "get",
		 params: params 
	 });
}

 /*查询编号在3以上的新闻信息*/
export function selectList(params){
	
	 return request({
		 url: "/rotation/newslist", 
		 method: "get",
		 params: params 
	 });
}