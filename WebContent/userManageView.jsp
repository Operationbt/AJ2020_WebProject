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
<a class="navbar-brand" href="index.jsp">Home</a>
<div style="padding-top: 50px">
	<table class="table table-bordered">
		<c:forEach var="user" items="${uList}">
			<c:if test="${user.getScheduledMoney() != 0}">
				<tr>
					<td>${user.getId()}</td><td>${user.getScheduledMoney()}</td>
					<td><a href="#" onclick="depositConfirm('${user.getId()}')">Confirm</a></td>
				</tr>
			</c:if>
		</c:forEach>
	</table>
</div>
</div>
<script type="text/javascript">
	function depositConfirm(id){
		if (confirm(id+"ÃæÀü ½ÂÀÎ")==true) location.href="UserManageAction.do?id="+id;
	else
		return;
		}
</script>
</body>
</html>