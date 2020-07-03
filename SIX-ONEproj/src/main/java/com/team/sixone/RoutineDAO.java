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
   
   /* 
SELECT * FROM (SELECT T.*,ROWNUM R FROM (select * from (select routine_no,count(*) count from subscribe group by routine_no order by count desc) a right outer join (SELECT r.*,name FROM routine r JOIN member m ON r.id=m.id) b on a.routine_no = b.routine_no order by create_at desc) T) WHERE R BETWEEN 1 AND 10;
    */
   
   
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
            String sql2="SELECT e.exercise_name,r.goal_count,r.goal_set,r.routine_days,exercise_motions FROM rou_exe r JOIN exercise e ON r.exercise_no = e.exercise_no  WHERE routine_no=? order by routine_days";
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
                  dto2.setExercise_motions(rs2.getString(5));
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
   
   
   /* 구독자순 쿼리
    * SELECT * FROM (SELECT T.*,ROWNUM R FROM (select * from (select routine_no,count(*) count from subscribe group by routine_no order by count desc) a join (SELECT r.*,name FROM routine r JOIN member m ON r.id=m.id) b on a.routine_no = b.routine_no ORDER BY count DESC) T) WHERE R BETWEEN 1 AND 5;
    */
   //구독자 높은순 정렬
   public List<RoutineDTO> gudokupList(Map map,String id){
	      List<RoutineDTO> list = new Vector<RoutineDTO>();
	      //페이징 적용-구간쿼리로 변경
	      String sql="SELECT * FROM (SELECT T.*,ROWNUM R FROM (select * from (select routine_no,count(*) count from subscribe group by routine_no order by count desc) a join (SELECT r.*,name FROM routine r JOIN member m ON r.id=m.id) b on a.routine_no = b.routine_no ";
	      if(map.get("searchWord")!=null) {
	         sql+=" WHERE "+map.get("searchColumn")+" LIKE '%"+map.get("searchWord")+"%' ";
	      }      
	      sql+=" ORDER BY count DESC) T) WHERE R BETWEEN ? AND ?";
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
	            dto.setCount(rs.getString(2));
	            dto.setId(rs.getString(6));
	            dto.setCreate_at(rs.getDate(5));
	            dto.setRoutine_name(rs.getString(4));
	            dto.setName(rs.getString(7));
	            
	            //루틴 글 번호 변수 a지정
	            String a= rs.getString(1);
	            String sql2="SELECT e.exercise_name,r.goal_count,r.goal_set,r.routine_days,exercise_motions FROM rou_exe r JOIN exercise e ON r.exercise_no = e.exercise_no  WHERE routine_no=? order by routine_days";
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
	                  dto2.setExercise_motions(rs2.getString(5));
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
	   }//////////구독자 높은 순 정렬
   
   
   
   
   public List<RoutineDTO> selectone(String no){
	      List<RoutineDTO> list = new Vector<RoutineDTO>();
	      String sql="SELECT e.exercise_name,r.goal_count,r.goal_set,r.routine_days,exercise_motions FROM rou_exe r JOIN exercise e ON r.exercise_no = e.exercise_no  WHERE routine_no=? order by routine_days";
          try {
             psmt = conn.prepareStatement(sql);
             psmt.setString(1, no);
             rs2= psmt.executeQuery();
             while(rs2.next()) {
            	 RoutineDTO dto2=new RoutineDTO();
                dto2.setExe_no(rs2.getString(1));
                dto2.setCount(rs2.getString(2));
                dto2.setSet(rs2.getString(3));
                dto2.setDays(rs2.getString(4));
                dto2.setExercise_motions(rs2.getString(5));
                list.add(dto2);
             }
          } catch (Exception e) {e.printStackTrace();}
	      return list;
   }
   
   
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
   
   //운동아이콘 받기
   public String geticon(String name) {
	   String icon="";
	   String sql3="SELECT exercise_motions FROM exercise WHERE exercise_name LIKE ?";
	   try {
			psmt = conn.prepareStatement(sql3);
			psmt.setString(1, name);
			rs3 = psmt.executeQuery();
			if(rs3.next()) {
				icon=rs3.getString(1);
			}
		}
		catch (Exception e) {e.printStackTrace();}
	   
	   return icon;
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
   
   //작성한 루틴 삭제
   public void deleterou(int no) {
	   String sql="DELETE FROM routine WHERE routine_no like ?";
	   try {
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, no);
			psmt.executeUpdate();	
			System.out.println("루틴삭제완료");
		} catch (Exception e) {e.printStackTrace();}
   }
   
   public void deletesub(int no) {
	   String sql="DELETE FROM subscribe WHERE routine_no like ?";
	   try {
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, no);
			psmt.executeUpdate();	
			System.out.println("루틴에 구독된것 삭제완료");
		} catch (Exception e) {e.printStackTrace();}
   }
   
   //루틴_exe삭제
   public void deleterouagain(int no) {
	   String sql="DELETE FROM rou_exe WHERE routine_no like ?";
	   try {
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, no);
			psmt.executeUpdate();	
			System.out.println("루틴수정을 위한 삭제번호"+no);
		} catch (Exception e) {e.printStackTrace();}
   }
   
   public void writerou(String title,String id) {
	   String sql="INSERT INTO routine VALUES(SEQ_ROUTINE.nextval,?,sysdate,?)";
	   try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, title);
			psmt.setString(2, id);
			psmt.executeUpdate();	
			System.out.println("루틴입력완료");
		} catch (Exception e) {e.printStackTrace();}
   }
   
   public void writeroudetail(String exename,String roucount,String rouset,int days) {
	   String sql4="Insert into rou_exe values((select exercise_no from exercise where exercise_name like ?),(select MAX(routine_no) from routine),?,?,?)";
	   try {
			psmt = conn.prepareStatement(sql4);
			psmt.setString(1, exename);
			psmt.setString(2, roucount);
			psmt.setString(3, rouset);
			psmt.setInt(4, days);
			psmt.executeUpdate();
			System.out.println("루틴상세정보입력완료");
		} catch (Exception e) {e.printStackTrace();}
   }
   public void writerouagain(String exename,String roucount,String rouset,int days,int no) {
	   String sql="Insert into rou_exe values((select exercise_no from exercise where exercise_name like ?),?,?,?,?)";
	   try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, exename);
			psmt.setInt(2, no);
			psmt.setString(3, roucount);
			psmt.setString(4, rouset);
			psmt.setInt(5, days);
			psmt.executeUpdate();
			System.out.println("루틴상세정보입력완료");
		} catch (Exception e) {e.printStackTrace();}
   }
   
   
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