import request from "@/utils/request.js";


/*查询所有资讯类型*/
export function infortypelist(params){
	
	 return request({
		 url: "/infor/infortypelist", 
		 method: "post",
		 data: params 
	 });
}
