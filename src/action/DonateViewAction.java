package action;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.ProjectDataTableDAO;
import dao.UserDataTableDAO;
import dto.ProjectDataBean;
import dto.UserDataBean;
import jdbc.ConnectionProvider;

public class DonateViewAction implements Action{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession(true);
		String session_userID = (String)session.getAttribute("userID");
		int pid = Integer.parseInt(request.getParameter("pid"));
		

		Connection conn = null;
		try{
			conn = ConnectionProvider.getConnection();
			
			UserDataTableDAO dao = UserDataTableDAO.getInstance();
			UserDataBean user = dao.select(conn, session_userID);
			
			ProjectDataTableDAO pdao = ProjectDataTableDAO.getInstance();
			ProjectDataBean project = pdao.select(conn, pid);

			request.setAttribute("user", user);
			request.setAttribute("project", project);
			
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
