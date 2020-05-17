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
String userId = request.getParameter("id");
%>
<h1><%=userId%>님의 마이페이지</h1>

<%-- Col --%>
<%
UserDataBean UserInfo = new UserDataBean();
Connection conn = null;
try{
	conn = ConnectionProvider.getConnection();
	UserDataTableDAO dao = UserDataTableDAO.getInstance();
	UserInfo = dao.select(conn, userId);
	
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

<%--충전하기 새로 창 띄워서 할수 있으면 하기 --%>



<div style="float: left;">
	<button type="submit" class="btn btn-primary" name="test"  method="post" onclick="location.href='addMoneyForm.jsp?id=<%=userId%>'">충전하기</button>
</div>
<br><br>
<div style="float: left;">
	<button type="button" class="btn btn-primary" name="test"  onclick="location.href='mainPage.jsp'">Home</button>
</div>

</body>
</html>