<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<title>donationList(authorized)</title>
</head>
<body>

<div class="container">
<a class="navbar-brand" href="index.jsp">Home</a>
<div style="padding-top: 50px">
	<table class="table table-bordered">
		<c:forEach var="donation" items="${dList}">
			<c:if test="${donation.isApproval() == false}">
				<tr>
					<td><a href="ConfirmProjectAction.do?pid=${donation.getPid()}" class="btn btn-secondary" role="button">Approve</a></td>
					<c:choose>
						<c:when test="${donation.getImageURL() == null || donation.getImageURL().length() == 0}">
							<td width="200" height="150" align="center">�̹�������</td>
						</c:when>
						<c:otherwise>
							<td><img src="${donation.getImageURL()}" width="200" height="150"/></td>
						</c:otherwise>
					</c:choose>
					<td><a href="DetailViewAction.do?pid=${donation.getPid()}"><b>${donation.getTitle()}</b></a></td>
					<td>${donation.getWriter()}</td>
					<td>��û��:${donation.getDate()}</td>
					<td>��ǥ�ݾ�:${donation.getGoal()}</td>
					<td>���� �ݾ�:${donation.getCurrent()}</td>
					<td>����:${donation.getDeadline()}</td>
				</tr>
			</c:if>
		</c:forEach>
	</table>
</div>
</div>
</body>
</html>