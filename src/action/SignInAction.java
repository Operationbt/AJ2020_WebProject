package action;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.UserDataTableDAO;
import jdbc.ConnectionProvider;

public class SignInAction implements Action{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("SignInAction execute");
		HttpSession session = request.getSession(true);
		String status="";
		Connection conn = null;
		
		try {
			conn = ConnectionProvider.getConnection();
			UserDataTableDAO dao = UserDataTableDAO.getInstance();

			String id = request.getParameter("userID");
			String pw = request.getParameter("userPW");

			boolean isSuccess = dao.signIn(conn, id, pw);
			
			if(isSuccess) {	//로그인 성공
				boolean isAdmin = dao.isAdmin(conn, id);
				//session.setMaxInactiveInterval(60 * 60); //불편해서 뺌
				session.setAttribute("userID", id);
				session.setAttribute("userAdmin", isAdmin);
				//session.setAttribute("userPW", pw); //비밀번호까지 세션에 저장할 이유가?
				System.out.println("Sign In Session Success");
				session.setAttribute("status", "success");
			}
			else {
				session.setAttribute("status", "failed");
			}		
		} catch (NotFoundException e) {
			System.out.println("Member Not Found");
			session.setAttribute("status", "failed");
		} catch (SQLException e) {
			throw new ServiceException("Member DB Error", e);
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
