package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import action.ApplyMoneyAction;

public class ManageController extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String RequestURI = req.getRequestURI();
		String contextPath = req.getContextPath();
		String command = RequestURI.substring(contextPath.length());
		
		resp.setContentType("text/html; charset=utf-8");
		req.setCharacterEncoding("utf-8");
		
		Action action = null;
		if(command.equals("/manage/ApplyMoneyAction")) {
			action = new ApplyMoneyAction();
			action.execute(req, resp);
			RequestDispatcher rd = req.getRequestDispatcher("listView.jsp");
			rd.forward(req, resp);
		}/*
		else if(command.equals("/DetailViewAction.do")) {
			action = new FindPeriodicElementAction();
			action.execute(req, resp);
			RequestDispatcher rd = req.getRequestDispatcher("detailView.jsp");
			rd.forward(req, resp);
		}*/
	}

}
