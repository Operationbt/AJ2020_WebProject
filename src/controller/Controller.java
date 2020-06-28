package controller;

import java.io.IOException;
import action.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Controller extends HttpServlet {
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
		if (command.equals("/ListViewAction.do")) { // list view
			action = new ListProjectAction(); // return donationList(=>dList)
			action.execute(request, response);
			RequestDispatcher rd = request.getRequestDispatcher("mainPage.jsp");
			rd.forward(request, response);
		} else if (command.equals("/DetailViewAction.do")) { // detail view
			action = new FindProjectAction(); // return donation project(=>project)
			action.execute(request, response);
			RequestDispatcher rd = request.getRequestDispatcher("projectDetail.jsp");
			rd.forward(request,  response);	
		} else if (command.equals("/DonateViewAction.do")) { // go to donationForm page
			action = new DonateViewAction(); // return donation project(=>project)
			action.execute(request, response);
			RequestDispatcher rd = request.getRequestDispatcher("donationForm.jsp");
			rd.forward(request, response);
		} else if (command.contentEquals("/DonateAction.do")) { // process donation and view mainPage
			action = new DonateAction();
			action.execute(request, response);
			RequestDispatcher rd = request.getRequestDispatcher("/ListViewAction.do");
			rd.forward(request, response);
		} else if (command.contentEquals("/MyPageViewAction.do")) {
			action = new MyPageViewAction();
			action.execute(request, response);
			RequestDispatcher rd = request.getRequestDispatcher("myPageView.jsp");
			rd.forward(request, response);
		} else if (command.contentEquals("/AddMoneyAction.do")) {
			action = new AddMoneyAction();
			action.execute(request, response);
			RequestDispatcher rd = request.getRequestDispatcher("/MyPageViewAction.do");
			rd.forward(request, response);
		} else if (command.contentEquals("/AddProjectAction.do")) {
			action = new AddProjectAction();
			action.execute(request, response);
			RequestDispatcher rd = request.getRequestDispatcher("/ListViewAction.do");
			rd.forward(request, response);
		}
	}
}
