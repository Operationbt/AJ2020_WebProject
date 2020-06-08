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

<h1>������Ʈ ���� ��û</h1>

<div class="container">
	<form name="addProjectForm" action="AddProjectAction.do" method="post">
		<table class="table table-bordered">
			<tr align="center">
				<td width="150">��ü��</td>
				<td width="450"><input type="text" name="writer"></td>
			</tr>
			
			<tr align="center">
				<td width="150">������Ʈ ����</td>
				<td width="450"><input type="text" name="title"></td>
			</tr>
			
			<tr align="center">
				<td width="150">��������</td>
				<td width="450"><input type="date" min="2020-05-22" max="2022-05-22" name="deadline"></td>
			</tr>
				
			<tr align="center">
				<td width="150">��� ��ǥ �ݾ�</td>
				<td width="450"><input type="text" name="goal">��</td>
			</tr>	
		</table>
		<br>
		<div>
		������Ʈ �Ұ�<br>
		<textarea name = "content" cols="100" rows="30" placeholder="������Ʈ ���� ���, �� ���� �� ��ȹ�� �ۼ����ּ���.">
		</textarea>
		</div>
		<br>
		<div>
		�̹��� ÷��<br>
		<input type="text" name="imageURL">
		</div>
		<br>
		<div>
		<input type="submit" value="������Ʈ ���� ��û�ϱ�">
		</div>
	</form>
</div>
</body>
</html>