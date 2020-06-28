package controller;

import java.io.IOException;
import java.sql.Date;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import action.FindProjectAction;
import action.ShowReviewAction;
import action.WriteCommentAction;
import action.WriteReviewAction;
import dto.ProjReviewDataBean;

public class ReviewController extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String RequestURI = req.getRequestURI();
		String contextPath = req.getContextPath();
		String command = RequestURI.substring(contextPath.length());

		System.out.println("HttpServlet Command : " + command + " req : " + req.getRequestURI());
		resp.setContentType("text/html; charset=utf-8");
		req.setCharacterEncoding("utf-8");
		
		Action action = null;
		
		//테스트 오브젝트
//		String writer = "writer";  
//		String title = "title";
//		
//		Timestamp date = Timestamp.valueOf(LocalDateTime.now());
//		System.out.println("date:" + date);
//		
//		String content = "content"; 
//		String imageURL = "imageURL";
//		int pidi = 1000;   
//		ProjReviewDataBean test = new ProjReviewDataBean(writer, title, date, content, imageURL, pidi);
//		req.setAttribute("test", test);
		//
		
		//후기 작성
		if(command.equals("/review/WriteReviewAction")) {
			action = new WriteReviewAction();
			action.execute(req, resp);
			
			Integer pid = (Integer)req.getAttribute("pid");
			System.out.println("review pid:" + pid.toString());
			resp.sendRedirect("../DetailViewAction.do?pid=" + pid);
		}
		//후기 보기
		else if (command.equals("/review/ShowReviewAction")) { 
			action = new ShowReviewAction();
			action.execute(req, resp);
			RequestDispatcher rd = req.getRequestDispatcher("../showReviewView.jsp");
			rd.forward(req,  resp);	
		}
		else {
			System.out.println("No Matching Command!");
		}
	}
	
	
}
