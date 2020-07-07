package com.team.sixone.service;

public class TimelineDTO {
	private int timelineno;
	private String imagename;
	private java.sql.Date createdatdate;
	private String id;
	private String content;
	private String name;
	private String profile;
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getTimelineno() {
		return timelineno;
	}
	public void setTimelineno(int timelineno) {
		this.timelineno = timelineno;
	}
	public String getImagename() {
		return imagename;
	}
	public void setImagename(String imagename) {
		this.imagename = imagename;
	}
	public java.sql.Date getCreatedatdate() {
		return createdatdate;
	}
	public void setCreatedatdate(java.sql.Date createdatdate) {
		this.createdatdate = createdatdate;
	}
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

	
	
}
