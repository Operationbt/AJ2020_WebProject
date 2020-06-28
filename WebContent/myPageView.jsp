<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<title>My Page</title>
</head>
<body>
<jsp:include page="menuView.jsp" />
<div class="jumbotron" width=600px>
<div class="container" style="padding-top: 0px; width:400px; margin-left:100px; margin-top:0px; margin-right:100px">
<table>
<tr><td> <h3 style="text-align: center;">  ${UserInfo.getId()}님의 마이페이지</h3></td><td><img src="images/user.jpg" width=50px height=50px; left=50px></td></tr>
<tr></tr>
<tr><td>보유금액</td><td>${UserInfo.getMoney()}원</td></tr>
<tr><td>입금 예정금액</td><td>${UserInfo.getScheduledMoney()}원</td></tr><br>
<tr><td></td></tr>
<tr><td><button type="button" class="btn btn-secondary" name="test" onclick="location.href='addMoneyView.jsp'">충전하기</button></td></tr>
</table>
<table>
<font size="2">---입금 후 아래 연락처로 연락주시면 확인 후 승인합니다.---<br>
우리은행 0000-00000-0000 홍길동<br>
coffee@mail.com<br>
</font><br>
</table>
</div>
 </div>
 내가 개설한 프로젝트 <br>

 <c:forEach var="project" items="${userDonationList}">
 <c:if test="${project.getWriter() eq UserInfo.getId()}">

 <td><a href="DetailViewAction.do?pid=${project.getPid()}" class="card">${project.getTitle()}</a>

 </c:if>
 </c:forEach>


<br><br>
</body>
</html>