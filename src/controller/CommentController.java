package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import action.ShowCommentListAction;
import action.SignInAction;

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
		if(command.equals("../comment/AddCommentAction")) {
			action = new SignInAction();
			action.execute(req, resp);
			resp.sendRedirect("../index.jsp");
		}
		else if(command.equals("../comment/ShowCommentListAction")) {
			action = new ShowCommentListAction();
			action.execute(req, resp);
			RequestDispatcher rd = req.getRequestDispatcher("../projCommentView.jsp");
			rd.forward(req,  resp);	
			
			//resp.sendRedirect("../index.jsp");
		}
	}
}
