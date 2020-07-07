package com.team.sixone;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Vector;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.servlet.ServletContext;
import javax.sql.DataSource;

import org.apache.commons.collections.map.HashedMap;


public class AdminDAO {

	private Connection conn;
	private ResultSet rs;
	private PreparedStatement psmt;
	//[생성자]
	public AdminDAO(ServletContext context) {
		try {
			Context ctx=new InitialContext();
		DataSource source =(DataSource)ctx.lookup("java:comp/env/sixone");
		conn =  source.getConnection();
		} catch(Exception e) {
			e.printStackTrace();
		}
	}//////////DAO
	
	//닫기
	public void close() {
	      try {
	         if(rs !=null) rs.close();
	         if(psmt !=null) psmt.close();
	         if(conn !=null) conn.close();
	      }catch(SQLException e) {e.printStackTrace();}
	   }//////////close
	
	//성별 별 회원
	   public Map getmember() {
		   Map map = new HashMap();
		   String gender;
		   int i=1;
		   String sql="SELECT count(*) FROM member GROUP BY gender";
		   try {
				psmt = conn.prepareStatement(sql);
				rs = psmt.executeQuery();
				while(rs.next()) {
					if(i==1) map.put("man", rs.getInt(1));
					else map.put("woman", rs.getInt(1));
					i++;
				}
			}
			catch (Exception e) {e.printStackTrace();}
		   
		   return map;
	   }
	 //전체 게시글
	   public Map getroutine() {
		   Map map = new HashMap();
		   
		   String sql="SELECT count(*) FROM routine";
		   try {
				psmt = conn.prepareStatement(sql);
				rs = psmt.executeQuery();
				if(rs.next()) {
					map.put("routinehap", rs.getInt(1));
				}
			}
			catch (Exception e) {e.printStackTrace();}
		   
		   return map;
	   }
	
	
	
	
	
	
	
	
}
