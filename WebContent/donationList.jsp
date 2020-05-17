<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="jdbc.ConnectionProvider" %>
<%@ page import="dao.ProjectDataTableDAO" %>
<%@ page import="dto.ProjectDataBean" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.Date" %>


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
	application.setAttribute("dList",dList);
	%>
<table border=1>
<%
	for(ProjectDataBean donation:dList) {
%>
		<tr>
		<td><a href="donationPage.jsp?pid=<%=donation.getPid()%>"><b><%=donation.getTitle() %></b></a></td>
		<td><%=donation.getWriter() %></td>
		<td><%=donation.getContent() %></td>
		<td>목표금액:<%=donation.getGoal() %></td>
		<td>모인 금액:<%=donation.getCurrent() %></td>
		<td>기한:<%=donation.getDeadline() %></td>
		</tr>
<%} %>
</table>
	<%
}catch(SQLException e){
	e.printStackTrace();
	System.out.print("No connection in donationList\n");
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