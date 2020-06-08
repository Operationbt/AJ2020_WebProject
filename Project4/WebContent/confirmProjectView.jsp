<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
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
<a class="navbar-brand" href="index.jsp">Home</a>
<div style="padding-top: 50px">
	<table class="table table-bordered">
		<c:forEach var="donation" items="${dList}">
			<c:if test="${donation.isApproval() == false}">
				<tr>
					<td><a href="#" onclick="ApproveConfirm('${donation.getTitle()}','${donation.getPid() }')" class="btn btn-secondary">Approve</a></td>
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
<script type="text/javascript">
	function ApproveConfirm(name,pid){
		if (confirm(name+"�����ϰڽ��ϱ�?")==true) location.href="ConfirmProjectAction.do?pid="+pid;
	else
		return;
		}
</script>
</body>
</html>