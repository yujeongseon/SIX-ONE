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

import org.springframework.web.context.request.SessionScope;


public class RoutineDAO {

   private Connection conn;
   private ResultSet rs;
   private ResultSet rs2;
   private ResultSet rs3;
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
   
   public List<RoutineDTO> selectList(Map map,String id){
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
            List<RoutineDTO> rou = new Vector<RoutineDTO>();
            
            dto.setRoutine_no(rs.getString(1));
            dto.setId(rs.getString(4));
            dto.setCreate_at(rs.getDate(3));
            dto.setRoutine_name(rs.getString(2));
            dto.setName(rs.getString(5));
            
            String a= rs.getString(1);
            System.out.println("a를뿌려보자"+a);
            String sql2="SELECT e.exercise_name,r.goal_count,r.goal_set,r.routine_days FROM rou_exe r JOIN exercise e ON r.exercise_no = e.exercise_no  WHERE routine_no=? order by routine_days";
            try {
               psmt = conn.prepareStatement(sql2);
               psmt.setString(1, a);
               rs2= psmt.executeQuery();
               while(rs2.next()) {
              	 RoutineDTO dto2=new RoutineDTO();
                  dto2.setExe_no(rs2.getString(1));
                  dto2.setCount(rs2.getString(2));
                  dto2.setSet(rs2.getString(3));
                  dto2.setDays(rs2.getString(4));
                  rou.add(dto2);
               }
            } catch (Exception e) {e.printStackTrace();}
            dto.setList(rou);
            Boolean TF=gudokok(a,id);
            dto.setGudok(TF);
            
            list.add(dto);
         }
      }
      catch (SQLException e) {e.printStackTrace();}
      return list;
   }//////////selectList()
   
   public boolean gudokok(String no,String id) {
	   boolean gudok= false;
	   String sql3="SELECT * FROM subscribe WHERE routine_no=? and id LIKE ?";
	   try {
			psmt = conn.prepareStatement(sql3);
			psmt.setString(1, no);
			psmt.setString(2, id);
			rs3 = psmt.executeQuery();
			if(rs3.next()) {
				gudok=true;
				return gudok;
			}
		}
		catch (Exception e) {e.printStackTrace();}
	   
	   return gudok;
   }
   
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
   
   public int gudokin(String no,String id) {
	   int affected =0;
	   String sql="INSERT INTO subscribe VALUES(SEQ_SUBSCRIBE.nextval,?,?)";
	   try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, no);
			psmt.setString(2, id);
			affected=psmt.executeUpdate();	
			System.out.println("구독완료");
		} catch (Exception e) {e.printStackTrace();}
		return affected;
   }
   
   public int gudokout(String no,String id) {
	   int affected =0;
	   String sql="DELETE FROM subscribe WHERE routine_no=? and id LIKE ?";
	   try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, no);
			psmt.setString(2, id);
			affected=psmt.executeUpdate();	
			System.out.println("구독취소");
		} catch (Exception e) {e.printStackTrace();}
		return affected;
   }
   
   
   
   
   
   
   
}