package action.comment;

import java.sql.Connection;
import java.sql.Date;
import java.sql.SQLException;
import java.util.Calendar;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ProjCommentDAO;
import dao.ProjectDataTableDAO;
import dto.ProjCommentDataBean;
import dto.ProjectDataBean;
import jdbc.ConnectionProvider;
import action.*;

public class WriteCommentAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("WriteCommentAction execute");
		Connection conn = null;
		
		String writer = request.getParameter("commentWriter");
		String content = request.getParameter("commentContent");
		Date date = new Date(Calendar.getInstance().getTime().getTime());
		int pid = Integer.parseInt(request.getParameter("commentPID"));
		
		try {
			conn = ConnectionProvider.getConnection();
			ProjCommentDAO dao = ProjCommentDAO.getInstance();
			ProjCommentDataBean cmt = new ProjCommentDataBean(writer, date, content, pid);
			dao.insert(conn, cmt);
			
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
