package com.sesame.pojo;

/**
 * 给医护排班的表
 * @author JChiang
 * @currentTime 2020年11月16日下午2:56:34
 */
public class Duty {
	private Integer dutyNo;
	private Integer dno;
	private String dutyDate;
	private String timeSlotId;
	public Duty(Integer dutyNo, Integer dno, String dutyDate, String timeSlotId) {
		super();
		this.dutyNo = dutyNo;
		this.dno = dno;
		this.dutyDate = dutyDate;
		this.timeSlotId = timeSlotId;
	}
	public Duty() {
		super();
	}
	public Integer getDutyNo() {
		return dutyNo;
	}
	public void setDutyNo(Integer dutyNo) {
		this.dutyNo = dutyNo;
	}
	public Integer getDno() {
		return dno;
	}
	public void setDno(Integer dno) {
		this.dno = dno;
	}
	public String getDutyDate() {
		return dutyDate;
	}
	public void setDutyDate(String dutyDate) {
		this.dutyDate = dutyDate;
	}
	public String getTimeSlotId() {
		return timeSlotId;
	}
	public void setTimeSlotId(String timeSlotId) {
		this.timeSlotId = timeSlotId;
	}
	@Override
	public String toString() {
		return "Duty [dutyNo=" + dutyNo + ", dno=" + dno + ", dutyDate=" + dutyDate + ", timeSlotId=" + timeSlotId
				+ "]";
	}
	
	

}
