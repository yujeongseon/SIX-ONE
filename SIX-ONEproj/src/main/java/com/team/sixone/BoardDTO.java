package com.team.sixone;

import java.sql.Date;

public class BoardDTO {
	private String board_no;
	private String title;
	private String content;
	private Date create_at;
	private String image_name;
	private String category;
	private String id;
	private String count;
	private String name;

	public BoardDTO() {}
	public BoardDTO(String board_no, String title, String content, Date create_at, String image_name, String category,
			String id, String name,String count) {
		
		this.board_no = board_no;
		this.title = title;
		this.content = content;
		this.create_at = create_at;
		this.image_name = image_name;
		this.category = category;
		this.id = id;
		this.name = name;
		this.count = count;
	}

	
	
	public String getBoard_no() {
		return board_no;
	}

	public void setBoard_no(String board_no) {
		this.board_no = board_no;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Date getCreate_at() {
		return create_at;
	}

	public void setCreate_at(Date create_at) {
		this.create_at = create_at;
	}

	public String getImage_name() {
		return image_name;
	}

	public void setImage_name(String image_name) {
		this.image_name = image_name;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
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
	

	public String getcount() {
		return count;
	}

	public void setCount(String count) {
		this.count = count;
	}

	
	
	
	
	
}
