package com.sesame.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sesame.mapper.ChargeMapper;
import com.sesame.pojo.Charge;
import com.sesame.pojo.Doctor;
import com.sesame.service.ChargeService;

@Service
public class ChargeServiceImpl implements ChargeService {

	@Autowired
	private ChargeMapper doctorPriceMapper;
	//通过医生id和等级显示医生信息和挂号费用
	@Override
	public Charge queryDoctorInquiryInfo(Integer id) {
		
		return doctorPriceMapper.queryDoctorInquiryInfo(id);
	}
	//通过医生id和等级显示医生信息和问诊费用
	@Override
	public Charge queryDoctorRegisterInfo(Integer id) {
		
		return doctorPriceMapper.queryDoctorRegisterInfo(id);
	}

}
