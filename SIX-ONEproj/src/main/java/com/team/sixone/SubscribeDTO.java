package com.team.sixone;

public class SubscribeDTO {
	private String subscribe_no;
	private String routine_no;
	private String id;
	
	public SubscribeDTO() {}
	
	
	public SubscribeDTO(String subscribe_no, String routine_no, String id) {
		
		this.subscribe_no = subscribe_no;
		this.routine_no = routine_no;
		this.id = id;
	}


	public String getSubscribe_no() {
		return subscribe_no;
	}
	public void setSubscribe_no(String subscribe_no) {
		this.subscribe_no = subscribe_no;
	}
	public String getRoutine_no() {
		return routine_no;
	}
	public void setRoutine_no(String routine_no) {
		this.routine_no = routine_no;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	
	
	
	
	
}
