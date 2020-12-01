package com.sesame.pojo;

/**
 * 医生收费定价
 * @author JChiang
 * @currentTime 2020年11月10日下午2:46:22
 */
public class Charge {
	
	private Integer chargeNo;
	private String  grade;//对应医生等级
	private Double fee;
	private Integer priceTypeNo;
	private ChargeType chargeType;
	private Room room;
	private Doctor doctor;
	public Charge() {
		super();
	}
	public Charge(Integer chargeNo, String grade, Double fee, Integer priceTypeNo) {
		super();
		this.chargeNo = chargeNo;
		this.grade = grade;
		this.fee = fee;
		this.priceTypeNo = priceTypeNo;
	}
	
	public Charge(Integer chargeNo, String grade, Double fee, Integer priceTypeNo, ChargeType chargeType,
			Doctor doctor) {
		super();
		this.chargeNo = chargeNo;
		this.grade = grade;
		this.fee = fee;
		this.priceTypeNo = priceTypeNo;
		this.chargeType = chargeType;
		this.doctor = doctor;
	}

	public Room getRoom() {
		return room;
	}

	public void setRoom(Room room) {
		this.room = room;
	}

	public Integer getChargeNo() {
		return chargeNo;
	}
	public void setChargeNo(Integer chargeNo) {
		this.chargeNo = chargeNo;
	}
	public String getGrade() {
		return grade;
	}
	public void setGrade(String grade) {
		this.grade = grade;
	}
	public Double getFee() {
		return fee;
	}
	public void setFee(Double fee) {
		this.fee = fee;
	}
	public Integer getPriceTypeNo() {
		return priceTypeNo;
	}
	public void setPriceTypeNo(Integer priceTypeNo) {
		this.priceTypeNo = priceTypeNo;
	}
	
	public ChargeType getChargeType() {
		return chargeType;
	}
	public void setChargeType(ChargeType chargeType) {
		this.chargeType = chargeType;
	}
	public Doctor getDoctor() {
		return doctor;
	}
	public void setDoctor(Doctor doctor) {
		this.doctor = doctor;
	}

	@Override
	public String toString() {
		return "Charge{" +
				"chargeNo=" + chargeNo +
				", grade='" + grade + '\'' +
				", fee=" + fee +
				", priceTypeNo=" + priceTypeNo +
				", chargeType=" + chargeType +
				", room=" + room +
				", doctor=" + doctor +
				'}';
	}
}
