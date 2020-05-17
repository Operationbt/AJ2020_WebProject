<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="jdbc.ConnectionProvider" %>
<%@ page import="dao.UserDataTableDAO" %>
<%@ page import="dao.ProjectDataTableDAO" %>
<%@ page import="dto.ProjectDataBean" %>
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
<% String pid=request.getParameter("pid");
out.println(pid);
%>
<%

int newMoney=Integer.parseInt(request.getParameter("donationAmount"));
int pid2=Integer.parseInt(request.getParameter("Pid"));
%>
<%--�̰� ����ǰ� ������������ �ƴ϶� �����̼� �������� ���ư����ϰ������ --%>
<%
Connection conn=null;
try{
	conn=ConnectionProvider.getConnection();
	ProjectDataTableDAO dao=ProjectDataTableDAO.getInstance();
	ProjectDataBean pastData=dao.select(conn, pid2);
	ProjectDataBean ProjectData=new ProjectDataBean(pastData.getPid(),pastData.getWriter(),pastData.getTitle(),pastData.getDate(),
			pastData.getContent(),pastData.getImageURL(),
			pastData.getDeadline(),pastData.getGoal(),pastData.getCurrent()+newMoney,pastData.getSponsor()+1,false);
	dao.editCurrent(conn, ProjectData);
	
	UserDataTableDAO dao2=UserDataTableDAO.getInstance();
	UserDataBean pastData2=dao2.select(conn, "test");
	UserDataBean UserData=new UserDataBean(pastData2.getId(),pastData2.getPassword(),pastData2.getMoney()-newMoney,pastData2.getIsAdmin());
	dao2.editMoney(conn, UserData);
	response.sendRedirect("mainPage.jsp");
	
}catch(SQLException e){
	e.printStackTrace();
	System.out.print("No connection in donation\n");
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