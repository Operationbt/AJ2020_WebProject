<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<title>Project Detail Page</title>
</head>
<body>
<%
	String userID = (String)session.getAttribute("userID");
%>
<div class="container">
<div class="col-md-12">
	<button type="button" class="btn btn-primary" name="home"  onclick="location.href='index.jsp'">Home</button>
</div>
</div>

<div class="container" style="padding-top: 50px">
<h1>${project.getTitle()}</h1>
<h4>프로젝트 기간:${project.getDate()} ~ ${project.getDeadline()}</h4>
<span style="background-color:yellow">
	<c:choose>
		<c:when test="${leftDay >= 0}">
			d-${leftDay}
		</c:when>
		<c:otherwise>
			종료
		</c:otherwise>
	</c:choose>
</span>
<br>
후원자 현황: ${project.getSponsor()}명
<br>
모금 현황: ${project.getCurrent()}원
<h3>프로젝트 소개</h3>
<table width="600px">
	<c:if test="${project.getImageURL() != null || project.getImageURL().length() != 0}">
	<tr>
		<td><img src="${project.getImageURL()}" width="600"/></td>
	</tr>
	</c:if>
	</table>
	
	<table width="600">
	<tr>
		<td><pre-wrap>${project.getContent()}</pre-wrap></td>
	</tr>
</table>
	<c:choose>
	<c:when test="${leftDay<0 }">기한 종료</c:when>
	<c:when test="${userID==null }">후원하려면 로그인하세요</c:when>
	<c:when test="${userID!=null }"><a href="DonateViewAction.do?pid=${project.getPid()}" class="btn btn-secondary" role="button">후원하기</a></c:when>
	</c:choose>
	
</div>

</body>
</html>