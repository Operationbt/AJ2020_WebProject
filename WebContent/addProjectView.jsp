<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">

<title>Add Project View</title>
</head>
<body>
<jsp:include page="menuView.jsp" />

<div class="container" style="padding:30px;">
	<form name="addProjectForm" action="AddProjectAction.do" method="post" onsubmit="return checkForm()">
		<div class="col-md-10" style="margin-left:70px;">
			<h3>프로젝트 개설 신청</h3>
			<input type="hidden" value="${userID}"class="form-control" name="writer" readonly>
			<table class="table table-bordered">
				<tr align="center">
					<td width="20%" bgcolor="#F5F5F5">카테고리</td>
					<td>
					<select name="category">
					<option value="10">전체(All)</option>
					<option value="1">아동(Child)/노인(Elder)</option>
					<option value="2">장애인(Disabled)</option>
					<option value="3">동물(Animal)</option>
					<option value="4">환경(Environment)</option>
					<option value="5">가족(Family)</option>
					</select></td></tr> 
				<tr align="center">
					<td width="20%" bgcolor="#F5F5F5">프로젝트 제목</td>
					<td width="80%"><input type="text" class="form-control" name="title" placeholder="프로젝트 제목을 입력해주세요."></td>
				</tr>
				<tr align="center">
					<td width="20%" bgcolor="#F5F5F5">마감기한</td>
					<td width="80%"><input id="datefield" type="date" min="2020-01-01" placeholder="yyyy-mm-dd" name="deadline"></td>
				</tr>
				<tr align="center">
					<td width="20%" bgcolor="#F5F5F5">모금 목표 금액</td>
					<td width="80%"><input type="text" name="goal" onkeyPress="return onlyNumber(event)" placeholder="ex)100000" style="text-align:right;">원</td>
				</tr>	
			</table>
		</div>
		<div class="col-md-10" style="margin-left:70px;">
		프로젝트 소개
		<textarea name = "content" class="form-control" rows="20" placeholder="프로젝트 진행 계기,상세 내용 및 계획을 작성해주세요."></textarea>
		<br>이미지 첨부<br>
		<input type="text" name="imageURL">
		<%-- !! 이미지 URL 말고 파일로 첨부하는 방식으로 수정할 예정..! --%>
		<%-- <input type="file" name="imageURL"> --%>
		</div>
		<br>
		<div class="col-md-10">
			<div class="row" style="padding: 0px 0px 30px 0px;"> <!-- 하단 여백 -->
			<div class="col-md-5"></div>
			<div class="col-md-5">
			<%-- <div class="col-md-4 col-md-offest-4"> offset 적용이 안됨.. --%>
				 <button type="submit" class="btn btn-success btn-lg btn-block">프로젝트 개설 신청하기</button>
		 	</div>
		 	</div>
		</div>
	</form>
</div>
</body>
<script type="text/javascript">

// 마감기한을 오늘 날짜 이후로 설정하게 하는 부분
var today = new Date();
var dd = today.getDate();
var mm = today.getMonth()+1; //January is 0!
var yyyy = today.getFullYear();
 if(dd<10){
        dd='0'+dd
    } 
    if(mm<10){
        mm='0'+mm
    } 

today = yyyy+'-'+mm+'-'+dd;
document.getElementById("datefield").setAttribute("min", today);
//--------------------------------------------------------------


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