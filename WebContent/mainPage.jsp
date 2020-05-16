<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Coffee Main Page</title>
</head>
<body>
<%-- 메뉴바  홈, 카테고리 --%>


<%-- 회원가입/로그인 버튼 --%>
<div style="float: right;">
	<button type="button" onclick="location.href='signUp.jsp'">회원가입</button>
	<button type="button" onclick="location.href='signIn.jsp'">로그인</button>
</div>
<a href="myPage.jsp?id=test" role="button">MyPage</a>
<button type="button" onclick="location.href='addProjectForm.jsp'">모금 프로젝트 신청</button>
<%-- 개설된 프로젝트 제목과 작은 설명 보여주는 공간 --%>
<div class="container">
	<div style="padding-top:50px">
		<jsp:include page="donationList.jsp"/>
	</div>
</div>



</body>
</html>
