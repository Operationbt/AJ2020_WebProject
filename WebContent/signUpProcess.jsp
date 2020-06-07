<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@ page import="jdbc.*" %>
<%@ page import="dto.*" %>
<%@ page import="dao.*" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 처리</title>
</head>
<body>
<%-- form => new UserData --%>
<%
String id = request.getParameter("id");
String password = request.getParameter("password");

UserDataBean pe = new UserDataBean(id, password, 0,0, 0);

out.println("<br>" + pe + "<br>");
%>
<%-- UserData => insert DB --%>
<%
	Connection conn = null;
try{
	conn = ConnectionProvider.getConnection();
	UserDataTableDAO dao = UserDataTableDAO.getInstance(); // getInstance
	dao.insert(conn, pe); //insert
	response.sendRedirect("mainPage.jsp");

} catch(SQLException e){
	e.printStackTrace();
} finally{
	try{
		if(conn != null)
	conn.close();
	} catch(SQLException se){
		se.printStackTrace();
	}
}
%>
</body>
</html>