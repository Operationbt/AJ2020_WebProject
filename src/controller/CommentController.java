package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import action.comment.*;


public class CommentController extends HttpServlet {

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
		if(command.equals("/comment/WriteCommentAction")) {
			action = new WriteCommentAction();
			action.execute(req, resp);
			
			Integer pid = (Integer)req.getAttribute("pid");
			System.out.println("now pid:" + pid.toString());
			
			resp.sendRedirect("../project/DetailViewAction?pid=" + pid);
		}
		else if(command.equals("/comment/DeleteCommentAction")) {
			action = new DeleteCommentAction();
			action.execute(req, resp);
			System.out.println("삭제끝");
			
			Integer pid = (Integer)req.getAttribute("pid");
			System.out.println("now pid:" + pid.toString());
			
			resp.sendRedirect("../project/DetailViewAction?pid=" + pid);
		}
		/*
		else if(command.equals("../comment/ShowCommentListAction")) {
			action = new ShowCommentListAction();
			action.execute(req, resp);
			RequestDispatcher rd = req.getRequestDispatcher("../projectDetail.jsp");
			rd.forward(req,  resp);	
			
			//resp.sendRedirect("../index.jsp");
		}
		*/
		else {
			System.out.println("No Matching Command!");
		}
	}
}
