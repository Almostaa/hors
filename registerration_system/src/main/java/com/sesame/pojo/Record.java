package com.sesame.pojo;

/**
 * 医生排班记录表
 * @author JChiang
 * @currentTime 2020年11月16日下午3:01:49
 */
public class Record {
	
	private Integer recordNo;
	private Integer dno;
	
	private Integer Booking_numb;
	private String dutyDate;
	private Integer dutyNo;
	
	private TimeSlot timeSlot;

	public Record() {
		super();
	}

	public Record(Integer recordNo, Integer dno, Integer booking_numb, String dutyDate, Integer dutyNo,
			TimeSlot timeSlot) {
		super();
		this.recordNo = recordNo;
		this.dno = dno;
		Booking_numb = booking_numb;
		this.dutyDate = dutyDate;
		this.dutyNo = dutyNo;
		this.timeSlot = timeSlot;
	}

	public Integer getRecordNo() {
		return recordNo;
	}

	public void setRecordNo(Integer recordNo) {
		this.recordNo = recordNo;
	}

	public Integer getDno() {
		return dno;
	}

	public void setDno(Integer dno) {
		this.dno = dno;
	}

	public Integer getBooking_numb() {
		return Booking_numb;
	}

	public void setBooking_numb(Integer booking_numb) {
		Booking_numb = booking_numb;
	}

	public String getDutyDate() {
		return dutyDate;
	}

	public void setDutyDate(String dutyDate) {
		this.dutyDate = dutyDate;
	}

	public Integer getDutyNo() {
		return dutyNo;
	}

	public void setDutyNo(Integer dutyNo) {
		this.dutyNo = dutyNo;
	}

	public TimeSlot getTimeSlot() {
		return timeSlot;
	}

	public void setTimeSlotId(TimeSlot timeSlot) {
		this.timeSlot = timeSlot;
	}

	@Override
	public String toString() {
		return "Record [recordNo=" + recordNo + ", dno=" + dno + ", Booking_numb=" + Booking_numb + ", dutyDate="
				+ dutyDate + ", dutyNo=" + dutyNo + ", timeSlot=" + timeSlot + "]";
	}
	
	

}
