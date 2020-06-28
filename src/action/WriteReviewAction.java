package action;

import java.sql.Connection;
import java.sql.Date;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ProjReviewDAO;
import dto.ProjReviewDataBean;
import jdbc.ConnectionProvider;

public class WriteReviewAction implements Action{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("WriteReviewAction execute");
		
		Connection conn = null;
		
		String writer = request.getParameter("writer");  
		String title = request.getParameter("title");
		
		Timestamp date = Timestamp.valueOf(LocalDateTime.now());	//년 월 일 시 분 초
		
		String content = request.getParameter("content"); 
		String imageURL = request.getParameter("imageURL");
		int pid = Integer.parseInt(request.getParameter("reviewPID"));       
		
//		ProjReviewDataBean test = (ProjReviewDataBean)request.getAttribute("test");
//		int pid = 1001;
		
		try {
			conn = ConnectionProvider.getConnection();
			ProjReviewDAO dao = ProjReviewDAO.getInstance();
			ProjReviewDataBean review = new ProjReviewDataBean(writer, title, date, content, imageURL, pid);
			dao.insert(conn, review);
			
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
