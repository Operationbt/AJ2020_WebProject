<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add Project View</title>
</head>
<body>
<jsp:include page="menuView.jsp" />
<font size="6">프로젝트 개설 신청</font><br><br>

<div class="container">
	<form name="addProjectForm" action="AddProjectAction.do" method="post" onsubmit="return checkForm()">
		<table class="table table-bordered">
			<tr align="center">
				<td width="150">작성자</td>
				<!-- 작성자 id가 들어가게 수정 -->
				<td width="450"><input type="text" name="writer" value="${userID}" readonly="readonly"></td>
			</tr>
			
			<tr align="center">
				<td width="150">카테고리</td>
				<td>
				<select name="category">
				<option value="10">전체(All)</option>
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
				<td width="450"><input type="date" min="2020-05-22" max="2022-05-22" placeholder="yyyy-mm-dd" name="deadline"></td>
			</tr>
			<tr align="center">
				<td width="150">모금 목표 금액</td>
				<td width="450"><input type="text" name="goal" onkeyPress="return onlyNumber(event)">원</td>
			</tr>	
		</table>
		
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
<script type="text/javascript">
function checkForm(){
	if((!document.addProjectForm.writer.value) ||(!document.addProjectForm.category.value) ||(!document.addProjectForm.title.value) ||(!document.addProjectForm.deadline.value) 
			||(!document.addProjectForm.goal.value)||(!document.addProjectForm.content.value)) {
		alert("빈 칸을 채워주세요");
		return false;
	}
}
function onlyNumber(evt){
	var charCode=(evt.which) ? evt.which:event.keyCode;
	var _value=event.srcElement.value;
	if((event.keyCode <48) || (event.keyCode >57)){
		if(event.keyCode !=46) return false;
	}
}

</script>
</html>