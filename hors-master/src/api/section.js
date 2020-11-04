import request from "@/utils/request.js";
/* 
	获取大类
 */
export function sectionlist(params){
	
	 return request({
		 //如果是绝对路径就不会在使用配置里的url
		 url: "/section/allsection", 
		 method: "get",
		 params: params 
	 });
}
/* 
	获取科室
 */
export function roomList(params){
	
	 return request({
		 url: "/room/roomlist", 
		 method: "get",
		 params: params 
	 });
}

/* 根据大类编号查找科室 */

export function roomListById(params){
	
	 return request({
		 url: "/room/roomlistbyid", 
		 method: "get",
		 params: params 
	 });
}