<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>

<% int pid=Integer.parseInt(request.getParameter("pid"));
%>
<form action="donationProcess.jsp?pid=<%=pid%>"><%--이거 pid안넘어감 --%>
<div class="form-group row">
pid=<%=pid %>
<label class="col-sm-2">프로젝트명</label>
		<div class="col-sm-3"><input type="text" value=<%=pid %> name="Pid" class="form-control"></div>
		</div>
		<label class="col-sm-2">기부할 금액을 입력하시오</label>
		<div class="col-sm-3"><input type="text" value="0" name="donationAmount" class="form-control">원</div>
		</div>
		<div class="form-group row">
		<div class="col-sm-offset-2 col-sm-10"><input type="submit" value="확인"></div>
		</div>
</form>


</body>
</html>