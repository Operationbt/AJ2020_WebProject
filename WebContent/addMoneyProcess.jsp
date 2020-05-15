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

int newMoney=Integer.parseInt(request.getParameter("Amount"));

%>

<%
Connection conn=null;
try{
	conn=ConnectionProvider.getConnection();
	UserDataTableDAO dao=UserDataTableDAO.getInstance();
	UserDataBean pastData=dao.select(conn, "test");
	UserDataBean userData=new UserDataBean(pastData.getId(),pastData.getPassword(),pastData.getMoney()+newMoney,0);
	dao.editMoney(conn, userData);
	response.sendRedirect("myPage.jsp");
	
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