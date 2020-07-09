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
	private ResultSet rs2;
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
	 //전체 루틴게시글
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
	 //전체 루틴게시글
	   public int getexehap() {
		   String sql="SELECT count(*) FROM rou_exe";
		   int hap=0;
		   try {
				psmt = conn.prepareStatement(sql);
				rs = psmt.executeQuery();
				if(rs.next())hap=rs.getInt(1);
				
			}
			catch (Exception e) {e.printStackTrace();}
		   
		   return hap;
	   }
	   
	 //많이 적힌 운동순
	   public List exerank() {
	   List list = new ArrayList();
	   String sql="select e.exercise_name,a.count from (select exercise_no, count(*) count from rou_exe GROUP BY exercise_no) a JOIN exercise e on a.exercise_no=e.exercise_no order by count desc";
	   int i=0;
	   try {
			psmt = conn.prepareStatement(sql);
			rs = psmt.executeQuery();
			while(rs.next()) {
				if(i==5) break;
				list.add(rs.getString(1));
				list.add(rs.getInt(2));
				i++;
			}
		}
		catch (Exception e) {e.printStackTrace();}
	   
	   return list;
   }
	   
	 //전체 타임라인
	   public Map gettimeline() {
		   Map map = new HashMap();
		   
		   String sql="SELECT count(*) FROM timeline";
		   try {
				psmt = conn.prepareStatement(sql);
				rs = psmt.executeQuery();
				if(rs.next()) {
					map.put("timelinehap", rs.getInt(1));
				}
			}
			catch (Exception e) {e.printStackTrace();}
		   
		   return map;
	   }
	
	//월별 가입자
	   public Map member_month() {
		   Map map = new HashMap();
		   String sql="SELECT to_char(create_at,'YYYY-MM')as create_at,count(*) as count FROM member group by to_char(create_at, 'YYYY-MM') order by create_at";
		   try {
				psmt = conn.prepareStatement(sql);
				rs = psmt.executeQuery();
				while(rs.next()) {
					map.put(rs.getString(1),rs.getInt(2));
				}
			}
			catch (Exception e) {e.printStackTrace();}
		   return map;
	   }
	   
	   //월별 타임라인
	   public Map timeline_month() {
		   Map map = new HashMap();
		   String sql="SELECT to_char(created_at,'YYYY-MM')as create_at,count(*) as count FROM timeline group by to_char(created_at, 'YYYY-MM') order by create_at";
		   try {
				psmt = conn.prepareStatement(sql);
				rs = psmt.executeQuery();
				while(rs.next()) {
					map.put(rs.getString(1),rs.getInt(2));
				}
			}
			catch (Exception e) {e.printStackTrace();}
		   return map;
	   }
	   
	   //월별 루틴
	   public Map routine_month() {
		   Map map = new HashMap();
		   String sql="SELECT to_char(create_at,'YYYY-MM')as create_at,count(*) as count FROM routine group by to_char(create_at, 'YYYY-MM') order by create_at";
		   try {
				psmt = conn.prepareStatement(sql);
				rs = psmt.executeQuery();
				while(rs.next()) {
					map.put(rs.getString(1),rs.getInt(2));
				}
			}
			catch (Exception e) {e.printStackTrace();}
		   return map;
	   }
	   
	 //회원가입 경로
	   public Map member_path() {
		   Map map = new HashMap();
		   
		   String sql="select count(*) from member where id like '%naver%'";
		   try {
				psmt = conn.prepareStatement(sql);
				rs = psmt.executeQuery();
				if(rs.next()) {
					map.put("naver", rs.getInt(1));
				}
			}
			catch (Exception e) {e.printStackTrace();}
		   sql="select count(*) from member where id like '1%' or id like'2%' or id like'3%'or id like'4%'or id like'5%'or id like'6%'or id like'7%'or id like'8%'or id like'9%'or id like'0%'";
		   try {
				psmt = conn.prepareStatement(sql);
				rs = psmt.executeQuery();
				if(rs.next()) {
					map.put("kakao", rs.getInt(1));
				}
			}
			catch (Exception e) {e.printStackTrace();}
		   return map;
	   }
	   
	   public List<AdminMemberDTO> selectmember(Map map){
			List<AdminMemberDTO> list = new Vector<AdminMemberDTO>();
			
			String sql="SELECT id,name,profile,gender,TO_CHAR(create_at, 'YYYY-MM-DD') as create_at FROM member";
			try {
				psmt = conn.prepareStatement(sql);
				rs=psmt.executeQuery();
				while(rs.next()) {
					AdminMemberDTO dto = new AdminMemberDTO();
					dto.setId(rs.getString(1));
					dto.setName(rs.getString(2));
					dto.setCreate_at(rs.getString(5));
					dto.setProfile(rs.getString(3));
					dto.setGender(rs.getString(4));			
					list.add(dto);
				}
			}
			catch (SQLException e) {e.printStackTrace();}
			return list;
		}//////////selectmember()
	   
	public List<AdminMemberDTO> selectOne(String id) {
		List<AdminMemberDTO> list = new Vector<AdminMemberDTO>();
		AdminMemberDTO dto=new AdminMemberDTO();
		String sql="SELECT id,name,profile,gender,TO_CHAR(create_at, 'YYYY-MM-DD') as create_at FROM member where id like ?";
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, id);
			rs=psmt.executeQuery();
			if(rs.next()) {
				dto.setId(rs.getString(1));
				dto.setName(rs.getString(2));
				dto.setProfile(rs.getString(3));
				dto.setGender(rs.getString(4));
				dto.setCreate_at(rs.getString(5));
			}
		}
		catch (SQLException e) {e.printStackTrace();}
		
		sql="SELECT count(*) FROM timeline where id like ?";
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, id);
			rs=psmt.executeQuery();
			if(rs.next()) {
				dto.setTimelinecount(rs.getString(1));
			}
		}
		catch (SQLException e) {e.printStackTrace();}
		
		sql="SELECT count(*) FROM timeline_comments where id like ?";
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, id);
			rs=psmt.executeQuery();
			if(rs.next()) {
				dto.setCommentcount(rs.getString(1));
			}
		}
		catch (SQLException e) {e.printStackTrace();}
		sql="SELECT count(*) FROM routine where id like ?";
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, id);
			rs=psmt.executeQuery();
			if(rs.next()) {
				dto.setRoutinecount(rs.getString(1));
				list.add(dto);
			}
		}
		catch (SQLException e) {e.printStackTrace();}
		return list;
	}
	
	
	
	
}
