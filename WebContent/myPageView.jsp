<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<title>My Page</title>
</head>
<body>
<a class="navbar-brand" href="index.jsp">Home</a>
<h1>${UserInfo.getId()}���� ����������</h1>

<h2>���� �ݾ�: ${UserInfo.getMoney()}��</h2>
<h3>�Ա޿�����:${UserInfo.getScheduledMoney()}(�츮���� 0000-00000-0000)</h3>
<div class = "container">
<div style="float: left;">
	<button type="button" class="btn btn-primary" name="test" onclick="location.href='addMoneyView.jsp'">�����ϱ�</button>
</div>
<br><br>
<div style="float: left;">
	<button type="button" class="btn btn-primary" name="test"  onclick="location.href='index.jsp'">Home</button>
</div>
</div>
</body>
</html>