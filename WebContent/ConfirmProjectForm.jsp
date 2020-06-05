<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ page import="java.util.*" %>
    <%@ page import="dto.ProjectDataBean" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>unauthorized project</title>
</head>
<body>

<%
List<ProjectDataBean> dList=(List<ProjectDataBean>)application.getAttribute("dList");
%>
<a href="index.jsp">Go Home</a>

<form action="ConfirmProjectProcess.jsp">
<table border=1>
<%
	for(ProjectDataBean donation:dList) {
	if(donation.isApproval()==false){ out.println(donation.isApproval());
	%>
		<tr>
		<td><input type="checkbox" name="isApproval" value="true"></td>
		<td><input type="text" name="pid" value="<%=donation.getPid() %>"></td>
		
		<%if(donation.getImageURL() == null||donation.getImageURL().length() == 0) {%>
		<td width="200" height="150" align="center">이미지없음</td>
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
<%}} %>
</table>
<input type="submit" value="Apply">
</form>
</body>
</html>