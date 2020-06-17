
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
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/donationListStyle.css">

<title>donationList(authorized)</title>


</head>

<body>

<div class="MainDonateList">

	<!-- 리스트에서 각각의 프로젝트 카드 생성 -->

	<c:forEach var="donation" items="${dList}">

		<c:if test="${donation.isApproval() == true}">

			<c:if test="${cat eq 0  or cat eq null}">

				<!-- 카드 -->

				<c:set var="percent" value="${donation.getCurrent() div donation.getGoal() * 100}"/>	<!-- 아래에서 사용할 모금률 미리 계산 -->

				<a href="${pageContext.request.contextPath}/project/DetailViewAction?pid=${donation.getPid()}" class="card">

					<c:choose>

						<c:when test="${donation.getImageURL() == null || donation.getImageURL().length() == 0}">

							<img src="${pageContext.request.contextPath}/images/default.jpg" alt="" width="265" height="200">

						</c:when>

						<c:otherwise>

							<img src="${donation.getImageURL()}" alt="" width="265" height="200">

						</c:otherwise>

					</c:choose>

					<div class="card_content">

						<strong class="card_title">${donation.getTitle()}</strong>

						<div class="card_organization">${donation.getWriter()}</div>

						<div class="card_bar" aria-label="모금률">

							<!-- 100% 넘는 경우 예외 처리(안하면 뚫고나감) -->

							<c:choose>

								<c:when test="${percent >= 100}">

									<span class="card_bar_collection" style="width:100%"></span>

								</c:when>

								<c:otherwise>

									<span class="card_bar_collection" style="width:<fmt:parseNumber value="${percent}" integerOnly="true"/>%"></span>

								</c:otherwise>

							</c:choose>					

						</div>

						<strong class="card_percent"><fmt:formatNumber value="${percent}" pattern="0.00" />%</strong>

						<strong class="card_money"><fmt:formatNumber value="${donation.getCurrent()}" pattern="#,###" /><span class="text">원</span></strong>

					</div>

				</a>			

			</c:if>

			<c:if test="${donation.getCategory() eq cat }">

				<!-- 카드 -->

				<c:set var="percent" value="${donation.getCurrent() div donation.getGoal() * 100}"/>	<!-- 아래에서 사용할 모금률 미리 계산 -->

				<a href="./DetailViewAction?pid=${donation.getPid()}" class="card">

					<c:choose>

						<c:when test="${donation.getImageURL() == null || donation.getImageURL().length() == 0}">

							<img src="${pageContext.request.contextPath}/images/default.jpg" alt="" width="267" height="200">

						</c:when>

						<c:otherwise>

							<img src="${donation.getImageURL()}" alt="" width="267" height="200">

						</c:otherwise>

					</c:choose>

					<div class="card_content">

						<strong class="card_title">${donation.getTitle()}</strong>

						<div class="card_organization">${donation.getWriter()}</div>

						<div class="card_bar" aria-label="모금률">

							<!-- 100% 넘는 경우 예외 처리(안하면 뚫고나감) -->

							<c:choose>

								<c:when test="${percent >= 100}">

									<span class="card_bar_collection" style="width:100%"></span>

								</c:when>

								<c:otherwise>

									<span class="card_bar_collection" style="width:<fmt:parseNumber value="${percent}" integerOnly="true"/>%"></span>

								</c:otherwise>

							</c:choose>					

						</div>

						<strong class="card_percent"><fmt:formatNumber value="${percent}" pattern="0.00" />%</strong>

						<strong class="card_money"><fmt:formatNumber value="${donation.getCurrent()}" pattern="#,###" /><span class="text">원</span></strong>

					</div>

				</a>	

			</c:if>

		</c:if>

	</c:forEach>

</div>

</body>

</html>