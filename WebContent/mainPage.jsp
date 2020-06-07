<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="referrer" content="no-referrer"/>
<title>Coffee Main Page</title>
</head>
<body>
<%
boolean isSignIn = false;
boolean isSignOut = false;

//세션에서 로그인id 가져와서 판별
String session_userID = (String)session.getAttribute("userID");
out.println("session_userID:" + session_userID);
if(session_userID == null || session_userID.equals("")){	//세션에 로그인 아이디 없으면
	isSignIn = false;	//로그인 상태가 아니다
} else {	
	isSignIn = true;	//로그인 상태다
}

if(isSignIn){	//현재 로그인 상태면
%>
	<%-- 마이페이지/로그아웃 버튼 --%>
	<div style="float: right">
		<p><%=session_userID%>님 반갑습니다!</p>
		<a href="myPage.jsp?id=<%=session_userID%>" role="button">MyPage</a>	<%-- BUG : 주소창에 id= 다음 DB에 있는 아이디 입력하면 로그인 한 아이디 아닌데도 정보 열람 가능--%>
		<button onClick="location.href='signOut.jsp'">로그아웃</button>
		<button type="button" onclick="location.href='addProjectForm.jsp'">모금 프로젝트 신청</button>
	</div>
<%
} else {	//현재 로그인 상태가 아니면
%>
	
	
	<%-- 회원가입/로그인 버튼 --%>
	<div style="float: right;">
		<button type="button" onclick="location.href='signUp.jsp'">회원가입</button>
		<button type="button" onclick="location.href='signIn.jsp'">로그인</button>
	</div>
<%
}
%>

<%-- 전체 사용자에게 동일하게 보여주는 부분 (로그인 상관 no) --%>
<a href="ConfirmProjectForm.jsp">Go to temp</a>
<br><a href="userManager.jsp">User</a>
<%-- 메뉴바  홈, 카테고리 --%>

<%-- 개설된 프로젝트 제목과 작은 설명 보여주는 공간 --%>
<div class="container">
	<div style="padding-top:50px">
		<jsp:include page="donationList.jsp"/>
	</div>
</div>

</body>
</html>
