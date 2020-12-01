package com.sesame.mapper;

import com.sesame.pojo.Charge;
import com.sesame.pojo.Doctor;

/**
 * 实现医生问诊和挂号定价
 * @author JChiang
 * @currentTime 2020年11月10日下午3:35:06
 */
public interface ChargeMapper {
	
	//通过医生id和等级显示医生信息和挂号费用
	public Charge queryDoctorRegisterInfo(Integer id) ;
	
	//通过医生id和等级显示医生信息和问诊费用
	public Charge queryDoctorInquiryInfo(Integer id) ;

}
