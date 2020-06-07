<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ page import="java.util.*" %>
    <%@ page import="dto.ProjectDataBean" %><%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>unauthorized project</title>
</head>
<body>

<%
List<ProjectDataBean> pList=(List<ProjectDataBean>)application.getAttribute("dList");
%>
<a href="index.jsp">Go Home</a>


<table border=1>
<%
	for(ProjectDataBean donation:pList) {
	if(donation.isApproval()==false){ out.println(donation.isApproval());
	%>
		<tr>
		<td><a href="ConfirmProjectProcess.jsp?pid=<%=donation.getPid()%>" class="btn btn-secondary" role="button">Apply</a></td>
		<td>${donation.getPid() }</td>
		<%if(donation.getImageURL() == null||donation.getImageURL().length() == 0) {%>
		<td width="200" height="150" align="center">�̹�������</td>
		<%} else{ %>
		<td><img src="<%=donation.getImageURL() %>" width="200" height="150"/></td>
		<%} %>	
		<td><a href="donationPage.jsp?pid=<%=donation.getPid()%>"><b><%=donation.getTitle() %></b></a></td>
		<td><%=donation.getWriter() %></td>
		<td>��û��:<%=donation.getDate() %></td>
		<td>��ǥ�ݾ�:<%=donation.getGoal() %></td>
		<td>����:<%=donation.getDeadline() %></td>
		
		
		</tr>
<%}} %>
</table>


</body>
</html>