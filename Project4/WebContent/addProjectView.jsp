<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add Project View</title>
</head>
<body>
<a href="index.jsp" role="button">Home</a>

<h1>프로젝트 개설 신청</h1>

<div class="container">
	<form name="addProjectForm" action="AddProjectAction.do" method="post">
		<table class="table table-bordered">
			<tr align="center">
				<td width="150">주체명</td>
				<td width="450"><input type="text" name="writer"></td>
			</tr>
			
			<tr align="center">
				<td width="150">카테고리</td>
				<td>
				<select name="category">
				<option value="0">전체(All)</option>
				<option value="1">아동(Child)</option>
				<option value="2">장애인(Disabled)</option>
				<option value="3">동물(Animal)</option>
				<option value="4">환경(Environment)</option>
				<option value="5">가족(Family)</option>
				</select></td></tr> 
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
</div>
</body>
</html>