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
<a class="navbar-brand" href="index.jsp">Home</a>
<<<<<<< HEAD
<h1>${UserInfo.getId()}ë‹˜ì˜ ë§ˆì´í˜ì´ì§€</h1>

<h2>í˜„ì¬ ê¸ˆì•¡: ${UserInfo.getMoney()}ì›</h2>
<h3>ì…ê¸‰ì˜ˆì •ì•¡:${UserInfo.getScheduledMoney()}(ìš°ë¦¬ì€í–‰ 0000-00000-0000)</h3>
<div class = "container">
<div style="float: left;">
	<button type="button" class="btn btn-primary" name="test" onclick="location.href='addMoneyView.jsp'">ì¶©ì „í•˜ê¸°</button>
=======
<h1>${UserInfo.getId()}´ÔÀÇ ¸¶ÀÌÆäÀÌÁö</h1>

<h2>ÇöÀç ±İ¾×: ${UserInfo.getMoney()}¿ø</h2>
<h3>ÀÔ±Ş¿¹Á¤¾×:${UserInfo.getScheduledMoney()}(¿ì¸®ÀºÇà 0000-00000-0000)</h3>
<div class = "container">
<div style="float: left;">
	<button type="button" class="btn btn-primary" name="test" onclick="location.href='addMoneyView.jsp'">ÃæÀüÇÏ±â</button>
>>>>>>> MVC
</div>
<br><br>
<div style="float: left;">
	<button type="button" class="btn btn-primary" name="test"  onclick="location.href='index.jsp'">Home</button>
</div>
</div>
</body>
</html>