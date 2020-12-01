package com.sesame.service.impl;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sesame.mapper.IMMapper;
import com.sesame.pojo.DoctorIM;
import com.sesame.pojo.UserIM;
import com.sesame.service.IMService;

@Service
public class IMServiceImpl implements IMService {

	@Autowired
	private IMMapper IM;
	
	@Override
	public Integer insertUserIm(UserIM userIm) {
		// TODO Auto-generated method stub
		return IM.insertUserIm(userIm);
	}
	
	//查询用户token信息	
	@Override
	public UserIM selectUserToken(String phoneNumber) {
		
		return IM.selectUserToken(phoneNumber);
	}


	//存储一条医生IM有关的信息
	public	Integer insertDoctorIm(DoctorIM doctorIm) {
		
		return IM.insertDoctorIm(doctorIm);
	}
	
	//查询医生的accid,token
	public	DoctorIM selectDoctorImInfo( String accid) {
		
		return IM.selectDoctorImInfo(accid);
	};

}
