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
<form action="donationProcess.jsp?pid=<%=pid%>"><%--�̰� pid�ȳѾ --%>
<div class="form-group row">
pid=<%=pid %>
<label class="col-sm-2">������Ʈ��</label>
		<div class="col-sm-3"><input type="text" value=<%=pid %> name="Pid" class="form-control"></div>
		</div>
		<label class="col-sm-2">����� �ݾ��� �Է��Ͻÿ�</label>
		<div class="col-sm-3"><input type="text" value="0" name="donationAmount" class="form-control">��</div>
		</div>
		<div class="form-group row">
		<div class="col-sm-offset-2 col-sm-10"><input type="submit" value="Ȯ��"></div>
		</div>
</form>


</body>
</html>