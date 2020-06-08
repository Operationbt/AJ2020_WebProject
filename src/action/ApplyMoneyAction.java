package action;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.UserDataTableDAO;
import jdbc.ConnectionProvider;

//매니저 컨트롤러(관리자 기능) 액션 - 대기중인 금액 승인해주는 거
public class ApplyMoneyAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		System.out.println("ApplyMoneyAction excute");
		String id = request.getParameter("id");
		Connection conn = null;
		
		try {
			conn = ConnectionProvider.getConnection();
			UserDataTableDAO dao = UserDataTableDAO.getInstance();
			dao.applyMoney(conn, id);
	
		} catch (NotFoundException e) {
			System.out.println("Member Not Found");
			e.printStackTrace();
		} catch (SQLException e) {
			throw new ServiceException("UserData DB Error", e);
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
