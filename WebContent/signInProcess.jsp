<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@ page import="jdbc.ConnectionProvider" %>
<%@ page import="dto.UserDataBean" %>
<%@ page import="dao.SignInDAO" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
//signIn.jsp Form -> new UserData
String id = request.getParameter("id");
String password = request.getParameter("password");
out.println(id + "," + password + " 를 DB에서 찾는중");

//DB와 UserData 일치하는지 비교
Connection conn = ConnectionProvider.getConnection();
SignInDAO dao = SignInDAO.getInstance();
boolean isSuccess = dao.signInCheck(conn, id, password);

if(isSuccess){	//로그인 성공
	//session.setMaxInactiveInterval(1 * 60); // 1 minute
	session.setAttribute("userID", id);
	session.setAttribute("userPW", password);
	out.println("Session Success");
	response.sendRedirect("index.jsp");	
} else {	//로그인 실패
	out.println("Session Failed");
}
%>
</body>
</html>