<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>
<%@ page import="dto.ProjectDataBean" %>
<%@ page import="java.util.*" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<% 
int pid=Integer.parseInt(request.getParameter("pid"));
List<ProjectDataBean> dList= (List<ProjectDataBean>) application.getAttribute("dList");
%>
<form action="donationProcess.jsp?pid=<%=pid %>" method="post">
<div class="form-group row">
<h2>프로젝트명: <%= dList.get(pid-1000).getTitle()%></h2>
		<label class="col-sm-2">기부할 금액</label>
		<div class="col-sm-3"><input type="text" value="0" name="donationAmount" class="form-control">원</div>
		</div>
		<div class="form-group row">
		<div class="col-sm-offset-2 col-sm-10"><input type="submit" value="기부하기"></div>
		</div>
</form>


</body>
</html>
