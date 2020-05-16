package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.sql.*;


import java.util.List;

import dto.ProjectDataBean;



public class ProjectDataTableDAO {
	private ProjectDataTableDAO() { 
	}
	
	private static ProjectDataTableDAO instance = new ProjectDataTableDAO();
	public static ProjectDataTableDAO getInstance(){
		return instance;
	} 
	
	// insert
	public int insert(Connection conn, ProjectDataBean pe) throws SQLException {
		PreparedStatement pstmt = null;
		try {
			String sql = "insert into projectdata_tb values (?,?,?,?,?,?,?,?,?,?,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, pe.getPid());
			pstmt.setString(2, pe.getWriter());
			pstmt.setString(3, pe.getTitle());
		    Timestamp ts_1 = java.sql.Timestamp.valueOf(pe.getDate());
			pstmt.setTimestamp(4, ts_1);
			pstmt.setString(5, pe.getContent());
			pstmt.setString(6, pe.getImageURL());
			Timestamp ts_2 = java.sql.Timestamp.valueOf(pe.getDeadline());
			pstmt.setTimestamp(7, ts_2);
			pstmt.setInt(8, pe.getGoal());
			pstmt.setInt(9, pe.getCurrent());
			pstmt.setInt(10, pe.getSponsor());
			pstmt.setBoolean(11, pe.isApproval());
			return pstmt.executeUpdate();
		} finally {
			if (pstmt != null) {
				pstmt.close();
			}
		}
	}

	// delete
	public int delete(Connection conn, String pid) throws SQLException {
		PreparedStatement pstmt = null;
		try {
			String sql = "delete from userdata_tb where project_id=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, pid);
			return pstmt.executeUpdate();
		} finally {
			if (pstmt != null) {
				pstmt.close();
			}
		}
	}	

	// edit Content
	public int editContent(Connection conn, ProjectDataBean pe) throws SQLException {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			String sql = "update projectdata_tb set proj_content=? where proj_id=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, pe.getContent());
			pstmt.setInt(2, pe.getPid());
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
		
	// edit the number of Sponsor
	public int editSponsor(Connection conn, ProjectDataBean pe) throws SQLException {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			String sql = "update projectdata_tb set proj_sponsor=? where proj_id=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, pe.getSponsor());
			pstmt.setInt(2, pe.getPid());
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
	// edit Current donation
	public int editCurrent(Connection conn, ProjectDataBean pe) throws SQLException {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			String sql = "update projectdata_tb set proj_current=? where proj_id=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, pe.getCurrent());
			pstmt.setInt(2, pe.getPid());
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
	
	// select(find/get)
	public ProjectDataBean select(Connection conn, String pid) throws SQLException {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			String sql = "select * from projectdata_tb where proj_id=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, pid);
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
	
	public List<ProjectDataBean> selectList(Connection conn) throws SQLException {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			String sql = "select * from projectdata_tb";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			List<ProjectDataBean> pList = new ArrayList<>();
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
	
	public ProjectDataBean createFromResultSet(ResultSet rs) throws SQLException {
		int id = rs.getInt("proj_id");
		String writer = rs.getString("proj_writer");
		String title=rs.getString("proj_title");
		String date=rs.getString("proj_date");
		String content=rs.getString("proj_content");
		String image=rs.getString("proj_image");
		String deadline=rs.getString("proj_deadline");
		int goal=rs.getInt("proj_goal");
		int currentMoney=rs.getInt("proj_current");
		int sponsor=rs.getInt("proj_sponsor");
		int ap=rs.getInt("proj_approval");
		
		ProjectDataBean pe = new ProjectDataBean(id, writer, title, date, content, image, deadline, goal, currentMoney, sponsor, false);
		return pe;
	}
}
