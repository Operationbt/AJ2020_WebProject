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
int pid2=Integer.parseInt(pid);
%>
<%
String session_userID = (String)session.getAttribute("userID");
int newMoney=Integer.parseInt(request.getParameter("donationAmount"));
%>
<%--이거 종료되고 메인페이지가 아니라 도네이션 페이지로 돌아가게하고싶은데 --%>
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
	dao.editSponsor(conn, ProjectData);
	
	UserDataTableDAO dao2=UserDataTableDAO.getInstance();
	UserDataBean pastData2=dao2.select(conn, session_userID);
	UserDataBean UserData=new UserDataBean(pastData2.getId(),pastData2.getPassword(),pastData2.getMoney()-newMoney,pastData2.getIsAdmin());
	dao2.editMoney(conn, UserData);
	
	//donationList 안 거치고 바로 donationPage에서 업데이트한 dList 얻기 위해서
	ProjectDataTableDAO dao3=ProjectDataTableDAO.getInstance();
	List<ProjectDataBean> dList=dao3.selectList(conn);
	application.setAttribute("dList",dList);
	
	response.sendRedirect("donationPage.jsp?pid="+ pid);
	
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
