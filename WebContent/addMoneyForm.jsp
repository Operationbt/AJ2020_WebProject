<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>�ݾ� ����</title>
</head>
<body>
<% 
//���ǿ��� �α���id �����ͼ� �Ǻ�
String session_userID = (String)session.getAttribute("userID");
%>
<form name="addMoneyForm" action="addMoneyProcess.jsp" method="post">
<div class="form-group row">
			<label class="col-sm-2">������ �ݾ��� �Է��Ͻÿ�</label>
			<div class="col-sm-3"><input type="text" value="0" name="Amount" class="form-control">��</div>
			</div>
			<div class="form-group row">
			<div class="col-sm-offset-2 col-sm-10"><input type="submit" value="Ȯ��"></div>
			</div>
</form>

</body>
</html>