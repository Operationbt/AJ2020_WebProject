<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="jdbc.ConnectionProvider" %>
<%@ page import="dao.UserDataTableDAO" %>
<%@ page import="dto.UserDataBean" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
String id = request.getParameter("id"); 
int scheduledMoney = Integer.parseInt(request.getParameter("schMoney"));

Connection conn = null;
	try{
		conn = ConnectionProvider.getConnection();
		UserDataTableDAO dao = UserDataTableDAO.getInstance();
		//UserDataBean pastData = dao.select(conn, id);
		//UserDataBean userData = new UserDataBean(id, pastData.getPassword(), pastData.getMoney()+pastData.getScheduledMoney(),0, 0);
		dao.applyMoney(conn, id, scheduledMoney);
		response.sendRedirect("userManager.jsp");
		
	}catch(SQLException e){
		e.printStackTrace();
		System.out.print("No connection in ManagingMoneyProcess\n");
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