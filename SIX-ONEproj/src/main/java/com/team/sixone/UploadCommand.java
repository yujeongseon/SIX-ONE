package com.team.sixone;

import org.springframework.web.multipart.MultipartFile;

public class UploadCommand {
	
	//※ input type="file"는 MultipartFile타입으로]	
	private MultipartFile upload;
	
	public MultipartFile getUpload() {
		return upload;
	}
	public void setUpload(MultipartFile upload) {
		this.upload = upload;
	}
	
	
}
