<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="dto.ProjectDataBean" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
int pid = Integer.parseInt(request.getParameter("pid"));
List<ProjectDataBean> dList= (List<ProjectDataBean>) application.getAttribute("dList");

//이미지가 있는지 없는지 확인할 수 있도록 함
String imgURL = dList.get(pid - 1000).getImageURL();
boolean isImgExist = false;
if(imgURL == null || imgURL.equals("")){
	isImgExist = false;
} else{
	isImgExist = true;
}

//D-day 구하는 부분
long dday = new java.util.Date(dList.get(pid-1000).getDeadline().getTime()).getTime();
long today = new java.util.Date().getTime();
long leftTime = dday - today;
int leftDay;
if (leftTime<0){
	leftDay = -1;
}
else{
    leftDay = (int)Math.floor(leftTime/(1000*60*60*24))+1; 
}
%>
	
<div style="float: left;">
	<button type="button" class="btn btn-primary" name="home"  onclick="location.href='mainPage.jsp'">Home</button>
</div>
<br>
<div>
	<h1><%= dList.get(pid-1000).getTitle() %></h1>
	<h4>프로젝트 기간:<%= dList.get(pid-1000).getDate() %> ~ <%= dList.get(pid-1000).getDeadline() %></h4>
	<span style="background-color:yellow">
	<%if(leftDay>=0) {%>
	d-<%=leftDay%>
	<%} else { %>
	종료
	<%} %>
	</span>
	<br>
	후원자 현황: <%=dList.get(pid-1000).getSponsor()%>명
	<br>
	모금 현황: <%=dList.get(pid-1000).getCurrent()%>원
</div>
<div>
	<h3>프로젝트 소개</h3>
	<table width="600">
		<tr>
			<% if(isImgExist){ %>
			<td>
				<img src="<%=dList.get(pid-1000).getImageURL()%>" width="600"/>
			</td>
			<% } %>
		</tr>
		
		<tr>
			<td>
				<%= dList.get(pid-1000).getContent() %>
			</td>
		</tr>
	</table>
</div>
	
<button type="button" onclick="location.href='donationForm.jsp?pid=<%=pid%>'">후원하기</button>

</body>
</html>
