package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.UserDataTableDAO;
import dto.UserDataBean;
import jdbc.ConnectionProvider;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

public class UserManageViewAction implements Action{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		Connection conn=null;
		try{
			conn=ConnectionProvider.getConnection();
			UserDataTableDAO dao=UserDataTableDAO.getInstance();
			List<UserDataBean> uList=dao.selectList(conn);
			request.setAttribute("uList",uList);
		}catch(SQLException e){
			e.printStackTrace();
			System.out.print("No connection in userManageView\n");
		}finally{
			try{
				if(conn !=null) conn.close();
			}catch(SQLException se){
				se.printStackTrace();
			}
		}
		
	}

}
