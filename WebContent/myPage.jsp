<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ page import="jdbc.ConnectionProvider" %>
<%@ page import ="dto.UserDataBean" %>
<%@ page import="dao.UserDataTableDAO" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>

<%
String userId="test";
%>
<h1><%=userId%>���� ����������</h1>

<%--Col --%>
<%
UserDataBean UserInfo=new UserDataBean();
Connection conn=null;
try{
	conn=ConnectionProvider.getConnection();
	UserDataTableDAO dao=UserDataTableDAO.getInstance();
	UserInfo=dao.select(conn, userId);
	
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
<h2>���� �ݾ�: <%=UserInfo.getMoney() %>��</h2>
<body>
<%--�����ϱ� ���� â ����� �Ҽ� ������ �ϱ� --%>



<div style="float: left;">
	<button type="submit" class="btn btn-primary" name="test"  method="post" onclick="location.href='addMoneyForm.jsp?id=<%=userId%>'">�����ϱ�</button>
</div>
<br><br>
<div style="float: left;">
	<button type="button" class="btn btn-primary" name="test"  onclick="location.href='mainPage.jsp'">Home</button>
</div>

</body>
</html>