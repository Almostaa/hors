package com.sesame.mapper;

import org.apache.ibatis.annotations.Param;

import com.sesame.pojo.DoctorIM;
import com.sesame.pojo.UserIM;


public interface IMMapper {
	
	//存储一条用户IM有关的信息
	Integer insertUserIm(UserIM userIm);
	
	//查询用户token信息	
	UserIM selectUserToken(String phoneNumber);
	
	//存储一条医生IM有关的信息
	Integer insertDoctorIm(DoctorIM doctorIm);
	
	//查询医生的accid,token
	DoctorIM selectDoctorImInfo(String accid);

}
