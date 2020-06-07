<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%> 
<%@ page import="jdbc.ConnectionProvider" %>
<%@ page import="dao.ProjectDataTableDAO" %>
<%@ page import="dto.ProjectDataBean" %>
<%@ page import="java.sql.Date" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.text.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%
List<ProjectDataBean> pList=(List<ProjectDataBean>)application.getAttribute("dList");
%>
<%

int pid=Integer.parseInt(request.getParameter("pid"));
//boolean ap=Boolean.parseBoolean(request.getParameter("isApproval"));
System.out.println(pid);
//System.out.println(ap);
ProjectDataBean pe=new ProjectDataBean(pid, null, null, null, null, null, null, 0, 0, 0, true);

%>

<%
	Connection conn = null;
try{
	conn = ConnectionProvider.getConnection();
	ProjectDataTableDAO dao = ProjectDataTableDAO.getInstance(); // getInstance
	dao.editApproval(conn, pe);
	response.sendRedirect("mainPage.jsp");
} catch(SQLException e){
	e.printStackTrace();
} finally{
	try{
		if(conn != null)
	conn.close();
	} catch(SQLException se){
		se.printStackTrace();
	}
}
%>

</body>
</html>