<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<title>User Manage View</title>
</head>
<body>
<div class="container">
<<<<<<< HEAD
<a class="navbar-brand" href="../index.jsp">Home</a>
<div style="padding-top: 50px">
	<table class="table table-bordered">
		<c:forEach var="user" items="${uList}">
			<c:if test="${user.getScheduledMoney() != 0}">	<%--입금 대기금액이 0원이 아닌 유저만 보이게 --%>
				<tr>
					<td>${user.getId()}</td>
					<td>${user.getMoney()}</td>
					<td>${user.getScheduledMoney()}</td>
					<td><a href="#" onclick="depositConfirm2('${user.getId()}', '${user.getScheduledMoney()}')">Confirm</a></td>
=======
<a class="navbar-brand" href="index.jsp">Home</a>
<div style="padding-top: 50px">
	<table class="table table-bordered">
		<c:forEach var="user" items="${uList}">
			<c:if test="${user.getScheduledMoney() != 0}">
				<tr>
					<td>${user.getId()}</td><td>${user.getScheduledMoney()}</td>
					<td><a href="#" onclick="depositConfirm('${user.getId()}')">Confirm</a></td>
>>>>>>> MVC
				</tr>
			</c:if>
		</c:forEach>
	</table>
</div>
</div>
<script type="text/javascript">
<<<<<<< HEAD
	function depositConfirm(id, scheduledMoney){
		if (confirm(id + "님의 wallet에 " + scheduledMoney +  "원을 추가합니다.") == true)
			location.href = "ApplyMoneyAction?id=" + id;
		else
			return;
	}
=======
	function depositConfirm(id){
		if (confirm(id+"���� ����")==true) location.href="UserManageAction.do?id="+id;
	else
		return;
		}
>>>>>>> MVC
</script>
</body>
</html>