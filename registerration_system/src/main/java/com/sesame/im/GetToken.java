package com.sesame.im;
import org.apache.http.HttpResponse;


import org.apache.http.NameValuePair;
import org.apache.http.client.HttpClient;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.impl.client.DefaultHttpClient;
import org.apache.http.impl.client.HttpClientBuilder;
import org.apache.http.message.BasicNameValuePair;
import org.apache.http.util.EntityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.alibaba.fastjson.JSONObject;
import com.sesame.pojo.Doctor;
import com.sesame.pojo.DoctorIM;
import com.sesame.pojo.UserIM;
import com.sesame.service.DoctorService;
import com.sesame.service.IMService;
import com.sesame.service.UserService;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Component
@RequestMapping("/token")
public class GetToken {
	
		@Autowired
		private IMService im;
	
		public  void getUserTokens(String phoneNumber) throws Exception{
			
			//DefaultHttpClient httpClient = new DefaultHttpClient();
				HttpClient httpClient = HttpClientBuilder.create().build();
		        String url = "https://api.netease.im/nimserver/user/create.action";
		        HttpPost httpPost = new HttpPost(url);
		
		        String appKey = "629375ea89b5f78b971a41d875a685ed";
		        String appSecret = "edb954e32551";
		        String nonce =  "12345";
		        String curTime = String.valueOf((new Date()).getTime() / 1000L);
		        String checkSum = CheckSumBuilder.getCheckSum(appSecret, nonce ,curTime);//参考 计算CheckSum的java代码
		
		        // 设置请求的header
		        httpPost.addHeader("AppKey", appKey);
		        httpPost.addHeader("Nonce", nonce);
		        httpPost.addHeader("CurTime", curTime);
		        httpPost.addHeader("CheckSum", checkSum);
		        httpPost.addHeader("Content-Type", "application/x-www-form-urlencoded;charset=utf-8");
		
		        // 设置请求的参数
		        List<NameValuePair> nvps = new ArrayList<NameValuePair>();
		        nvps.add(new BasicNameValuePair("accid", phoneNumber));
		        httpPost.setEntity(new UrlEncodedFormEntity(nvps, "utf-8"));
		
		        // 执行请求
		        HttpResponse response = httpClient.execute(httpPost);
		        
		        //=>{"code":200,"info":{"name":"","accid":"aaad","token":"9ea3878d4998ddd02bc8b9e9a682cc3d"}}
		        String res = EntityUtils.toString(response.getEntity(), "utf-8");
		       
		        JSONObject jsonObject=JSONObject.parseObject(res);
		       
		        //=>{"name":"","accid":"aaad","token":"9ea3878d4998ddd02bc8b9e9a682cc3d"}
		        JSONObject jsonInfo =jsonObject.getJSONObject("info");
		        
		        
		        String accid = jsonInfo.get("accid").toString();
		        String token = jsonInfo.get("token").toString(); 
		        
		        UserIM userIm=new UserIM();
		        userIm.setAccid(accid);
		        userIm.setToken(token);
		        userIm.setName(phoneNumber);
		        
		        im.insertUserIm(userIm);
		         // 打印执行结果
		        //System.out.println(EntityUtils.toString(response.getEntity()));
			
		}
		
		//添加医生accid、token
		@RequestMapping(value = "/t",method = RequestMethod.GET)
		public  void getDoctorTokens() throws Exception{
		//DefaultHttpClient httpClient = new DefaultHttpClient();
			HttpClient httpClient = HttpClientBuilder.create().build();
	        String url = "https://api.netease.im/nimserver/user/create.action";
	        HttpPost httpPost = new HttpPost(url);
	
	        String appKey = "629375ea89b5f78b971a41d875a685ed";
	        String appSecret = "edb954e32551";
	        String nonce =  "12345";
	        String curTime = String.valueOf((new Date()).getTime() / 1000L);
	        String checkSum = CheckSumBuilder.getCheckSum(appSecret, nonce ,curTime);//参考 计算CheckSum的java代码
	
	        // 设置请求的header
	        httpPost.addHeader("AppKey", appKey);
	        httpPost.addHeader("Nonce", nonce);
	        httpPost.addHeader("CurTime", curTime);
	        httpPost.addHeader("CheckSum", checkSum);
	        httpPost.addHeader("Content-Type", "application/x-www-form-urlencoded;charset=utf-8");
	
	        // 设置请求的参数
	        List<NameValuePair> nvps = new ArrayList<NameValuePair>();
	        nvps.add(new BasicNameValuePair("accid", "113"));
	        httpPost.setEntity(new UrlEncodedFormEntity(nvps, "utf-8"));
	
	        // 执行请求
	        HttpResponse response = httpClient.execute(httpPost);
	        
	        //=>{"code":200,"info":{"name":"","accid":"aaad","token":"9ea3878d4998ddd02bc8b9e9a682cc3d"}}
	        String res = EntityUtils.toString(response.getEntity(), "utf-8");
	       
	        JSONObject jsonObject=JSONObject.parseObject(res);
	       
	        //=>{"name":"","accid":"aaad","token":"9ea3878d4998ddd02bc8b9e9a682cc3d"}
	        JSONObject jsonInfo =jsonObject.getJSONObject("info");
	        
	        
	        String accid = jsonInfo.get("accid").toString();
	        String token = jsonInfo.get("token").toString(); 
	        
	        DoctorIM dIm=new DoctorIM();
	        dIm.setAccid(accid);
	        dIm.setToken(token);
	        im.insertDoctorIm(dIm);

	         // 打印执行结果
	        System.out.println(res);
		
	}
}
