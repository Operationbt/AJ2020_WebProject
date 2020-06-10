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
<nav class="navbar navbar-expand navbar-primary bg-info">
	<div class="container">
		<div class="navbar-header">
			<a class="navbar-brand" href="index.jsp"><font color="FFFFFF">Home</font></a>
		</div>
		<c:if test="${userID == null}">
			<a href="signInView.jsp" class="btn btn-light" role="button">Sign In</a>
			<a href="signUpView.jsp" class="btn btn-light" role="button">Sign Up</a>
		</c:if>
		<c:if test="${userID != null}">
			<c:if test="${userAdmin == false }">
				<font color="#fffffff">${userID} 님 반갑습니다!</font>
			</c:if>
			<c:if test="${userAdmin == true }">
				<font color="#ff6666">${userID} 님 반갑습니다!</font> <!-- 관리자는 이름에 하이라이트 -->
				<a href="manage/ConfirmProjectViewAction" class="btn btn-secondary" role="button">프로젝트 관리</a>
				<a href="manage/UserManageViewAction" class="btn btn-secondary" role="button">유저 관리</a>
			</c:if>
			<a href="addProjectView.jsp" class="btn btn-light" role="button">모금 프로젝트 신청 &raquo;</a>
			<a href="MyPageViewAction.do" class="btn btn-light" role="button">MyPage &raquo;</a>
			<a href="sign/SignOutAction" class="btn btn-light" role="button">Sign Out</a>
		</c:if>

	</div>
</nav>
</body>
</html>