package controller;

import java.io.IOException;
import action.*;
import action.project.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ProjectController extends HttpServlet {
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
		if (command.equals("/project/ListViewAction")) { // list view
			action = new ListProjectAction(); // return donationList(=>dList)
			action.execute(request, response);
			RequestDispatcher rd = request.getRequestDispatcher("/mainPage.jsp");
			rd.forward(request, response);
		} else if (command.equals("/project/DetailViewAction")) { // detail view
			action = new FindProjectAction(); // return donation project(=>project)
			action.execute(request, response);
			RequestDispatcher rd = request.getRequestDispatcher("/projectDetail.jsp");
			rd.forward(request,  response);	
		} else if (command.contentEquals("/project/AddProjectAction")) {
			action = new AddProjectAction();
			action.execute(request, response);
			RequestDispatcher rd = request.getRequestDispatcher("/project/ListViewAction");
			rd.forward(request, response);
		}
	}
}