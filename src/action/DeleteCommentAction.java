package action;

import java.sql.Connection;
import java.sql.Date;
import java.sql.SQLException;
import java.util.Calendar;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ProjCommentDAO;
import dto.ProjCommentDataBean;
import jdbc.ConnectionProvider;

public class DeleteCommentAction implements Action{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("DeleteCommentAction execute");
		Connection conn = null;
		
		int num = Integer.parseInt(request.getParameter("num"));
		int pid = Integer.parseInt(request.getParameter("pid"));
		
		System.out.println("pid=" + pid);
		
		try {
			conn = ConnectionProvider.getConnection();
			ProjCommentDAO dao = ProjCommentDAO.getInstance();
			dao.delete(conn, num);
			
			
			request.setAttribute("pid", pid);
		} catch (NotFoundException e) {
			System.out.println("Member Not Found");
			e.printStackTrace();
		} catch (SQLException e) {
			throw new ServiceException("Member DB Error", e);
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
