package com.sesame.service;

import com.sesame.pojo.Charge;
import com.sesame.pojo.Doctor;

public interface ChargeService {

	//通过医生id和等级显示医生信息和挂号费用
	public Charge queryDoctorRegisterInfo(Integer id) ;
		
	//通过医生id和等级显示医生信息和问诊费用
	public Charge queryDoctorInquiryInfo(Integer id) ;

}
