package dao;
import vo.*;
import commons.*;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.*;
public class NoticeDao {
	public ArrayList<Notice> selectNoticeList() throws Exception{
		ArrayList<Notice> list = new ArrayList<Notice>();
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConnection();
		
		String sql ="select * from notice order by notice_date desc limit 0,2 "; 
		PreparedStatement stmt = conn.prepareStatement(sql);
		ResultSet rs = stmt.executeQuery();
		while(rs.next()) {
			Notice n = new Notice();
			n.setNoticeId(rs.getInt("notice_id"));
			n.setNoticeTitle(rs.getString("notice_title"));
			n.setNoticeContent(rs.getString("notice_content"));
			n.setNoticeDate(rs.getString("notice_date"));
			
			list.add(n); // 리스트에 추가(추가 하지 않으면 빈리스트)
		}
		conn.close();
		return list;	
	}
	
	public Notice selectNoticeOne(String noticeTitle) throws Exception{
		Notice n = null;
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConnection();
		
		String sql = "select*from notice where notice_title=?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1,noticeTitle);
		ResultSet rs = stmt.executeQuery();
		if(rs.next()) { // 수정 get 읽을떄는 set
			n = new Notice();
			n.setNoticeId(rs.getInt("notice_id")); 
			n.setNoticeTitle(rs.getString("notice_title"));
			n.setNoticeContent(rs.getString("notice_content"));
			n.setNoticeDate(rs.getString("notice_date"));
		}
		conn.close();
		return n;
	}
}
