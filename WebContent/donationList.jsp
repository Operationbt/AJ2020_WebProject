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
<br>
<table border=1>
<%
	for(ProjectDataBean donation:dList) {
%>
		<tr>
		if(donation.getImageURL() == null||donation.getImageURL().length() == 0) {%>
		<td><img src="https://lh3.googleusercontent.com/proxy/uC3C_aQbLdW5dP87gTl0O4Cn5zk-dCY2Do7-fMeTtvM5N8xbskTJp6UgLYNJSlD3bXckidcOn81whshPnpzHjqxYTCnBhc_JfZGKIxMyU4SSQamHYA" width="200" height="150"/></td>
		<%} else{ %>
		<td><img src="<%=donation.getImageURL() %>" width="200" height="150"/></td>
		<%} %>	
		<td><a href="donationPage.jsp?pid=<%=donation.getPid()%>"><b><%=donation.getTitle() %></b></a></td>
		<td><%=donation.getWriter() %></td>
		<td>신청일:<%=donation.getDate() %></td>
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
