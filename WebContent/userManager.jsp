<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
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
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%
Connection conn=null;
try{
	conn=ConnectionProvider.getConnection();
	UserDataTableDAO dao=UserDataTableDAO.getInstance();
	List<UserDataBean> uList=dao.selectList(conn);
	application.setAttribute("uList",uList);
	%>
<br>
<table border=1>
	<tr><td>UserID</td><td>scheduledMoney</td></tr>
	<%	
	for(UserDataBean user:uList) {
	%>
		<tr>
		<td><%=user.getId() %></td><td><%=user.getScheduledMoney() %></td>
		<td><a href="#" onclick="depositConfirm('<%=user.getId()%>')">Confirm</a></td>
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
	function depositConfirm(id){
		if (confirm(id+"님의 wallet에 돈을 추가합니다.")==true) location.href="userManagerProcess.jsp?id="+id;
	else
		return;
		}
</script>
</body>
</html>