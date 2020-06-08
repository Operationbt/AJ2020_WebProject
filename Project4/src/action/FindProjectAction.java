package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ProjectDataTableDAO;
import dto.ProjectDataBean;
import jdbc.ConnectionProvider;

import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Date;

public class FindProjectAction implements Action{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		int pid = Integer.parseInt(request.getParameter("pid"));
	
		Connection conn=null;
		
		try{
			conn=ConnectionProvider.getConnection();
			ProjectDataTableDAO dao=ProjectDataTableDAO.getInstance();
			ProjectDataBean project =dao.select(conn, pid);
			
			
			request.setAttribute("project", project);
			
			long theday = project.getDeadline().getTime();
			//long theday = new java.util.Date(project.getDeadline().getTime()).getTime();
			long today = new java.util.Date().getTime();
			long leftTime = theday - today;
			int leftDay;
			if (leftTime<0){
				leftDay = -1;
			}
			else{
			    leftDay = (int)Math.floor(leftTime/(1000*60*60*24))+1; 
			}

			request.setAttribute("leftDay", leftDay);

		}catch(SQLException e){
			e.printStackTrace();
			System.out.print("No connection in FindProjectAction\n");
		}finally{
			try{
				if(conn !=null) 
					conn.close();
			}catch(SQLException se){
				se.printStackTrace();
			}
		}	
	}
}
