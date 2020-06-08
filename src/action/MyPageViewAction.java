package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.UserDataTableDAO;
import dto.UserDataBean;
import jdbc.ConnectionProvider;

import java.sql.Connection;
import java.sql.SQLException;


	public class MyPageViewAction implements Action{

		@Override
		public void execute(HttpServletRequest request, HttpServletResponse response) {
			HttpSession session = request.getSession(true);
			String session_userID = (String)session.getAttribute("userID");
			
			UserDataBean UserInfo = new UserDataBean();
			Connection conn = null;
			try{
				conn = ConnectionProvider.getConnection();
				UserDataTableDAO dao = UserDataTableDAO.getInstance();
				UserInfo = dao.select(conn, session_userID);
				
				System.out.println(UserInfo.toString());
				request.setAttribute("UserInfo",UserInfo);
				
			}catch(SQLException e){
				e.printStackTrace();
				System.out.print("No connection in myPage\n");
			}finally{
				try{
					if(conn !=null) conn.close();
				}catch(SQLException se){
					se.printStackTrace();
				}
			}
			
		}
		
}
