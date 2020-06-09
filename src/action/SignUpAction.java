package action;

import java.sql.Connection;
import java.sql.Date;
import java.sql.SQLException;
import java.util.Calendar;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jdbc.ConnectionProvider;
import dto.UserDataBean;
import dao.UserDataTableDAO;

public class SignUpAction implements Action{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("SignUpAction execute");
		Connection conn = null;
		try {
			conn = ConnectionProvider.getConnection();
			UserDataTableDAO dao = UserDataTableDAO.getInstance();

			String id = request.getParameter("id");
			String password = request.getParameter("password");
			String name = request.getParameter("name");
			String email = request.getParameter("email1") + "@" + request.getParameter("email2");
			String phone = request.getParameter("phone");
//			String address = request.getParameter("memberAddress");
			Date registerDate = new java.sql.Date(Calendar.getInstance().getTime().getTime());
			
			UserDataBean member = new UserDataBean(id, password, 0, 0, 0, name, email, phone, registerDate);
			dao.insert(conn, member);
			
			System.out.println("Sign Up Success");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(conn != null) {
				try {
					conn.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
	}

}
