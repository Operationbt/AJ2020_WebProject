<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>프로젝트 신청</title>
</head>
<body>

<a href="mainPage.jsp" role="button">MainPage</a>
<h1>프로젝트 개설 신청</h1>
<form name=addProjectForm" action="addProjectProcess.jsp" method="post">
<table border="1" width="600">
	<tr align="center">
		<td width="150">주체명</td>
		<td width="450"><input type="text" name="writer"></td>
	</tr>
	
	<tr align="center">
		<td width="150">프로젝트 제목</td>
		<td width="450"><input type="text" name="title"></td>
	</tr>
	
	<tr align="center">
		<td width="150">마감기한</td>
		<td width="450"><input type="date" min="2020-05-22" max="2022-05-22" name="deadline"></td>
	</tr>
		
	<tr align="center">
		<td width="150">모금 목표 금액</td>
		<td width="450"><input type="text" name="goal">원</td>
	</tr>	
</table>
<br>
<div>
프로젝트 소개<br>
<textarea name = "content" cols="100" rows="30" placeholder="프로젝트 진행 계기, 상세 내용 및 계획을 작성해주세요.">
</textarea>
</div>
<br>

<div>
이미지 첨부<br>
<input type="text" name="imageURL">
</div>
<br>

<div>
<input type="submit" value="프로젝트 개설 신청하기">
</div>
</form>

</body>
</html>