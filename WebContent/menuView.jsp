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
	//String userID = (String)session.getAttribute("userID");
	//Boolean isAdmin = (Boolean)session.getAttribute("userAdmin");
	//String userPW = (String)session.getAttribute("userPW");
	//out.print(isAdmin.booleanValue());
	//<c:out value="${isAdmin}" default="-"/>
%>
<nav class="navbar navbar-expand navbar-primary bg-light">	<!-- #17a2b8 이게 info 색상입니다 -->
	<div class="container">
		<div class="navbar-header">
			<a class="navbar-brand" href="/CoffeeWebProject/index.jsp"><font color="#000000">Home</font></a>
		</div>
		<c:if test="${userID == null}">
			<a href="/CoffeeWebProject/signInView.jsp" class="btn btn-light" role="button">Sign In</a>
			<a href="/CoffeeWebProject/signUpView.jsp" class="btn btn-light" role="button">Sign Up</a>
		</c:if>
		<c:if test="${userID != null}">
			<c:if test="${userAdmin == false }">
				<font color="#fffffff">${userID} 님 반갑습니다!</font>
			</c:if>
			<c:if test="${userAdmin == true }">
				<font color="#ff6666">${userID} 님 반갑습니다!</font> <!-- 관리자는 이름에 하이라이트 -->
				<a href="/CoffeeWebProject/manage/ConfirmProjectViewAction" class="btn btn-secondary" role="button">프로젝트 관리</a>
				<a href="/CoffeeWebProject/manage/UserManageViewAction" class="btn btn-secondary" role="button">유저 관리</a>
			</c:if>
			<a href="/CoffeeWebProject/addProjectView.jsp" class="btn btn-light" role="button">모금 프로젝트 신청 &raquo;</a>
			<a href="/CoffeeWebProject/MyPageViewAction.do" class="btn btn-light" role="button">MyPage &raquo;</a>
			<a href="/CoffeeWebProject/sign/SignOutAction" class="btn btn-light" role="button">Sign Out</a>
		</c:if>

	</div>
</nav>
</body>
</html>