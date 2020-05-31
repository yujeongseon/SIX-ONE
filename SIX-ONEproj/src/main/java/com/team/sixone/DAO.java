package com.team.sixone;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;

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
	
	
	
	public String[] test() {
	
///asd
	String[] images = null;
	String cntSql = "SELECT COUNT(*) FROM test"; // 배열 선언함
	String sql = "SELECT * FROM test ORDER BY no asc"; // 사진긁어옴
	
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
		images = new String[columnCount]; 
		
		while (rs.next()) {
			images[i] = rs.getString(2);
			System.out.println(images[i]);
			i++;
		}
	} catch (Exception e) {
		e.printStackTrace();
	}
	return images;
	}

}
