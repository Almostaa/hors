package com.sesame.pojo;

public class User {
	
	private Integer userNo;
	private String userName;
	private String passWord;
	private String sex;
	private String idCardNumber;	
	private String socialCard;
	private String phoneNumber;


	
	public User() {
		super();
	}


	public User(String passWord, String phoneNumber) {
		super();
		this.passWord = passWord;
		this.phoneNumber = phoneNumber;
	}


	public User(Integer userNo, String userName, String passWord, String sex, String idCardNumber, String socialCard,
			String phoneNumber) {
		super();
		this.userNo = userNo;
		this.userName = userName;
		this.passWord = passWord;
		this.sex = sex;
		this.idCardNumber = idCardNumber;
		this.socialCard = socialCard;
		this.phoneNumber = phoneNumber;
	}



	public Integer getUserNo() {
		return userNo;
	}


	public void setUserNo(Integer userNo) {
		this.userNo = userNo;
	}


	public String getUserName() {
		return userName;
	}


	public void setUserName(String userName) {
		this.userName = userName;
	}


	public String getPassWord() {
		return passWord;
	}


	public void setPassWord(String passWord) {
		this.passWord = passWord;
	}


	public String getSex() {
		return sex;
	}


	public void setSex(String sex) {
		this.sex = sex;
	}


	public String getIdCardNumber() {
		return idCardNumber;
	}


	public void setIdCardNumber(String idCardNumber) {
		this.idCardNumber = idCardNumber;
	}


	public String getSocialCard() {
		return socialCard;
	}


	public void setSocialCard(String socialCard) {
		this.socialCard = socialCard;
	}


	public String getPhoneNumber() {
		return phoneNumber;
	}


	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}



	@Override
	public String toString() {
		return "User [userNo=" + userNo + ", userName=" + userName + ", passWord=" + passWord + ", sex=" + sex
				+ ", idCardNumber=" + idCardNumber + ", socialCard=" + socialCard + ", phoneNumber=" + phoneNumber
				+ "]";
	}
	
	
	
	
	

}
