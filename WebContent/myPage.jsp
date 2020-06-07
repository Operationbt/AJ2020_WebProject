<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="jdbc.ConnectionProvider" %>
<%@ page import ="dto.UserDataBean" %>
<%@ page import="dao.UserDataTableDAO" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
//마이페이지는 로그인 사용자만 볼 수 있음
//세션에서 로그인id 가져와서 판별
String session_userID = (String)session.getAttribute("userID");
%>
<h1><%=session_userID%>님의 마이페이지</h1>

<%-- Col --%>
<%
UserDataBean UserInfo = new UserDataBean();
Connection conn = null;
try{
	conn = ConnectionProvider.getConnection();
	UserDataTableDAO dao = UserDataTableDAO.getInstance();
	UserInfo = dao.select(conn, session_userID);
	
}catch(SQLException e){
	e.printStackTrace();
	System.out.print("No connection in myPage\n");
}finally{
	try{
		if(conn !=null) conn.close();
	}catch(SQLException se){
		se.printStackTrace();
	}
}
%>
<h2>현재 금액: <%=UserInfo.getMoney()%>원</h2>
<h3>입급예정액:<%=UserInfo.getScheduledMoney()%>(우리은행 0000-00000-0000)</h3>

<%--충전하기 새로 창 띄워서 할수 있으면 하기 --%>



<div style="float: left;">
	<button type="submit" class="btn btn-primary" name="test"  method="post" onclick="location.href='addMoneyForm.jsp'">충전하기</button>
</div>
<br><br>
<div style="float: left;">
	<button type="button" class="btn btn-primary" name="test"  onclick="location.href='mainPage.jsp'">Home</button>
</div>

</body>
</html>