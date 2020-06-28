package dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import dto.ProjCommentDataBean;
import dto.ProjReviewDataBean;
import dto.ProjectDataBean;

/*
>>### review_tb
>>review_id int not null : 후기 글번호 (기본키)

>>review_writer varchar(45) null : 후기 작성자

>>review_title varchar(45) null : 후기 제목

>>review_date datetime null :  후기 작성 날짜

>>review_content text(10000) null : 후기 내용

>>review_image varchar(255) null : 첨부 이미지 URL주소

>>review_approval tinyint 1 : 후기 허용

>>review_pid int null : 후기의 프로젝트id (외래키)
*/


public class ProjReviewDAO {
	
	public ProjReviewDAO() {
	}
	
	private static ProjReviewDAO instance = new ProjReviewDAO();
	
	public static ProjReviewDAO getInstance() {
		return instance;
	}

	//후기 작성
	public int insert(Connection conn, ProjReviewDataBean pe) throws SQLException {
		PreparedStatement pstmt = null;
		try {
			String sql = "insert into review_tb values (?,?,?,?,?,?,?,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, pe.getId());
			pstmt.setString(2, pe.getWriter());
			pstmt.setString(3, pe.getTitle());
			pstmt.setTimestamp(4, pe.getDate());
			pstmt.setString(5, pe.getContent());
			pstmt.setString(6, pe.getImageURL());
			pstmt.setBoolean(7, pe.isApproval());
			pstmt.setInt(8, pe.getPid());
			
			return pstmt.executeUpdate();
		} finally {
			if (pstmt != null) {
				pstmt.close();
			}
		}
	}
	//후기 삭제
	public int delete(Connection conn, int id) throws SQLException {
		PreparedStatement pstmt = null;
		try {
			String sql = "delete from review_tb where review_id=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, id);
			return pstmt.executeUpdate();
		} finally {
			if (pstmt != null) {
				pstmt.close();
			}
		}
	}	
	//후기 수정 (수정되는 내용은 제목, 내용, 이미지)
	public int editContent(Connection conn, ProjReviewDataBean pe) throws SQLException {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			String sql = "update review_tb set review_title=? review_content=? review_image=? where review_id=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, pe.getTitle());
			pstmt.setString(2, pe.getContent());
			pstmt.setString(3, pe.getImageURL());
			pstmt.setInt(4, pe.getId());
			
			return pstmt.executeUpdate();
		} finally {
			if (rs != null) {
				rs.close();
			}
			if (pstmt != null) {
				pstmt.close();
			}
		}
	}
	public int editContent(Connection conn, int id, String title, String content, String image) throws SQLException {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			String sql = "update review_tb set review_title=? review_content=? review_image=? where review_id=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, title);
			pstmt.setString(2, content);
			pstmt.setString(3, image);
			pstmt.setInt(4, id);
			
			return pstmt.executeUpdate();
		} finally {
			if (rs != null) {
				rs.close();
			}
			if (pstmt != null) {
				pstmt.close();
			}
		}
	}	
	
	//후기 가져오기
	public ProjReviewDataBean select(Connection conn, int review_pid) throws SQLException {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			String sql = "SELECT review_id, review_writer, review_title, review_date, review_content, review_image, review_approval, review_pid FROM review_tb" + 
					" join projectdata_tb" + 
					" on review_tb.review_pid = ? and review_tb.review_pid = projectdata_tb.proj_id";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, review_pid);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				return createFromResultSet(rs);
			}
			else {
				return null;
			}
		} finally {
			if (rs != null) {
				rs.close();
			}
			if (pstmt != null) {
				pstmt.close();
			}
		}
	}
	
	//https://happybean.naver.com/donations/H000000169949/postscripts 모금 소식으로 여러개를 쓸 수도 있는듯
	public List<ProjReviewDataBean> selectList(Connection conn, int review_pid) throws SQLException {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			String sql = "SELECT review_id, review_writer, review_title, review_date, review_content, review_image, review_approval, review_pid FROM review_tb" + 
					" join projectdata_tb" + 
					" on review_tb.review_pid = ? and review_tb.review_pid = projectdata_tb.proj_id";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, review_pid);
			
			rs = pstmt.executeQuery();
			List<ProjReviewDataBean> pList = new ArrayList<>();
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
	
	public ProjReviewDataBean createFromResultSet(ResultSet rs) throws SQLException {
		
		int id = rs.getInt("review_id");       
		String writer = rs.getString("review_writer");  
		String title = rs.getString("review_title");    
		Timestamp date = rs.getTimestamp("review_date");
		String content = rs.getString("review_content"); 
		String imageURL = rs.getString("review_image"); 
		boolean approval = rs.getBoolean("review_approval");
		int pid = rs.getInt("review_pid");  
		
		ProjReviewDataBean comment = new ProjReviewDataBean(id, writer, title, date, content, imageURL, approval, pid);

		return comment;
	}
}
