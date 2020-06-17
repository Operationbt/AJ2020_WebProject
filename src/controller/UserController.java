package controller;

import java.io.IOException;
import action.*;
import action.user.*;
import action.project.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class UserController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		doPost(request, response);
	}
	
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		String RequestURI = request.getRequestURI();
		String contextPath = request.getContextPath();
		String command = RequestURI.substring(contextPath.length());
		
		response.setContentType("text/html; charset=utf-8");
		request.setCharacterEncoding("utf-8");
		
		Action action = null;
		
		if (command.equals("/user/DonateViewAction")) { // go to donationForm page
			action = new FindProjectAction(); // return donation project(=>project)
			action.execute(request, response);
			RequestDispatcher rd = request.getRequestDispatcher("/donationForm.jsp");
			rd.forward(request, response); 
		} else if (command.contentEquals("/user/DonateAction")) { // process donation and view mainPage
			action = new DonateAction();
			action.execute(request, response);
			//System.out.println("donateAction 완료하는중");
			//RequestDispatcher rd = request.getRequestDispatcher("../ListViewAction.do");
			//rd.forward(request, response);
			response.sendRedirect("../project/ListViewAction");
		} else if (command.contentEquals("/user/MyPageViewAction")) {
			action = new MyPageViewAction();
			action.execute(request, response);
			RequestDispatcher rd = request.getRequestDispatcher("/myPageView.jsp");
			rd.forward(request, response);
		} else if (command.contentEquals("/user/AddMoneyAction")) {
			action = new AddMoneyAction();
			action.execute(request, response);
			RequestDispatcher rd = request.getRequestDispatcher("/user/MyPageViewAction");
			rd.forward(request, response);
		}
	}
}
