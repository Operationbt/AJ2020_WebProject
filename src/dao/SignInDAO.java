package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/*
 * 로그인 시도할때 DB와 통신한는 DAO
 */
public class SignInDAO {
	private SignInDAO() {
		
	}
	private static SignInDAO instance = new SignInDAO();
	public static SignInDAO getInstance(){
		return instance;
	} 
	
	//id,pw를 DB에 있는것과 비교. 로그인 체크
	public boolean signInCheck(Connection conn, String id, String password) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			String sql = "select * from userdata_tb where user_id=? and user_password=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, password);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				//id,pw가 DB와 일치할 때
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

}
