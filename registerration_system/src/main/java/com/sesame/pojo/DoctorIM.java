package com.sesame.pojo;

import org.springframework.stereotype.Repository;

import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;

/**
 * 存储有关医生即时通讯块的讯息
 * @author JChiang
 * @currentTime 2020年11月23日下午7:11:29
 */
@AllArgsConstructor
@NoArgsConstructor
@Repository
public class DoctorIM {
	
	private int doctorImNo;
	private int dno;
	private String accid;
	private String token;
	private String name;
	public int getDoctorImNo() {
		return doctorImNo;
	}
	public void setDoctorImNo(int doctorImNo) {
		this.doctorImNo = doctorImNo;
	}
	public int getDno() {
		return dno;
	}
	public void setDno(int dno) {
		this.dno = dno;
	}
	public String getAccid() {
		return accid;
	}
	public void setAccid(String accid) {
		this.accid = accid;
	}
	public String getToken() {
		return token;
	}
	public void setToken(String token) {
		this.token = token;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	@Override
	public String toString() {
		return "UserIM [doctorImNo=" + doctorImNo + ", dno=" + dno + ", accid=" + accid + ", token=" + token + ", name="
				+ name + "]";
	}
	
	

}
