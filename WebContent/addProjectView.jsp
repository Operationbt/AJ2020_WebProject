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

<<<<<<< HEAD
<h1>프로젝트 개설 신청</h1>
=======
<h1>������Ʈ ���� ��û</h1>
>>>>>>> MVC

<div class="container">
	<form name="addProjectForm" action="AddProjectAction.do" method="post">
		<table class="table table-bordered">
			<tr align="center">
<<<<<<< HEAD
				<td width="150">주체명</td>
=======
				<td width="150">��ü��</td>
>>>>>>> MVC
				<td width="450"><input type="text" name="writer"></td>
			</tr>
			
			<tr align="center">
<<<<<<< HEAD
				<td width="150">프로젝트 제목</td>
=======
				<td width="150">������Ʈ ����</td>
>>>>>>> MVC
				<td width="450"><input type="text" name="title"></td>
			</tr>
			
			<tr align="center">
<<<<<<< HEAD
				<td width="150">마감기한</td>
=======
				<td width="150">��������</td>
>>>>>>> MVC
				<td width="450"><input type="date" min="2020-05-22" max="2022-05-22" name="deadline"></td>
			</tr>
				
			<tr align="center">
<<<<<<< HEAD
				<td width="150">모금 목표 금액</td>
				<td width="450"><input type="text" name="goal">원</td>
=======
				<td width="150">��� ��ǥ �ݾ�</td>
				<td width="450"><input type="text" name="goal">��</td>
>>>>>>> MVC
			</tr>	
		</table>
		<br>
		<div>
<<<<<<< HEAD
		프로젝트 소개<br>
		<textarea name = "content" cols="100" rows="30" placeholder="프로젝트 진행 계기, 상세 내용 및 계획을 작성해주세요.">
=======
		������Ʈ �Ұ�<br>
		<textarea name = "content" cols="100" rows="30" placeholder="������Ʈ ���� ���, �� ���� �� ��ȹ�� �ۼ����ּ���.">
>>>>>>> MVC
		</textarea>
		</div>
		<br>
		<div>
<<<<<<< HEAD
		이미지 첨부<br>
=======
		�̹��� ÷��<br>
>>>>>>> MVC
		<input type="text" name="imageURL">
		</div>
		<br>
		<div>
<<<<<<< HEAD
		<input type="submit" value="프로젝트 개설 신청하기">
=======
		<input type="submit" value="������Ʈ ���� ��û�ϱ�">
>>>>>>> MVC
		</div>
	</form>
</div>
</body>
</html>