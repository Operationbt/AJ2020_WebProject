package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ProjectDataTableDAO;

import dto.ProjectDataBean;

import jdbc.ConnectionProvider;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

public class ListProjectAction implements Action{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		Connection conn=null;
		try{
			String cat = request.getParameter("cat");
			if(cat == null)
				cat = "0";
			System.out.println("cat="+cat);
			conn = ConnectionProvider.getConnection();
			ProjectDataTableDAO dao = ProjectDataTableDAO.getInstance();
			List<ProjectDataBean> dList = dao.selectList(conn);
			request.setAttribute("dList",dList);
			request.setAttribute("cat", cat);
			request.setAttribute("today", new java.util.Date().getTime());
			System.out.println("dList.size()=" + dList.size());	

		}catch(SQLException e){
			e.printStackTrace();
			System.out.print("No connection in ListProjectAction\n");
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
