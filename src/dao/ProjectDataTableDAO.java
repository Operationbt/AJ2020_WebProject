package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;


import java.util.List;

import dto.ProjectDataBean;



public class ProjectDataTableDAO {
	private ProjectDataTableDAO() { 
	}
	
	private static ProjectDataTableDAO instance = new ProjectDataTableDAO();
	public static ProjectDataTableDAO getInstance(){
		return instance;
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
		Date date=rs.getDate("proj_date");
		String content=rs.getString("proj_content");
		String image=rs.getString("proj_image");
		Date deadline=rs.getDate("proj_deadline");
		int goal=rs.getInt("proj_goal");
		int currentMoney=rs.getInt("proj_current");
		int sponsor=rs.getInt("proj_sponsor");
		int ap=rs.getInt("proj_approval");
		
		ProjectDataBean pe = new ProjectDataBean(id, writer, title, date, content, image, deadline, goal, currentMoney, sponsor, false);
		return pe;
	}
}
