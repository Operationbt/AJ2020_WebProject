<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Coffee Main Page</title>
</head>
<body>
<%-- [메뉴바]  홈 이동, 카테고리, 로그인, 로그아웃, 회원가입 --%>
<jsp:include page="menuView.jsp" />

<%-- 전체 사용자에게 동일하게 보여주는 부분 (로그인 상관 no) --%>



<%-- 개설된 프로젝트 제목과 작은 설명 보여주는 공간 --%>
<div class="container">
	<div style="padding-top:50px">
		<jsp:include page="donationList.jsp"/>
	</div>
</div>

</body>
</html>
