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

		Connection conn = null;
		try {
			conn = ConnectionProvider.getConnection();
			UserDataTableDAO dao = UserDataTableDAO.getInstance();
			

			String id = request.getParameter("id");
			String password = request.getParameter("password");
//			String name = request.getParameter("memberName");
//			String email = request.getParameter("memberEmail") + "@" + request.getParameter("memberEmail2");
//			String phone = request.getParameter("memberPhone");
//			String address = request.getParameter("memberAddress");
//			Date registerDate = new java.sql.Date(Calendar.getInstance().getTime().getTime());
			
			UserDataBean member = new UserDataBean(id, password);
			dao.insert(conn, member);
			
		} catch (Exception e) {
			// TODO: handle exception
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
