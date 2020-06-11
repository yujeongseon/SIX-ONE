package com.team.sixone;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.servlet.ServletContext;
import javax.sql.DataSource;

public class DAO {
	private Connection conn;
	private PreparedStatement psmt;
	private ResultSet rs;
	
	public DAO(ServletContext context) {
		try {
			// 커넥션 풀을 이용한 DB연결
			Context ctx = new InitialContext();

			DataSource source = (DataSource) ctx.lookup("java:comp/env/sixone");

			conn = source.getConnection();
		} catch (Exception e) {
			e.printStackTrace();
		}

	}
	
	public int uploadtest(String saveDirectory, String filename, String content, String id) {
		int no = (int)(Math.random()*10000);
		System.out.println("번호 "  + no);
		String sql = "insert into timeline values("+no+",'"+content+"', '"+saveDirectory+filename+"', sysdate, '"+id+"')";
		System.out.println(saveDirectory);
		System.out.println(filename);
		
		try {
			psmt = conn.prepareStatement(sql);
			int upd =psmt.executeUpdate();
			System.out.println("영향받은 행수 : " + upd);
			
			psmt.close();
			conn.close();
		
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return 9;
	}
	
	public String[] SearchTest() {
		 //라이크 사용

		String[] images = new String[1];
		String[] ids = new String[1];
		String[] content = new String[1];
		Date[] date = new Date[1];
		String cntSql = "SELECT COUNT(*) FROM test WHERE src LIKE '%ja%'"; // 배열 선언함
		String sql = "SELECT * FROM TEST WHERE src LIKE '%ja%'"; // 사진긁어옴
		
		int i = 0;
		try {
			psmt = conn.prepareStatement(cntSql);
			rs = psmt.executeQuery();
			rs.next();
			int columnCount = rs.getInt(1);
			psmt.close();
			
			
			psmt = conn.prepareStatement(sql);
			rs = psmt.executeQuery();
		
			System.out.println(columnCount);
			if(columnCount != 0) {
				images = new String[columnCount]; 
				ids = new String[columnCount];
				content = new String[columnCount];
				date = new Date[columnCount];}
			while (rs.next()) {
				images[i] = rs.getString(2);
				ids[i] = rs.getString(2);
				content[i] = rs.getString(2);
				date[i] = rs.getDate(2);
				System.out.println(images[i]);
				
				
				i++;
			}
			psmt.close();
			conn.close();
			
			if(images.length == 0)
				images[0] = "https://item.kakaocdn.net/do/9c5d673c91e8f1080c2602931c81f178f43ad912ad8dd55b04db6a64cddaf76d";
		} catch (Exception e) {
			e.printStackTrace();
		}

		
		return images;
		
	}	
	public Map timelines() {
	
		Map map = new HashMap();
		String[] images = new String[1];
		String[] ids = new String[1];
		Date[] created_at = new Date[1];
		String[] content = new String[1];
	String cntSql = "SELECT COUNT(*) FROM timeline where id='가라아이디'"; // 배열 선언함
	String sql = "SELECT * FROM timeline WHERE id='가라아이디' ORDER BY timeline_no asc"; // 사진긁어옴
	
	int i = 0;
	try {
		psmt = conn.prepareStatement(cntSql);
		rs = psmt.executeQuery();
		rs.next();
		int columnCount = rs.getInt(1);
	
		psmt.close();
		
		
		psmt = conn.prepareStatement(sql);
		rs = psmt.executeQuery();
	
		System.out.println(columnCount);
		if(columnCount != 0) {
			images = new String[columnCount]; 
			ids = new String[columnCount]; 
			content = new String[columnCount]; 
			created_at = new Date[columnCount];
			
		}
		
		while (rs.next()) {
			content[i] = rs.getString(2);
			ids[i] = rs.getString(5);
			created_at[i] = rs.getDate(4);
			images[i] = rs.getString(3);
			System.out.println(images[i]);
			i++;
		}
		psmt.close();
		conn.close();
		
		if(images.length == 0)
			images[0] = "https://item.kakaocdn.net/do/9c5d673c91e8f1080c2602931c81f178f43ad912ad8dd55b04db6a64cddaf76d";
	} catch (Exception e) {
		e.printStackTrace();
	}
	map.put("images", images);
	map.put("ids", ids);
	map.put("content", content);
	map.put("date", created_at);

	
	return map;
	}

}
