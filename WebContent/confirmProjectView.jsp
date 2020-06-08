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
<a class="navbar-brand" href="../index.jsp">Home</a>
<div style="padding-top: 50px">
	<table class="table table-bordered">
		<c:forEach var="donation" items="${dList}">
			<c:if test="${donation.isApproval() == false}">
				<tr>
<<<<<<< HEAD
					<td><a href="ConfirmProjectAction?pid=${donation.getPid()}" class="btn btn-secondary" role="button">Approve</a></td>
					<c:choose>
						<c:when test="${donation.getImageURL() == null || donation.getImageURL().length() == 0}">
							<td width="200" height="150" align="center">ì´ë¯¸ì§€ì—†ìŒ</td>
=======
					<td><a href="ConfirmProjectAction.do?pid=${donation.getPid()}" class="btn btn-secondary" role="button">Approve</a></td>
					<c:choose>
						<c:when test="${donation.getImageURL() == null || donation.getImageURL().length() == 0}">
							<td width="200" height="150" align="center">ÀÌ¹ÌÁö¾øÀ½</td>
>>>>>>> MVC
						</c:when>
						<c:otherwise>
							<td><img src="${donation.getImageURL()}" width="200" height="150"/></td>
						</c:otherwise>
					</c:choose>
<<<<<<< HEAD
					<td><a href="../DetailViewAction.do?pid=${donation.getPid()}"><b>${donation.getTitle()}</b></a></td>
					<td>${donation.getWriter()}</td>
					<td>ì‹ ì²­ì¼:${donation.getDate()}</td>
					<td>ëª©í‘œê¸ˆì•¡:${donation.getGoal()}</td>
					<td>ëª¨ì¸ ê¸ˆì•¡:${donation.getCurrent()}</td>
					<td>ê¸°í•œ:${donation.getDeadline()}</td>
=======
					<td><a href="DetailViewAction.do?pid=${donation.getPid()}"><b>${donation.getTitle()}</b></a></td>
					<td>${donation.getWriter()}</td>
					<td>½ÅÃ»ÀÏ:${donation.getDate()}</td>
					<td>¸ñÇ¥±İ¾×:${donation.getGoal()}</td>
					<td>¸ğÀÎ ±İ¾×:${donation.getCurrent()}</td>
					<td>±âÇÑ:${donation.getDeadline()}</td>
>>>>>>> MVC
				</tr>
			</c:if>
		</c:forEach>
	</table>
</div>
</div>
</body>
</html>