package com.sesame.pojo;

import org.springframework.stereotype.Repository;

import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;
/**
 * 存储有关用户IM信息
 * @author JChiang
 * @currentTime 2020年11月23日下午7:25:31
 */
@AllArgsConstructor
@NoArgsConstructor
@Repository
public class UserIM {
	
	private int userIMNo;
	private int userNo;
	private String accid;
	private String token;
	private String name;
	public int getUserIMNo() {
		return userIMNo;
	}
	public void setUserIMNo(int userIMNo) {
		this.userIMNo = userIMNo;
	}
	public int getUserNo() {
		return userNo;
	}
	public void setUserNo(int userNo) {
		this.userNo = userNo;
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
		return "UserIM [userIMNo=" + userIMNo + ", userNo=" + userNo + ", accid=" + accid + ", token=" + token
				+ ", name=" + name + "]";
	}
	

}
