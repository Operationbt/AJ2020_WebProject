package dao;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import dto.UserDataBean;
/*
>>### userdata_tb
>>user_id char(20) not null : 유저 아이디를 저장

>>user_password char(20) not null : 유저 비밀번호를 저장

>>user_money int null : 기부에 필요한 재화를 저장

>>user_isAdmin tinyint null : 관리자 권한인지 판별. 0이면 일반 사용자, 1이면 관리자
 */
public class UserDataTableDAO {
	private UserDataTableDAO() { 
	}
	
	private static UserDataTableDAO instance = new UserDataTableDAO();
	public static UserDataTableDAO getInstance(){
		return instance;
	} 

	// insert
	public int insert(Connection conn, UserDataBean pe) throws SQLException {
		PreparedStatement pstmt = null;
		try {
			String sql = "insert into userdata_tb values (?,?,?,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, pe.getId());
			pstmt.setString(2, pe.getPassword());
			pstmt.setInt(3, pe.getMoney());
			pstmt.setInt(4, pe.getIsAdmin());
			return pstmt.executeUpdate();
		} finally {
			if (pstmt != null) {
				pstmt.close();
			}
		}
	}

	// delete
	public int delete(Connection conn, String id) throws SQLException {
		PreparedStatement pstmt = null;
		try {
			String sql = "delete from userdata_tb where id=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			return pstmt.executeUpdate();
		} finally {
			if (pstmt != null) {
				pstmt.close();
			}
		}
	}
	
	// edit
	public int edit(Connection conn, UserDataBean pe) throws SQLException {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			String sql = "update userdata_tb set password=? money=? isAdmin=? where id=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, pe.getPassword());
			pstmt.setInt(2, pe.getMoney());
			pstmt.setInt(3, pe.getIsAdmin());
			pstmt.setString(4, pe.getId());
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
	// edit Password
	public int editPassword(Connection conn, UserDataBean pe) throws SQLException {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			String sql = "update userdata_tb set password=? where id=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, pe.getPassword());
			pstmt.setString(2, pe.getId());
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
	// edit Money
	public int editMoney(Connection conn, UserDataBean pe) throws SQLException {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			String sql = "update userdata_tb set money=? where id=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, pe.getMoney());
			pstmt.setString(2, pe.getId());
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
	// edit Author
	public int editIsAdmin(Connection conn, UserDataBean pe) throws SQLException {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			String sql = "update userdata_tb set isAdmin=? where id=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, pe.getIsAdmin());
			pstmt.setString(2, pe.getId());
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
	public UserDataBean select(Connection conn, String id) throws SQLException {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			String sql = "select * from userdata_tb where id=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
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
	
	public UserDataBean createFromResultSet(ResultSet rs) throws SQLException {
		String id = rs.getString("id");
		String password = rs.getString("password");
		int money = rs.getInt("money");
		int isAdmin = rs.getInt("isAdmin");
		
		UserDataBean pe = new UserDataBean(id, password, money, isAdmin);
		return pe;
	}
	
	// selectList
	public List<UserDataBean> selectList(Connection conn) throws SQLException {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			String sql = "select * from userdata_tb";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			List<UserDataBean> pList = new ArrayList<>();
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
}
