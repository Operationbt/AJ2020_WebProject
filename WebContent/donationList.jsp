<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="jdbc.ConnectionProvider" %>
<%@ page import="dao.ProjectDataTableDAO" %>
<%@ page import="dto.ProjectDataBean" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>


<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%
Connection conn=null;
try{
	conn=ConnectionProvider.getConnection();
	ProjectDataTableDAO dao=ProjectDataTableDAO.getInstance();
	List<ProjectDataBean> dList=dao.selectList(conn);
	%>
<table>
<%
	for(ProjectDataBean donation:dList) {
%>
		<tr>
		<td><b><%=donation.getTitle() %></b></td>
		<td><%=donation.getWriter() %></td>
		<td><%=donation.getContent() %></td>
		<td><%=donation.getGoal() %></td>
		<td><%=donation.getDeadline() %></td>
		
		</tr>
<%} %>
</table>
	<%
}catch(SQLException e){
	e.printStackTrace();
	System.out.print("No connection in addMoneyProcess\n");
}finally{
	try{
		if(conn !=null) conn.close();
	}catch(SQLException se){
		se.printStackTrace();
	}
}

%>
</body>
</html>