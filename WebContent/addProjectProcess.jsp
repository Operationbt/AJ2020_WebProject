<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="jdbc.ConnectionProvider" %>
<%@ page import="dao.ProjectDataTableDAO" %>
<%@ page import="dto.ProjectDataBean" %>

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
//String newDl = request.getParameter("deadline");
//SimpleDateFormat format1 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
//String newDeadline = format1.format(newDl);
int newGoal = Integer.parseInt(request.getParameter("goal"));
String newContent = request.getParameter("content");
String newImage = request.getParameter("imageURL");
//java.util.Date now = new java.util.Date();
//String newDate = format1.format(now);


ProjectDataBean pe = new ProjectDataBean(0, newWriter, newTitle, "2020-12-31 12:11:11", newContent, newImage, "2020-12-31 12:11:11", newGoal, 0, 0, false);
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