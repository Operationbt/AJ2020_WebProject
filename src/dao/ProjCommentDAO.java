package dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import dto.ProjCommentDataBean;

/*
>>### userdata_tb
>>comment_num int not null : 댓글 번호 (기본키)

>>comment_writer int null : 댓글 작성자

>>comment_date int null : 댓글 작성 날짜

>>comment_content int null : 댓글 내용

>>comment_pid int null : 댓글의 프로젝트id (외래키)
*/

public class ProjCommentDAO {
	public ProjCommentDAO() {
	}
	
	private static ProjCommentDAO instance = new ProjCommentDAO();
	
	public static ProjCommentDAO getInstance() {
		return instance;
	}
	
	public List<ProjCommentDataBean> selectList(Connection conn, int comment_pid) throws SQLException {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			String sql = "SELECT comment_num, comment_writer, comment_date, comment_content, comment_pid FROM comment_tb" + 
					" join projectdata_tb" + 
					" on comment_tb.comment_pid = ? and comment_tb.comment_pid = projectdata_tb.proj_id";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, comment_pid);
			
			rs = pstmt.executeQuery();
			List<ProjCommentDataBean> pList = new ArrayList<>();
			while (rs.next()) {
				pList.add(createFromResultSet(rs));
			}
			return pList;
		} finally {
			if (rs != null) {
				rs.close();
			}
			if (pstmt != null) {
				pstmt.close();
			}
		}
	}
	
	public ProjCommentDataBean createFromResultSet(ResultSet rs) throws SQLException {
		int num = rs.getInt("comment_num");
		String writer = rs.getString("comment_writer");
		Date date = rs.getDate("comment_date");
		String content = rs.getString("comment_content");
		int pid = rs.getInt("comment_pid");
		
		ProjCommentDataBean comment = new ProjCommentDataBean(num, writer, date, content, pid);

		return comment;
	}
}
