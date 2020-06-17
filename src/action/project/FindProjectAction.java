package action.project;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ProjCommentDAO;
import dao.ProjectDataTableDAO;
import dto.ProjCommentDataBean;
import dto.ProjectDataBean;
import jdbc.ConnectionProvider;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;
import java.sql.Date;
import action.*;

public class FindProjectAction implements Action{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		int pid = Integer.parseInt(request.getParameter("pid"));
	
		Connection conn=null;
		
		try{
			conn=ConnectionProvider.getConnection();
			ProjectDataTableDAO dao = ProjectDataTableDAO.getInstance();
			ProjectDataBean project = dao.select(conn, pid);
			
			//예외처리 필요..
			request.setAttribute("project", project);
			
			// D-day 구하는 부분 -뭔가 문제 있음.. 새벽에 하면 오차있고.. 다시 한 번 확인해보자!
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
			
			
			//댓글 목록 불러오기
			ProjCommentDAO cmt_dao = ProjCommentDAO.getInstance();
			List<ProjCommentDataBean> cList = cmt_dao.selectList(conn, pid);
			request.setAttribute("cList", cList);

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
