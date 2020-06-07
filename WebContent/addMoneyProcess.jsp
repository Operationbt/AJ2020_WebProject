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
//세션에서 로그인id 가져와서 판별
String session_userID = (String)session.getAttribute("userID");

//혹시나 비로그인 사용자가 addMoney 프로세스에 도달할 경우를 대비
if(session_userID == null || session_userID.equals("")){
	out.println("로그인 사용자가 아님!");
} else {
	Connection conn=null;
	try{
		conn=ConnectionProvider.getConnection();
		UserDataTableDAO dao = UserDataTableDAO.getInstance();
		UserDataBean pastData = dao.select(conn, session_userID);
		UserDataBean userData = new UserDataBean(pastData.getId(), pastData.getPassword(), pastData.getMoney(), pastData.getScheduledMoney() + newMoney, 0);
		dao.applyMoney(conn, userData);
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
}


%>
</body>
</html>