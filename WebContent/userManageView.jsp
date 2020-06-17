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
<a class="navbar-brand" href="../index.jsp">Home</a>
<div style="padding-top: 50px">
	<table class="table table-bordered">
	        <tr><td>UserID</td><td>보유금액</td><td>입금 예정 금액</td><td></td></tr>
		<c:forEach var="user" items="${uList}">
			<c:if test="${user.getScheduledMoney() != 0}">	<%--입금 대기금액이 0원이 아닌 유저만 보이게 --%>
				<tr>
					<td>${user.getId()}</td>
					<td>${user.getMoney()}</td>
					<td>${user.getScheduledMoney()}</td>
					<td><a href="#" onclick="depositConfirm('${user.getId()}', '${user.getScheduledMoney()}')">Confirm</a></td>
				</tr>
			</c:if>
		</c:forEach>
	</table>
</div>
</div>
<script type="text/javascript">
	function depositConfirm(id, scheduledMoney){
		if (confirm(id + "님의 wallet에 " + scheduledMoney +  "원을 추가합니다.") == true)
			location.href = "ApplyMoneyAction?id=" + id;
		else
			return;
	}
</script>
</body>
</html>