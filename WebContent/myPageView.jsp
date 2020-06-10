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
<font size="5">${UserInfo.getId()}님의 마이페이지</font><br>

<font size="5">나의 보유 금액:</font><font size="7"> ${UserInfo.getMoney()}원</font><br>
<font size="5">입급 예정 금액:<b>${UserInfo.getScheduledMoney()}</b>원</font><br>
<font size="4">---입금 후 아래 연락처로 연락주시면 확인 후 승인합니다.---</font><br>
<font size="4">(우리은행 0000-00000-0000)</font><br>
<font size="4">홍길동:010-1234-5678</font><br>
<font size="4">coffee@mail.com</font><br>
<font size="4">-------------------------------------------------------------------</font><br>
<br><br>
	<button type="button" class="btn btn-primary" name="test" onclick="location.href='addMoneyView.jsp'">충전하기</button>

<br><br>
</body>
</html>