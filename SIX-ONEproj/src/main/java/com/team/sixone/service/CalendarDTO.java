package com.team.sixone.service;

public class CalendarDTO {

	private String calendarNo;
	private String startDate;
	private String endDate;
	private String id;
	private String routineNo;
	private String playNo;
	
	public CalendarDTO(String calendarNo, String startDate, String endDate, String id, String routineNo,
			String playNo) {
		this.calendarNo = calendarNo;
		this.startDate = startDate;
		this.endDate = endDate;
		this.id = id;
		this.routineNo = routineNo;
		this.playNo = playNo;
	}
	

	public String getCalendarNo() {
		return calendarNo;
	}

	public void setCalendarNo(String calendarNo) {
		this.calendarNo = calendarNo;
	}

	public String getStartDate() {
		return startDate;
	}

	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}

	public String getEndDate() {
		return endDate;
	}

	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getRoutineNo() {
		return routineNo;
	}

	public void setRoutineNo(String routineNo) {
		this.routineNo = routineNo;
	}

	public String getPlayNo() {
		return playNo;
	}

	public void setPlayNo(String playNo) {
		this.playNo = playNo;
	}
	
	
	
	
	
	
	
	
	
	
}
