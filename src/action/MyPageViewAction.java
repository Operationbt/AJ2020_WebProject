package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.ProjectDataTableDAO;
import dao.UserDataTableDAO;
import dto.ProjectDataBean;
import dto.UserDataBean;
import jdbc.ConnectionProvider;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;


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
				
				ProjectDataTableDAO dao2=ProjectDataTableDAO.getInstance();
				List<ProjectDataBean> ProjInfo=dao2.selectList(conn);
				
				System.out.println(UserInfo.toString());
				request.setAttribute("UserInfo",UserInfo);
				request.setAttribute("userDonationList", ProjInfo);
				
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
