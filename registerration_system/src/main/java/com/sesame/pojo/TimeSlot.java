package com.sesame.pojo;

public class TimeSlot {
	
	private Integer timeSlotId;
	private String timeSlotRange;
	public TimeSlot(Integer timeSlotId, String timeSlotRange) {
		super();
		this.timeSlotId = timeSlotId;
		this.timeSlotRange = timeSlotRange;
	}
	public TimeSlot() {
		super();
	}
	public Integer getTimeSlotId() {
		return timeSlotId;
	}
	public void setTimeSlotId(Integer timeSlotId) {
		this.timeSlotId = timeSlotId;
	}
	public String getTimeSlotRange() {
		return timeSlotRange;
	}
	public void setTimeSlotRange(String timeSlotRange) {
		this.timeSlotRange = timeSlotRange;
	}
	@Override
	public String toString() {
		return "TimeSlot [timeSlotId=" + timeSlotId + ", timeSlotRange=" + timeSlotRange + "]";
	}
	
	

}
