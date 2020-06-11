package com.team.sixone;

public class Rou_exeDTO {
	private String no;
	private String exe_no;
	private String rou_no;
	private String count;
	private String set;
	private String days;
	
	public Rou_exeDTO() {}
	
	public Rou_exeDTO(String no, String exe_no,String count, String rou_no, String set, String days) {
		this.count = no;
		this.no = no;
		this.exe_no = exe_no;
		this.rou_no = rou_no;
		this.set = set;
		this.days = days;
	}
	
	public String getCount() {
		return count;
	}

	public void setCount(String count) {
		this.count = count;
	}

	public String getNo() {
		return no;
	}
	public void setNo(String no) {
		this.no = no;
	}
	public String getExe_no() {
		return exe_no;
	}
	public void setExe_no(String exe_no) {
		this.exe_no = exe_no;
	}
	public String getRou_no() {
		return rou_no;
	}
	public void setRou_no(String rou_no) {
		this.rou_no = rou_no;
	}
	public String getSet() {
		return set;
	}
	public void setSet(String set) {
		this.set = set;
	}
	public String getDays() {
		return days;
	}
	public void setDays(String days) {
		this.days = days;
	}
	
	
	
}
