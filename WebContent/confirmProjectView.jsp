<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<title>donationList(authorized)</title>
<style type="text/css">	
  td{/*이거 왜 안먹히는지?*/
    vertical-align: middle;
  }
</style>
</head>
<body>
<jsp:include page="menuView.jsp" />
<div class="container">
	<div style="padding-top: 50px">
		<table class="table table-bordered" style="text-align: center;">
			<tr>
				<td style="vertical-align: middle;">승인</td>
				<td style="vertical-align: middle;">대표 이미지</td>
				<td style="vertical-align: middle;">제목</td>
				<td style="vertical-align: middle;">UserID</td>
				<td style="vertical-align: middle;">신청일</td>
				<td style="vertical-align: middle;">목표금액</td>
				<td style="vertical-align: middle;">모인금액</td>
				<td style="vertical-align: middle;">마감일</td>
			</tr>
			<c:forEach var="donation" items="${dList}">
				<c:if test="${donation.isApproval() == false}">
					<tr>
						<td style="vertical-align: middle;"><a href="#" onclick="ApproveConfirm('${donation.getTitle()}','${donation.getPid() }')" class="btn btn-secondary">Approve</a></td>
						<c:choose>
							<c:when test="${donation.getImageURL() == null || donation.getImageURL().length() == 0}">
								<td width="200" height="150" align="center">이미지없음</td>
							</c:when>
							<c:otherwise>
								<td><img src="${donation.getImageURL()}" width="200" height="150"/></td>
							</c:otherwise>
						</c:choose>
						<td style="vertical-align: middle;"><a href="../DetailViewAction.do?pid=${donation.getPid()}"><b>${donation.getTitle()}</b></a></td>
						<td style="vertical-align: middle;">${donation.getWriter()}</td>
						<td style="vertical-align: middle;">${donation.getDate()}</td>
						<td style="vertical-align: middle;">${donation.getGoal()}</td>
						<td style="vertical-align: middle;">${donation.getCurrent()}</td>
						<td style="vertical-align: middle;">${donation.getDeadline()}</td>
					</tr>
				</c:if>
			</c:forEach>
		</table>
	</div>
</div>
<script type="text/javascript">
	function ApproveConfirm(name,pid){
		if (confirm(name+"승인하겠습니까?")==true) location.href="ConfirmProjectAction?pid="+pid;
	else
		return;
		}
</script>
</body>
</html>