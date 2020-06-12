package com.team.sixone;

import java.sql.Date;
import java.util.List;

public class RoutineDTO {
	private String routine_no;
	private String routine_name;
	private Date create_at;
	private String id;
	private List<Rou_exeDTO> rouList;
	
	public RoutineDTO() {
	}
	
	public RoutineDTO(String routine_no, String routine_name, Date create_at, String id, List<Rou_exeDTO> rouList) {
		this.routine_no = routine_no;
		this.routine_name = routine_name;
		this.create_at = create_at;
		this.id = id;
		this.rouList = rouList;
	}
	
	public String getRoutine_no() {
		return routine_no;
	}
	public void setRoutine_no(String routine_no) {
		this.routine_no = routine_no;
	}
	public String getRoutine_name() {
		return routine_name;
	}
	public void setRoutine_name(String routine_name) {
		this.routine_name = routine_name;
	}
	public Date getCreate_at() {
		return create_at;
	}
	public void setCreate_at(Date create_at) {
		this.create_at = create_at;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public List<Rou_exeDTO> getRouList() {
		return rouList;
	}
	public void setRouList(List<Rou_exeDTO> rouList) {
		this.rouList = rouList;
	}
	
	
	
	
	
	
	
	
	
	
	
}

