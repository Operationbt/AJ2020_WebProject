package action;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dto.ProjCommentDataBean;
import dao.ProjCommentDAO;
import dao.ProjectDataTableDAO;

import jdbc.ConnectionProvider;

public class ShowCommentListAction implements Action{

	/*
	 * 댓글 목록을 보여주는 액션인데 만들고 나니 쓸모가 없음
	 * FindProjectAction 에서 프로젝트 내용 불러오고 댓글도 같이 불러오기 때문
	 * 나중에 삭제 필요
	 */
	
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("ShowCommentListAction execute");
		Connection conn = null;
		int comment_pid = Integer.parseInt(request.getParameter("pid"));
		
		System.out.println("pid:" + comment_pid);
		
		try {
			conn = ConnectionProvider.getConnection();
			ProjCommentDAO dao = ProjCommentDAO.getInstance();
			List<ProjCommentDataBean> cList = dao.selectList(conn, comment_pid);
			
			request.setAttribute("cList", cList);
			
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
