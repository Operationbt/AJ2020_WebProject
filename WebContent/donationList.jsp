<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<title>donationList(authorized)</title>
</head>
<body>
<div class="container">
	<div style="padding-top: 50px">
		<table class="table table-bordered">
			<c:forEach var="donation" items="${dList}">
				<c:if test="${donation.isApproval() == true}">
					<c:if test="${cat eq 0  or cat eq null}">
						<tr>
							<td><p style="font-size: 20px; font-weight: bolder;"><fmt:formatNumber value="${donation.getCurrent() div donation.getGoal() * 100}" pattern="0.00"/>%<p></td>
							<c:choose>
								<c:when test="${donation.getImageURL() == null || donation.getImageURL().length() == 0}">
									<td><img src="images/default.jpg" width="200" height="150"/></td>
								</c:when>
								<c:otherwise>
									<td><img src="${donation.getImageURL()}" width="200" height="150"/></td>
								</c:otherwise>
							</c:choose>
							<td width="300"><a href="DetailViewAction.do?pid=${donation.getPid()}"><b>${donation.getTitle()}</b></a>
							<br><font size="2" color="666666">${donation.getWriter()}</font></td>
							<td width="150">${donation.getDate()} ~ ${donation.getDeadline()}</td>
							<td>${donation.getGoal()} 원 목표</td>
							<td>모인 금액: ${donation.getCurrent()}</td>
						</tr>
					</c:if>
					<c:if test="${donation.getCategory() eq cat }">
						<tr>
							<td><p style="font-size: 20px; font-weight: bolder;"><fmt:formatNumber value="${donation.getCurrent() div donation.getGoal() * 100}" pattern="0.00"/>%<p></td>
							<c:choose>
								<c:when test="${donation.getImageURL() == null || donation.getImageURL().length() == 0}">
									<td><img src="images/default.jpg" width="200" height="150"/></td>
								</c:when>
								<c:otherwise>
									<td><img src="${donation.getImageURL()}" width="200" height="150"/></td>
								</c:otherwise>
							</c:choose>
							<td width="300"><a href="DetailViewAction.do?pid=${donation.getPid()}"><b>${donation.getTitle()}</b></a>
							<br><font size="2" color="666666">${donation.getWriter()}</font></td>
							<td width="150">${donation.getDate()} ~ ${donation.getDeadline()}</td>
							<td>${donation.getGoal()} 원 목표</td>
							<td>모인 금액: ${donation.getCurrent()}</td>
						</tr>
					</c:if>
				</c:if>
			</c:forEach>
		</table>
	</div>
</div>
</body>
</html>