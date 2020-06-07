package dao;
import java.sql.Date;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import dto.UserDataBean;
/*
>>### userdata_tb
>>user_id char(20) not null : ���� ���̵� ����
>>user_password char(20) not null : ���� ��й�ȣ�� ����
>>user_money int 0 : ��ο� �ʿ��� ��ȭ�� ����
>>user_scheduledMoney int null : user_money�� �ֱ� ���� �����Ǵ� ��ȭ
>>user_isAdmin tinyint 0 : ������ �������� �Ǻ�. 0�̸� �Ϲ� �����, 1�̸� ������
>>user_name varchar(45) null : ���� �̸�
>>user_email varchar(45) null : ���� �̸���
>>user_phone varchar(45) null : ���� ��ȭ��ȣ
>>user_date DATE null : ȸ������ ��¥
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
			String sql = "insert into userdata_tb values (?,?,?,?,?,?,?,?,?)";

			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, pe.getId());
			pstmt.setString(2, pe.getPassword());
			pstmt.setInt(3, pe.getMoney());
			pstmt.setInt(4, pe.getScheduledMoney());
			pstmt.setInt(5, pe.getIsAdmin());
			pstmt.setString(6, pe.getName());
			pstmt.setString(7, pe.getEmail());
			pstmt.setString(8, pe.getPhone());
			pstmt.setDate(9, pe.getRegisterDate());
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
			String sql = "delete from userdata_tb where user_id=?";
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
			String sql = "update userdata_tb set user_password=? user_money=? user_scheduledMoney=? isAdmin=? where user_id=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, pe.getPassword());
			pstmt.setInt(2, pe.getMoney());
			pstmt.setInt(3, pe.getScheduledMoney());
			pstmt.setInt(4, pe.getIsAdmin());
			pstmt.setString(5, pe.getId());
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
			String sql = "update userdata_tb set user_password=? where user_id=?";
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
			String sql = "update userdata_tb set user_money=?, user_scheduledMoney=? where user_id=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, pe.getMoney());
			pstmt.setInt(2, pe.getScheduledMoney());			
			pstmt.setString(3, pe.getId());
			return pstmt.executeUpdate();
		} finally {
			if (rs != null) {
				rs.close();
				System.out.println("rs!=null");
			}
			if (pstmt != null) {
				pstmt.close();
			}
		}
	}

	public int applyMoney(Connection conn, UserDataBean pe) throws SQLException {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			String sql = "update userdata_tb set user_scheduledMoney=? where user_id=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, pe.getScheduledMoney());
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

	// edit Admin
	public int editIsAdmin(Connection conn, UserDataBean pe) throws SQLException {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			String sql = "update userdata_tb set isAdmin=? where user_id=?";
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
			String sql = "select * from userdata_tb where user_id=?";
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
	
	//id,pw�� DB�� �ִ°Ͱ� ��. �α��� üũ
	public boolean signIn(Connection conn, String id, String password) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			String sql = "select * from userdata_tb where user_id=? and user_password=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, password);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				//id,pw�� DB�� ��ġ�� ��
				return true;
			}
			else {
				return false;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;
	}
	
	public UserDataBean createFromResultSet(ResultSet rs) throws SQLException {
		String id = rs.getString("user_id");
		String password = rs.getString("user_password");
		int money = rs.getInt("user_money");
		int schMoney=rs.getInt("user_scheduledMoney");
		int isAdmin = rs.getInt("user_isAdmin");
		String name = rs.getString("user_name");
		String email = rs.getString("user_email");
		String phone = rs.getString("user_phone");
		Date registerDate = rs.getDate("user_date");
		UserDataBean pe = new UserDataBean(id, password, money, schMoney, isAdmin, name, email, phone, registerDate);

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