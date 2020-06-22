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
	private Connection conn2;
	private PreparedStatement psmt;
	private ResultSet rs;

	public DAO(ServletContext context) {
		try {
			// 커넥션 풀을 이용한 DB연결
			Context ctx = new InitialContext();

			DataSource source = (DataSource) ctx.lookup("java:comp/env/sixone");

			conn = source.getConnection();
			conn2 = source.getConnection();
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	public int uploadtest(String saveDirectory, String filename, String content, String id) {
		int upd;
		String sql = "insert into timeline values(SEQ_TIMELINE.nextval,'" + content + "', '" + saveDirectory + filename
				+ "', sysdate, '" + id + "')";
		System.out.println(saveDirectory);
		System.out.println(filename);

		try {
			psmt = conn.prepareStatement(sql);
			upd = psmt.executeUpdate();
			System.out.println("영향받은 행수 : " + upd);

			psmt.close();
			conn.close();

		} catch (Exception e) {
			e.printStackTrace();
			upd = 0;
		}

		return upd;
	}

	public String[] SearchTest() {
		// 라이크 사용

		String[] nos = new String[1];
		String[] images = new String[1];
		String[] ids = new String[1];
		Date[] created_at = new Date[1];
		String[] content = new String[1];
		String cntSql = "SELECT COUNT(*) FROM timeline WHERE IMAGE_NAME LIKE '%de%'"; // 배열 선언함
		String sql = "SELECT * FROM timeline WHERE IMAGE_NAME LIKE '%de%'"; // 사진긁어옴

		int i = 0;
		try {
			psmt = conn.prepareStatement(cntSql);
			rs = psmt.executeQuery();
			rs.next();
			int columnCount = rs.getInt(1);
			psmt.close();

			psmt = conn.prepareStatement(sql);
			rs = psmt.executeQuery();

			if (columnCount != 0) {
				nos = new String[columnCount];
				images = new String[columnCount];
				ids = new String[columnCount];
				content = new String[columnCount];
				created_at = new Date[columnCount];
			}

			while (rs.next()) {
				nos[i] = rs.getString(1);
				content[i] = rs.getString(2);
				ids[i] = rs.getString(5);
				created_at[i] = rs.getDate(4);
				images[i] = rs.getString(3);
				System.out.println(images[i]);
				i++;
			}
			/*
			 * nos[i] = rs.getString(1); content[i] = rs.getString(2); ids[i] =
			 * rs.getString(5); created_at[i] = rs.getDate(4); images[i] = rs.getString(3);
			 * System.out.println(images[i]); i++;
			 */
			psmt.close();
			conn.close();

			if (images.length == 0)
				images[0] = "https://item.kakaocdn.net/do/9c5d673c91e8f1080c2602931c81f178f43ad912ad8dd55b04db6a64cddaf76d";
		} catch (Exception e) {
			e.printStackTrace();
		}

		return images;

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
		String cntSql = "SELECT COUNT(*) FROM timeline "/* where id='id'" */; // 배열 선언함
		String sql = "SELECT * FROM timeline "/* WHERE id='id' */ + " ORDER BY timeline_no desc"; // 사진긁어옴

		int i = 0;
		try {
			psmt = conn2.prepareStatement(cntSql);
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

			}

			while (rs.next()) {
				nos[i] = rs.getString(1);
				content[i] = rs.getString(2);
				ids[i] = rs.getString(5);
				created_at[i] = rs.getDate(4);
				images[i] = rs.getString(3);
				System.out.println(images[i]);
				i++;
			}
			psmt.close();
			conn.close();

			if (images.length == 1)
				images[0] = "https://www.loud.kr/hive/template/LOUD_IMG/portfolio2018/notfound_m.jpg";
		} catch (Exception e) {
			e.printStackTrace();
		}
		map.put("images", images);
		map.put("ids", ids);
		map.put("content", content);
		map.put("date", created_at);
		map.put("nos", nos);

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
	//	String[] tlno = new String[1]; // 타임라인 넘버

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

		String[] content = new String[5];
		String sql = "select * from timeline where timeline_no=?";
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

}
