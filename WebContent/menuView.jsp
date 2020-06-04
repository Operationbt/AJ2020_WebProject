<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<title>Menu bar</title>
</head>
<body>
<%
	String userID = (String)session.getAttribute("userID");
	//String userPW = (String)session.getAttribute("userPW");
%>
<nav class="navbar navbar-expand navbar-dark bg-dark">
	<div class="container">
		<div class="navbar-header">
			<a class="navbar-brand" href="index.jsp">Home</a>
		</div>
		<c:if test="${userID == null}">
			<a href="signInView.jsp" class="btn btn-secondary" role="button">Sign In</a>
			<a href="signUpView.jsp" class="btn btn-secondary" role="button">Sign Up</a>
		</c:if>
		<c:if test="${userID != null}">
			<font color="#fffffff">${userID} 님 반갑습니다!</font>
			<a href="donationForm.jsp" class="btn btn-secondary" role="button">모금 프로젝트 신청 &raquo;</a>
			<a href="myPage.jsp?id=${userID}" class="btn btn-secondary" role="button">MyPage &raquo;</a>
			<a href="SignOutAction.do" class="btn btn-secondary" role="button">Sign Out</a>
		</c:if>

	</div>
</nav>
</body>
</html>