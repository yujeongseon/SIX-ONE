package com.team.sixone;

import java.sql.Date;

public class AdminMemberDTO {
	private String id;
	private String name;
	private String profile;
	private String gender;
	private String create_at;
	private String timelinecount;
	private String commentcount;
	private String routinecount;
	
	public AdminMemberDTO() {};
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getProfile() {
		return profile;
	}
	public void setProfile(String profile) {
		this.profile = profile;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getCreate_at() {
		return create_at;
	}

	public void setCreate_at(String create_at) {
		this.create_at = create_at;
	}

	public String getTimelinecount() {
		return timelinecount;
	}

	public void setTimelinecount(String timelinecount) {
		this.timelinecount = timelinecount;
	}

	public String getCommentcount() {
		return commentcount;
	}

	public void setCommentcount(String commentcount) {
		this.commentcount = commentcount;
	}

	public String getRoutinecount() {
		return routinecount;
	}

	public void setRoutinecount(String routinecount) {
		this.routinecount = routinecount;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
