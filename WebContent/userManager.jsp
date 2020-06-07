<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="jdbc.ConnectionProvider" %>
<%@ page import="dao.UserDataTableDAO" %>
<%@ page import="dto.UserDataBean" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.Date" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
/*
관리자 권한이 있는 사람만 올 수 있는 userManage 페이지(View)
1. 입금 예정 금액 보고 승인해주기 (구현됨)
2. 계정 수정 (미구현)
3. 계정 삭제 (미구현)
*/

Connection conn=null;
try{
	conn=ConnectionProvider.getConnection();
	UserDataTableDAO dao = UserDataTableDAO.getInstance();
	List<UserDataBean> uList = dao.selectList(conn);
	application.setAttribute("uList",uList);
	%>
<br>
<table border=1>
	<tr>
		<td>UserID</td>
		<td>Money</td>
		<td>scheduledMoney</td>
	</tr>
	<%	
	for(UserDataBean user:uList) {
	%>
		<tr>
			<td><%=user.getId() %></td>
			<td><%=user.getMoney() %></td>
			<td><%=user.getScheduledMoney() %></td>
			<td><a href="#" onclick="depositConfirm('<%=user.getId()%>', '<%=user.getScheduledMoney()%>')">Confirm</a></td>
		</tr>
<%} %>
</table>
	<%
}catch(SQLException e){
	e.printStackTrace();
	System.out.print("No connection in userList\n");
}finally{
	try{
		if(conn !=null) conn.close();
	}catch(SQLException se){
		se.printStackTrace();
	}
}
%>
<a href="index.jsp">Home</a>
<script type="text/javascript">
	function depositConfirm(id, scheduledMoney){
		if (confirm(id + "님의 wallet에 " + scheduledMoney +  "원을 추가합니다.") == true)
			location.href="userManagerProcess.jsp?id=" + id + "&schMoney=" + scheduledMoney;
		else
			return;
	}
	
	//MVC2로 분리중인 테스트 함수
	//userManagerView 만들고 폼 형식으로 데이터 submit
	function depositConfirm2(id, scheduledMoney){
		if (confirm(id + "님의 wallet에 " + scheduledMoney +  "원을 추가합니다.") == true)
			location.href = "manage/ApplyMoneyAction";
		else
			return;
	}
</script>
</body>
</html>