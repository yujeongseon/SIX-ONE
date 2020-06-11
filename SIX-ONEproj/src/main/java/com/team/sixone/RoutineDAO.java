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
import javax.servlet.ServletContext;
import javax.sql.DataSource;

public class RoutineDAO {

	private Connection conn;
	private ResultSet rs;
	private PreparedStatement psmt;
	//[생성자]
	public RoutineDAO(ServletContext context) {
	//커넥션 풀 사용하기
	System.out.println("루틴ao");
		try {
			Context ctx=new InitialContext();
			DataSource source =(DataSource)ctx.lookup("java:comp/env/sixone");
			conn =  source.getConnection();
			} catch(Exception e) {
					e.printStackTrace();
		}
	}//////RoutineDAO
	
	public void close() {
		try {
			if(rs !=null) rs.close();
			if(psmt !=null) psmt.close();
			if(conn !=null) conn.close();
		}catch(SQLException e) {e.printStackTrace();}
	}//////////close
	
	public List<RoutineDTO> selectList(Map map){
		List<RoutineDTO> list = new Vector<RoutineDTO>();
		
		//페이징 적용-구간쿼리로 변경
		String sql="SELECT * FROM (SELECT T.*,ROWNUM R FROM (SELECT r.*,name FROM routine r JOIN member m ON r.id=m.id ";
		if(map.get("searchWord")!=null) {
			sql+=" WHERE "+map.get("searchColumn")+" LIKE '%"+map.get("searchWord")+"%' ";
		}		
		sql+=" ORDER BY routine_no DESC) T) WHERE R BETWEEN ? AND ?";
		
		
		try {
			psmt = conn.prepareStatement(sql);
			//페이징을 위한 시작 및 종료 rownum설정]
			psmt.setString(1, map.get("start").toString());
			psmt.setString(2, map.get("end").toString());
			rs=psmt.executeQuery();
			while(rs.next()) {
				RoutineDTO dto = new RoutineDTO();
				dto.setRoutine_no(rs.getString(1));
				dto.setId(rs.getString(4));
				dto.setCreate_at(rs.getDate(3));
				dto.setRoutine_name(rs.getString(2));
				dto.setName(rs.getString(5));
				list.add(dto);
			}
		}
		catch (SQLException e) {e.printStackTrace();}
		return list;
	}//////////selectList()
	
	public List<Rou_exeDTO> selectone(String no) {
		List<Rou_exeDTO> list = new Vector<Rou_exeDTO>();
		System.out.println("no값"+no);
		String sql="SELECT * FROM rou_exe WHERE routine_no=? order by routine_days";
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, no);
			rs= psmt.executeQuery();
			while(rs.next()) {
				Rou_exeDTO dto=new Rou_exeDTO();
				dto.setExe_no(rs.getString(2));
				dto.setCount(rs.getString(4));
				dto.setSet(rs.getString(5));
				dto.setDays(rs.getString(6));
				list.add(dto);
			}
		} catch (Exception e) {e.printStackTrace();}
		return list;
	}///////////selectOne
	
	public int getTotalRowCount(Map map) {
	int totalRowCount=0;
	String sql="SELECT COUNT(*) FROM routine r JOIN member m ON m.id=r.id ";
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
	
	
	
	
	
	
	
	
	
}
