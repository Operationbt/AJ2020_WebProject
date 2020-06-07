<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="jdbc.ConnectionProvider" %>
<%@ page import="dao.ProjectDataTableDAO" %>
<%@ page import="dto.ProjectDataBean" %>
<%@ page import="java.sql.Date" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.text.*" %>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>addProjectProcess</title>
</head>
<body>

<%

request.setCharacterEncoding("UTF-8");
String newWriter = request.getParameter("writer");
String newTitle = request.getParameter("title");
java.sql.Date now = new java.sql.Date(new java.util.Date().getTime());
Date deadline = Date.valueOf(request.getParameter("deadline"));
int newGoal = Integer.parseInt(request.getParameter("goal"));
String newContent = request.getParameter("content");
String newImage = request.getParameter("imageURL");


ProjectDataBean pe = new ProjectDataBean(1, newWriter, newTitle, now, newContent, newImage, deadline, newGoal, 0, 0, false);
out.println("<br>" + pe + "<br>");
%>

<%
	Connection conn = null;
try{
	conn = ConnectionProvider.getConnection();
	ProjectDataTableDAO dao = ProjectDataTableDAO.getInstance(); // getInstance
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