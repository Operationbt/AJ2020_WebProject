package action.manage;

import java.sql.Connection;
import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ProjectDataTableDAO;
import dto.ProjectDataBean;
import jdbc.ConnectionProvider;
import action.*;

public class ConfirmProjectAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
        System.out.println("ConfirmProjectAction execute");
		int pid=Integer.parseInt(request.getParameter("pid"));
		ProjectDataBean pe=new ProjectDataBean(pid, null, null, null, null, null, null, 0, 0, 0,0, true);
		Connection conn = null;
		try{
			conn = ConnectionProvider.getConnection();
			ProjectDataTableDAO dao = ProjectDataTableDAO.getInstance(); // getInstance
			dao.editApproval(conn, pe);
		} catch(SQLException e){
			e.printStackTrace();
		} finally{
			try{
				if(conn != null)
			conn.close();
			} catch(SQLException se){
				se.printStackTrace();
			}
		}
		
		
		
	}

}
