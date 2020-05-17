<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
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
<% int pid=Integer.parseInt(request.getParameter("pid"));
List<ProjectDataBean> dList= (List<ProjectDataBean>) application.getAttribute("dList");

%>
<h1><% dList.get(pid-1000).getTitle();%></h1>
<h2>Hello!!!</h2>

<button type="button" onclick="location.href='donationForm.jsp'">기부하기</button>
<div style="float: left;">
	<button type="button" class="btn btn-primary" name="test"  onclick="location.href='mainPage.jsp'">Home</button>
</div>

</body>
</html>