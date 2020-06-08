package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.UserDataTableDAO;
import dto.UserDataBean;
import jdbc.ConnectionProvider;

import java.sql.Connection;
import java.sql.SQLException;

public class UserManageAction implements Action{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		String id=request.getParameter("id"); 
		Connection conn=null;
			try{
				conn=ConnectionProvider.getConnection();
				UserDataTableDAO dao = UserDataTableDAO.getInstance();
				UserDataBean pastData = dao.select(conn, id);
				UserDataBean userData = new UserDataBean(pastData.getId(), pastData.getPassword(), pastData.getMoney()+pastData.getScheduledMoney(),
										0, pastData.getIsAdmin(), pastData.getName(), pastData.getEmail(), pastData.getPhone(), pastData.getRegisterDate());
				dao.editMoney(conn, userData);
				
			}catch(SQLException e){
				e.printStackTrace();
				System.out.print("No connection in UserManageAction\n");
			}finally{
				try{
					if(conn !=null) conn.close();
				}catch(SQLException se){
					se.printStackTrace();
				}
			}
		
	}

}
