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
<h4>프로젝트 기간:${project.getDate()} ~ ${project.getDeadline()}</h4>
=======
<h4>������Ʈ �Ⱓ:${project.getDate()} ~ ${project.getDeadline()}</h4>
>>>>>>> MVC
<span style="background-color:yellow">
	<c:choose>
		<c:when test="${leftDay >= 0}">
			d-${leftDay}
		</c:when>
		<c:otherwise>
<<<<<<< HEAD
			종료
=======
			����
>>>>>>> MVC
		</c:otherwise>
	</c:choose>
</span>
<br>
<<<<<<< HEAD
후원자 현황: ${project.getSponsor()}명
<br>
모금 현황: ${project.getCurrent()}원
<h3>프로젝트 소개</h3>
<table width="600px">
	<c:if test="${project.getImageURL() != null || project.getImageURL().length() != 0}">
	<tr>
		<td>
			<img src="${project.getImageURL()}" width="600"/>
		</td>
=======
�Ŀ��� ��Ȳ: ${project.getSponsor()}��
<br>
��� ��Ȳ: ${project.getCurrent()}��
<h3>������Ʈ �Ұ�</h3>
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
	<a href="DonateViewAction.do?pid=${project.getPid()}" class="btn btn-secondary" role="button">후원하기</a>
=======
		<td><pre>${project.getContent()}</pre></td>
	</tr>
</table>
	<a href="DonateViewAction.do?pid=${project.getPid()}" class="btn btn-secondary" role="button">�Ŀ��ϱ�</a>
>>>>>>> MVC
</div>

</body>
</html>