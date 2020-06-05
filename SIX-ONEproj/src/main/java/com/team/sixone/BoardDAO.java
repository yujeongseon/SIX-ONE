package com.team.sixone;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;
import java.util.Vector;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;







public class BoardDAO {

	//[멤버변수]
		private Connection conn;
		private ResultSet rs;
		private PreparedStatement psmt;
		//[생성자]
		public BoardDAO(ServletContext context) {
			//커넥션 풀 사용하기
			System.out.println("좀 떠라");
			try {
				Context ctx=new InitialContext();
			DataSource source =(DataSource)ctx.lookup("java:comp/env/sixone");
			conn =  source.getConnection();
			} catch(Exception e) {
				e.printStackTrace();
			}
			/*try {
				
				//드라이버 로딩]
				Class.forName(context.getInitParameter("ORACLE_DRIVER"));
				//데이타베이스 연결]
				conn = DriverManager.getConnection(context.getInitParameter("ORACLE_URL"),"JSP","JSP");
				
			}
			catch(ClassNotFoundException | SQLException e) {
				e.printStackTrace();
			}*/
		}//////////DAO
		
		
		public void close() {
			try {
				if(rs !=null) rs.close();
				if(psmt !=null) psmt.close();
				if(conn !=null) conn.close();
			}catch(SQLException e) {e.printStackTrace();}
		}//////////close
		
		
		
		public List<BoardDTO> selectList(Map map){
			List<BoardDTO> list = new Vector<BoardDTO>();
			//페이징 적용 前 쿼리- 전체 쿼리
			/*
			String sql="SELECT b.*,name FROM bbs b JOIN member m ON b.id=m.id ";
			if(map.get("keyword")!=null) {
				sql+=" WHERE "+map.get("columnName")+" LIKE '%"+map.get("keyword")+"%' ";
			}
			sql+=" ORDER BY no DESC";
			*/
			//페이징 적용-구간쿼리로 변경
			String sql="SELECT * FROM (SELECT T.*,ROWNUM R FROM (SELECT b.*,name FROM board b JOIN member m ON b.id=m.id ";
			if(map.get("searchWord")!=null) {
				sql+=" WHERE "+map.get("searchColumn")+" LIKE '%"+map.get("searchWord")+"%' ";
			}		
			sql+=" ORDER BY board_no DESC) T) WHERE R BETWEEN ? AND ?";
			
			
			try {
				psmt = conn.prepareStatement(sql);
				//페이징을 위한 시작 및 종료 rownum설정]
				psmt.setString(1, map.get("start").toString());
				psmt.setString(2, map.get("end").toString());
				rs=psmt.executeQuery();
				while(rs.next()) {
					BoardDTO dto = new BoardDTO();
					dto.setContent(rs.getString(3));
					dto.setId(rs.getString(7));
					dto.setBoard_no(rs.getString(1));
					dto.setCreate_at(rs.getDate(4));
					dto.setTitle(rs.getString(2));
					dto.setCategory(rs.getString(6));
					dto.setImage_name(rs.getString(5));
					dto.setVisitcount(rs.getString(8));
					dto.setName(rs.getString(9));				
					list.add(dto);
				}
			}
			catch (SQLException e) {e.printStackTrace();}
			
			return list;
		}//////////selectList()
		
		public int Count(int count,String no) {
			int affected=0;
			
			String sql="UPDATE board SET visitcount=? WHERE board_no=?";
			try {
				psmt=conn.prepareStatement(sql);
				psmt.setInt(1, count);
				psmt.setString(2, no);
				
				affected=psmt.executeUpdate();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			return affected;
		}
		
		public BoardDTO selectone(String no) {
			BoardDTO dto=null;
			String sql="SELECT * FROM board WHERE board_no=?";
			try {
				psmt = conn.prepareStatement(sql);
				psmt.setString(1, no);
				rs= psmt.executeQuery();
				if(rs.next()) {
					dto = new BoardDTO();
					dto.setBoard_no(rs.getString(1));
					dto.setId(rs.getString(7));
					dto.setTitle(rs.getString(2));
					dto.setContent(rs.getString(3));
					dto.setImage_name(rs.getString(5));
					int count= rs.getInt(8);
					count++;
					Count(count, no);
					dto.setVisitcount(rs.getString(8));
					dto.setCreate_at(rs.getDate(4));
				}
			} catch (Exception e) {e.printStackTrace();}
			return dto;
		}///////////selectOne
	
		
		
		//총 레코드 수 얻기용]
		public int getTotalRowCount(Map map) {
			
			int totalRowCount=0;
			String sql="SELECT COUNT(*) FROM board b JOIN member m ON m.id=b.id ";
			//검색시 아래 쿼리문 연결
			if(map.get("searchWord")!=null) {
				sql+=" WHERE "+map.get("searchColumn")+" LIKE '%"+map.get("searchWord")+"%' ";
			}	
			try {
				psmt = conn.prepareStatement(sql);
				rs = psmt.executeQuery();
				rs.next();
				totalRowCount = rs.getInt(1);
			} 
			catch (SQLException e) {e.printStackTrace();}
			
			return totalRowCount;	
			
		}//getTotalRowCount	
		
		//글쓰기
		public int write(Map map) {///글쓰기
			int affected = 0;
			String sql="INSERT INTO board VALUES(SEQ_BOARD.nextval,?,?,sysdate,?,?,?,'0')";
			try {
				psmt = conn.prepareStatement(sql);
				psmt.setString(1, map.get("title").toString());
				psmt.setString(2, map.get("content").toString());
				psmt.setString(3, map.get("fileup").toString());//사진명
				psmt.setString(4,map.get("category").toString());//카테고리
				psmt.setString(5, map.get("id").toString());
				affected=psmt.executeUpdate();	
			} catch (Exception e) {e.printStackTrace();}
			return affected;
		}//////////글쓰기
		
		public int update(Map map) {///글쓰기
			int affected = 0;
			String sql="INSERT INTO board VALUES(SEQ_BOARD.nextval,?,?,sysdate,?,?,?,'0')";
			try {
				psmt = conn.prepareStatement(sql);
				psmt.setString(1, map.get("title").toString());
				psmt.setString(2, map.get("content").toString());
				psmt.setString(3, map.get("fileup").toString());//사진명
				psmt.setString(4,map.get("category").toString());//카테고리
				psmt.setString(5, map.get("id").toString());
				affected=psmt.executeUpdate();	
			} catch (SQLException e) {e.printStackTrace();}
			return affected;
		}//////////글쓰기
		
		
		
		
		
		
		
		
		
		
		
	
}
