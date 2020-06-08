<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.util.List" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
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
					<c:choose>
						<c:when test="${donation.getImageURL() == null || donation.getImageURL().length() == 0}">
							<td width="200" height="150" align="center">이미지없음</td>
						</c:when>
						<c:otherwise>
							<td><img src="${donation.getImageURL()}" width="200" height="150"/></td>
						</c:otherwise>
					</c:choose>
					
					<td><a href="DetailViewAction.do?pid=${donation.getPid()}"><b>${donation.getTitle()}</b></a></td>
					<td>${donation.getWriter()}</td>
					<td>신청일:${donation.getDate()}</td>
					<td>목표금액:${donation.getGoal()}</td>
					<td>모인 금액:${donation.getCurrent()}</td>
					<td>기한:${donation.getDeadline()}</td>
				</tr>
			</c:if>
			<c:if test="${donation.getCategory() eq cat }">
				<tr>
					<c:choose>
						<c:when test="${donation.getImageURL() == null || donation.getImageURL().length() == 0}">
							<td width="200" height="150" align="center">이미지없음</td>
						</c:when>
						<c:otherwise>
							<td><img src="${donation.getImageURL()}" width="200" height="150"/></td>
						</c:otherwise>
					</c:choose>
					<td>${donation.getCategory()}</td>
					<td><a href="DetailViewAction.do?pid=${donation.getPid()}"><b>${donation.getTitle()}</b></a></td>
					<td>${donation.getWriter()}</td>
					<td>신청일:${donation.getDate()}</td>
					<td>목표금액:${donation.getGoal()}</td>
					<td>모인 금액:${donation.getCurrent()}</td>
					<td>기한:${donation.getDeadline()}</td>
				</tr>
			</c:if></c:if>
		</c:forEach>
	</table>
</div>
</div>

</body>
</html>