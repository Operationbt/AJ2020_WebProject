package action;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dto.ProjCommentDataBean;
import dto.ProjReviewDataBean;
import dto.ProjectDataBean;
import dao.ProjCommentDAO;
import dao.ProjReviewDAO;
import dao.ProjectDataTableDAO;

import jdbc.ConnectionProvider;

public class ShowReviewAction implements Action{

	/*
	 * 댓글 목록을 보여주는 액션인데 만들고 나니 쓸모가 없음
	 * FindProjectAction 에서 프로젝트 내용 불러오고 댓글도 같이 불러오기 때문
	 * 나중에 삭제 필요
	 */
	
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("ShowReviewAction execute");
		Connection conn = null;
		int pid = Integer.parseInt(request.getParameter("pid"));
		
		System.out.println("pid:" + pid);
		
		try {
			conn = ConnectionProvider.getConnection();
			ProjReviewDAO dao = ProjReviewDAO.getInstance();
			ProjReviewDataBean review = dao.select(conn, pid);
			request.setAttribute("review", review);
			
			//후기 페이지에서 프로젝트의 모금액, 기간 등 정보를 쓰기 위해
			ProjectDataTableDAO pdao = ProjectDataTableDAO.getInstance();
			ProjectDataBean project = pdao.select(conn, pid);
			request.setAttribute("project", project);
			
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
