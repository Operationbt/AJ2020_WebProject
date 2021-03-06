package controller;
import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import action.SignInAction;
import action.SignOutAction;
import action.SignUpAction;

public class SignController extends HttpServlet {

	private static final long serialVersionUID = 1L;
	
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
		if(command.equals("/sign/SignInAction")) {
			action = new SignInAction();
			action.execute(req, resp);
			if((req.getSession().getAttribute("status")).equals("failed")) {
			resp.sendRedirect("../signInView.jsp");
			}else {resp.sendRedirect("../index.jsp");}
		}
		else if(command.equals("/sign/SignOutAction")) {
			action = new SignOutAction();
			action.execute(req, resp);
			resp.sendRedirect("../index.jsp");
		}
		else if(command.equals("/sign/SignUpAction")) {
			action = new SignUpAction();
			action.execute(req, resp);
			resp.sendRedirect("../signInView.jsp"); //회원가입 하면 바로 로그인 페이지로 이동
		}
	}
}
