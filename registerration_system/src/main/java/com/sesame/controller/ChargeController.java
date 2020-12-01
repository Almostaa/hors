package com.sesame.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.sesame.pojo.Charge;
import com.sesame.pojo.Doctor;
import com.sesame.service.ChargeService;

/**
 * 问诊费和挂号费
 * @author JChiang
 * @currentTime 2020年11月13日下午5:16:51
 */

@RequestMapping("/doctorPrice")
@RestController
public class ChargeController {
	
	@Autowired
	private ChargeService chargeService;
	
	//问诊费
	@RequestMapping(value = "/inquiryFee",method = RequestMethod.GET)
	public Charge queryDoctorInquiryInfo(Integer id) {
		
		 return chargeService.queryDoctorInquiryInfo(id);
		
	}
	//挂号费
	@RequestMapping(value = "/registerFee",method = RequestMethod.GET)
	public Charge queryDoctorRegisterInfo(Integer id) {
		return chargeService.queryDoctorRegisterInfo(id);
	}
	

}
