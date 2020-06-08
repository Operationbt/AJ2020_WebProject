package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.UserDataTableDAO;
import dto.UserDataBean;
import jdbc.ConnectionProvider;

import java.sql.Connection;
import java.sql.SQLException;


public class AddMoneyAction implements Action{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession(true);
		String session_userID = (String)session.getAttribute("userID");
		int newMoney = Integer.parseInt(request.getParameter("Amount"));
		
		Connection conn=null;
		try{
			conn=ConnectionProvider.getConnection();
			UserDataTableDAO dao = UserDataTableDAO.getInstance();
			UserDataBean pastData = dao.select(conn, session_userID);
			UserDataBean userData = new UserDataBean(pastData.getId(), pastData.getPassword(), pastData.getMoney(),
											         pastData.getScheduledMoney() + newMoney, pastData.getIsAdmin(), 
											         pastData.getName(), pastData.getEmail(), pastData.getPhone(), pastData.getRegisterDate());
			dao.applyMoney(conn, userData);

		}catch(SQLException e){
			e.printStackTrace();
			System.out.print("No connection in AddMoneyAction\n");
		}finally{
			try{
				if(conn !=null) conn.close();
			}catch(SQLException se){
				se.printStackTrace();
			}
		}	
	}
			
}
