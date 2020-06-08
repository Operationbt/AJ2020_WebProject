<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<title>Project Detail Page</title>
</head>
<body>

<div class="container">
<div class="col-md-12">
	<button type="button" class="btn btn-primary" name="home"  onclick="location.href='index.jsp'">Home</button>
</div>
</div>

<div class="container" style="padding-top: 50px">
<h1>${project.getTitle()}</h1>
<<<<<<< HEAD
<h4>í”„ë¡œì íŠ¸ ê¸°ê°„:${project.getDate()} ~ ${project.getDeadline()}</h4>
=======
<h4>ÇÁ·ÎÁ§Æ® ±â°£:${project.getDate()} ~ ${project.getDeadline()}</h4>
>>>>>>> MVC
<span style="background-color:yellow">
	<c:choose>
		<c:when test="${leftDay >= 0}">
			d-${leftDay}
		</c:when>
		<c:otherwise>
<<<<<<< HEAD
			ì¢…ë£Œ
=======
			Á¾·á
>>>>>>> MVC
		</c:otherwise>
	</c:choose>
</span>
<br>
<<<<<<< HEAD
í›„ì›ì í˜„í™©: ${project.getSponsor()}ëª…
<br>
ëª¨ê¸ˆ í˜„í™©: ${project.getCurrent()}ì›
<h3>í”„ë¡œì íŠ¸ ì†Œê°œ</h3>
<table width="600px">
	<c:if test="${project.getImageURL() != null || project.getImageURL().length() != 0}">
	<tr>
		<td>
			<img src="${project.getImageURL()}" width="600"/>
		</td>
=======
ÈÄ¿øÀÚ ÇöÈ²: ${project.getSponsor()}¸í
<br>
¸ğ±İ ÇöÈ²: ${project.getCurrent()}¿ø
<h3>ÇÁ·ÎÁ§Æ® ¼Ò°³</h3>
<table width="600px">
	<c:if test="${project.getImageURL() != null || project.getImageURL().length() != 0}">
	<tr>
		<td><img src="${project.getImageURL()}" width="600"/></td>
>>>>>>> MVC
	</tr>
	</c:if>
	
	<tr>
<<<<<<< HEAD
		<td>
			<pre>${project.getContent()}</pre>
		</td>
	</tr>
</table>
	<a href="DonateViewAction.do?pid=${project.getPid()}" class="btn btn-secondary" role="button">í›„ì›í•˜ê¸°</a>
=======
		<td><pre>${project.getContent()}</pre></td>
	</tr>
</table>
	<a href="DonateViewAction.do?pid=${project.getPid()}" class="btn btn-secondary" role="button">ÈÄ¿øÇÏ±â</a>
>>>>>>> MVC
</div>

</body>
</html>