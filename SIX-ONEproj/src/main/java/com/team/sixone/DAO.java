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

   public int uploadtest(String filename, String content, String id) {
      int upd;
      String sql = "insert into timeline values(SEQ_TIMELINE.nextval,'" + content + "', '" + filename
            + "', sysdate, '" + id + "')";
      System.out.println(filename);

      try {
         psmt = conn.prepareStatement(sql);
         upd = psmt.executeUpdate();

         psmt.close();
         conn.close();

      } catch (Exception e) {
         e.printStackTrace();
         upd = 0;
      }

      return upd;
   }
/*
 * String cntSql = "SELECT COUNT(*) FROM timeline WHERE IMAGE_NAME LIKE '%s%'"; // 배열 선언함
      String sql = "SELECT * FROM timeline WHERE IMAGE_NAME LIKE '%s%'"; // 사진긁어옴
 */
   public Map Search(String searchWord) {
      // 라이크 사용

      Map map = new HashMap();
      String[] nos = new String[1];
      String[] images = new String[1];
      String[] ids = new String[1];
      Date[] created_at = new Date[1];
      String[] content = new String[1];
      String[] comcnt = new String[1];
      String[] firid = new String[1];
      String[] fircom = new String[1];
      
      String sql = "SELECT timeline.*, (SELECT COUNT(*) FROM timeline_comments WHERE timeline_no= timeline.timeline_no and id like '%"+searchWord+"%')AS comcnt, (SELECT content FROM timeline_comments WHERE timeline_no=timeline.timeline_no AND comments_no = (select max(comments_no) from timeline_comments where timeline_no = timeline.timeline_no and id like '%"+searchWord+"%') ) AS firstcontent, (SELECT id FROM timeline_comments WHERE timeline_no=timeline.timeline_no AND comments_no = (select max(comments_no) from timeline_comments where timeline_no = timeline.timeline_no and id like '%"+searchWord+"%')) AS firstid FROM timeline  ORDER BY timeline_no DESC";
      
      
      
      String cntSql = "SELECT COUNT(*) FROM timeline WHERE ID LIKE '%"+searchWord+"%'"; // 배열 선언함
      //String sql = "SELECT * FROM timeline WHERE CONTENT LIKE '%"+searchWord+"%'"; // 사진긁어옴
      //String commentcnt = "SELECT COUNT(*) FROM timeline_comments where timeline_no=?";
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
         if (columnCount != 0) {
            nos = new String[columnCount];
            images = new String[columnCount];
            ids = new String[columnCount];
            content = new String[columnCount];
            created_at = new Date[columnCount];
            comcnt = new String[columnCount];
            firid = new String[columnCount];
            fircom = new String[columnCount];

         }

         while (rs.next()) {
            nos[i] = rs.getString(1);
            content[i] = rs.getString(2);
            ids[i] = rs.getString(5);
            created_at[i] = rs.getDate(4);
            images[i] = rs.getString(3);
            comcnt[i] = rs.getString(6);
            if(rs.getString(8) == null) {
               fircom[i] = "없습니다";
               firid[i] = "댓글이";
            }
            else {
            fircom[i] = rs.getString(7);
            firid[i] = rs.getString(8);
            }
            System.out.println(images[i]);
            i++;
         }
         psmt.close();
         conn.close();

         if (images[0] == null)
            images[0] = "https://www.loud.kr/hive/template/LOUD_IMG/portfolio2018/notfound_m.jpg";
      } catch (Exception e) {
         e.printStackTrace();
      }
      map.put("images", images);
      map.put("ids", ids);
      map.put("content", content);
      map.put("date", created_at);
      map.put("nos", nos);
      map.put("comcnt", comcnt);
      map.put("firid", firid);
      map.put("fircom", fircom);

      /*
       * 
       * TIMELINE_NO CONTENT IMAGE_NAME CREATED_ ID
       * 
       */
      return map;
   }

   public int tlcomment(String id, String comment, String timeline_no) {
      /*
       * COMMENTS_NO CONTENT ID TIMELINE_NO
       */
      int upd = 0;
      String sql = "insert into timeline_comments values(SEQ_TIMELINE_COMMENTS.nextval, ?, ?, ?)";

      try {
         psmt = conn.prepareStatement(sql);
         psmt.setString(1, comment);
         psmt.setString(2, id);
         psmt.setString(3, timeline_no);
         upd = psmt.executeUpdate();
         System.out.println("댓글입력 영향받은개수 " + upd);

         psmt.close();
         conn.close();

      } catch (Exception e) {
         e.printStackTrace();
         upd = 0;
      }

      return upd;

   }

   public Map timelines() {

      Map map = new HashMap();
      String[] nos = new String[1];
      String[] images = new String[1];
      String[] ids = new String[1];
      Date[] created_at = new Date[1];
      String[] content = new String[1];
      String[] comcnt = new String[1];
      String[] firid = new String[1];
      String[] fircom = new String[1];
      String[] likes = new String[1];
      String[] profile = new String[1];
      String[] name = new String[1];
      String cntSql = "SELECT COUNT(*) FROM timeline "/* where id='id'" */; // 배열 선언함
      //비상용 sql
      //sql = "SELECT timeline.*, (SELECT COUNT(*) FROM timeline_comments WHERE timeline_no= timeline.timeline_no)AS comcnt, (SELECT content FROM timeline_comments WHERE rownum=1 AND timeline_no=timeline.timeline_no)AS firstcontent, (SELECT id FROM timeline_comments WHERE rownum=1 AND timeline_no=timeline.timeline_no)AS firstid  FROM timeline  ORDER BY timeline_no DESC";
      String sql = "SELECT timeline.*,(SELECT COUNT(*) FROM timeline_comments WHERE timeline_no= timeline.timeline_no)AS comcnt,\r\n" + 
        		"(SELECT content FROM timeline_comments  WHERE timeline_no=timeline.timeline_no AND comments_no = (select max(comments_no)  from timeline_comments where timeline_no = timeline.timeline_no) ) AS firstcontent,\r\n" + 
        		"(SELECT id FROM timeline_comments WHERE timeline_no=timeline.timeline_no AND comments_no = (select max(comments_no)  from timeline_comments where timeline_no = timeline.timeline_no)) AS firstid,\r\n" + 
        		"(select COUNT(DISTINCT id) from timeline_like where timeline_no = timeline.timeline_no) as tlgood,m.profile, m.name\r\n" + 
        		"FROM timeline timeline join member m on timeline.id = m.id ORDER BY timeline_no DESC";
      
      //String commentcnt = "SELECT COUNT(*) FROM timeline_comments where timeline_no=?";
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
         if (columnCount != 0) {
            nos = new String[columnCount];
            images = new String[columnCount];
            ids = new String[columnCount];
            content = new String[columnCount];
            created_at = new Date[columnCount];
            comcnt = new String[columnCount];
            firid = new String[columnCount];
            fircom = new String[columnCount];
            likes = new String[columnCount];
            profile = new String[columnCount];
            name = new String[columnCount];
            
         }

         while (rs.next()) {
            nos[i] = rs.getString(1);
            content[i] = rs.getString(2);
            ids[i] = rs.getString(5);
            created_at[i] = rs.getDate(4);
            images[i] = rs.getString(3);
            comcnt[i] = rs.getString(6);
            profile[i] = rs.getString(10);
            name[i] = rs.getString(11);
            if(rs.getString(8) == null) {
               fircom[i] = "없습니다";
               firid[i] = "댓글이";
            }
            else {
            fircom[i] = rs.getString(7);
            firid[i] = rs.getString(8);
            }
            likes[i] = rs.getString(9);
           
            i++;
         }
         psmt.close();
         conn.close();

         if (images.length == 1) {
            images[0] = "https://www.loud.kr/hive/template/LOUD_IMG/portfolio2018/notfound_m.jpg";
            ids[0] = "";
            content[0] = "<h1>타임라인을 불러올수 없습니다</h1>";
            }
      } catch (Exception e) {
         e.printStackTrace();
      }
      map.put("images", images);
      map.put("ids", ids);
      map.put("content", content);
      map.put("date", created_at);
      map.put("nos", nos);
      map.put("comcnt", comcnt);
      map.put("firid", firid);
      map.put("fircom", fircom);
      map.put("likes", likes);
      map.put("profile", profile);
      map.put("name", name);

      /*
       * 
       * TIMELINE_NO CONTENT IMAGE_NAME CREATED_ ID
       * 
       */
      return map;
   }

   public int delTL(String imagename) {

      String nosc = "select timeline_no from timeline where image_name=?";// 타임라인넘버찾기

      String sql = "delete timeline where image_name=?";

      try {
         psmt = conn.prepareStatement(nosc);
         psmt.setString(1, imagename);
         rs = psmt.executeQuery();
         rs.next();
         String no = rs.getString(1);
         System.out.println("no = " + no);

         psmt.close();

         String sqlcomdel = "delete timeline_comments where timeline_no = ?";
         psmt = conn.prepareStatement(sqlcomdel);
         psmt.setString(1, no);
         psmt.executeUpdate();
         psmt.close();

         psmt = conn.prepareStatement(sql);
         psmt.setString(1, imagename);

         int del = psmt.executeUpdate();
         System.out.println("영향받은 행수 : " + del);

         psmt.close();
         conn.close();

      } catch (Exception e) {
         e.printStackTrace();
      }

      return 0;
   }

   public Map replys(String tlno) {

      /*
       * comments_no number NOT NULL, content nvarchar2(200), id varchar2(20) NOT
       * NULL, timeline_no number NOT NULL,
       */
      Map map = new HashMap();
      String[] comid = new String[1]; // 코멘트 넘버
      String[] comment = new String[1]; // 댓글
      String[] id = new String[1]; // 댓글단사람 아이디
   //   String[] tlno = new String[1]; // 타임라인 넘버

      /*
       * 필요한거 : 어디다 댓글달았는지, 댓글단 아이디, 코멘트, 수정삭제용 코멘트아이디
       */

      String cntSql = "SELECT COUNT(*) FROM timeline_comments where timeline_no=?"; // 배열 선언함
      String sql = "SELECT * FROM timeline_comments where timeline_no=? ORDER BY comments_no asc"; //

      int i = 0;
      try {
         psmt = conn.prepareStatement(cntSql);
         psmt.setString(1, tlno);
         rs = psmt.executeQuery();
         rs.next();
         int columnCount = rs.getInt(1);
         comment = new String[columnCount];
         id = new String[columnCount];
         
         
         
         System.out.println("댓글 개수" + columnCount);
         psmt.close();
         psmt = conn.prepareStatement(sql);
         psmt.setString(1, tlno);
         rs = psmt.executeQuery();
         System.out.println(columnCount);
         while (rs.next()) {
            id[i] = rs.getString(3);
            comment[i] = rs.getString(2);

            
            i++;
         }
         map.put("ids", id);
         map.put("comments", comment);
         psmt.close();
         conn.close();

      } catch (Exception e) {
         e.printStackTrace();
      }

      return map;
   }
   
   
   
   

   public String[] selectone(String tlno) {

      String[] content = new String[6];
      String sql = "select timeline.*,member.profile from timeline, member where timeline.ID = member.ID and timeline_no=?";
      //select timeline.*,member.profile from timeline where timeline.id=member.id and timeline_no=
      try {
         psmt = conn.prepareStatement(sql);
         psmt.setString(1, tlno);
         rs = psmt.executeQuery();
         rs.next();
         content[0] = rs.getString(1);  //no
         content[1] = rs.getString(2); //내용
         content[2] = rs.getString(3);  //이미지
         content[3] = rs.getString(4);// 시간 
         content[4] = rs.getString(5);// 아이디
         content[5] = rs.getString(6);
   // 11, 12d1d2d21, resources/images/TLImg/marker1.png, 2020-06-14 13:30:13      
         
         System.out.printf("ssssss : %s, %s, %s, %s", rs.getString(5), rs.getString(2), rs.getString(3), rs.getString(4));
         psmt.close();
         conn.close();
         System.out.println(content.toString());
      
      } catch (Exception e) {
         e.printStackTrace();
      }

      return content;
   }

   public int good(String id, String no) {
      int goodZO = 0;
      String sql = "INSERT INTO timeline_like VALUES (?, ?)";
      try {
         psmt = conn.prepareStatement(sql);
         psmt.setString(1, id);
         psmt.setString(2, no);
         goodZO = psmt.executeUpdate();
         
      }catch(Exception e) {
         System.out.println("나올까요?");
      }
      
      return goodZO;
   }

}