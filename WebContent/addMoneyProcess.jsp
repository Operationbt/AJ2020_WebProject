<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="jdbc.ConnectionProvider" %>
<%@ page import="dao.UserDataTableDAO" %>
<%@ page import="dto.UserDataBean" %>

<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>

<%
int newMoney = Integer.parseInt(request.getParameter("Amount"));
String userid = request.getParameter("id");
%>

<%
Connection conn=null;
try{
	conn=ConnectionProvider.getConnection();
	UserDataTableDAO dao = UserDataTableDAO.getInstance();
	UserDataBean pastData = dao.select(conn, userid);
	UserDataBean userData = new UserDataBean(pastData.getId(), pastData.getPassword(), pastData.getMoney() + newMoney, 0);
	dao.editMoney(conn, userData);
	response.sendRedirect("myPage.jsp?id=" + userid); //myPage로 다시 돌려보내는데 id 같이 안보내면 id가 null됨
	
}catch(SQLException e){
	e.printStackTrace();
	System.out.print("No connection in addMoneyProcess\n");
}finally{
	try{
		if(conn !=null) conn.close();
	}catch(SQLException se){
		se.printStackTrace();
	}
}

%>
</body>
</html>