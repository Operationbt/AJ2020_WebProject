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

<!-- 프로젝트 신청 페이지 addProjectView.jsp 따올 것 -->
<font size="6">최종 후기 작성</font><br><br>
<div class="container">
	<form name="writeReviewForm" action="review/WriteReviewAction" method="post" onsubmit="return checkForm()">
		<input type="hidden" name="reviewPID" value="${param.pid}">
		<table class="table table-bordered">
			<tr align="center">
				<td width="150">프로젝트 번호</td>
				<td width="450"><input type="text" name="pid" value="${param.pid}" readonly="readonly"></td>
			</tr>
			<tr align="center">
				<td width="150">작성자</td>
				<!-- 작성자 id가 들어가게 수정 -->
				<td width="450"><input type="text" name="writer" value="${userID}" readonly="readonly"></td>
			</tr>
			<tr align="center">
				<td width="150">후기 제목</td>
				<td width="450"><input type="text" name="title"></td>
			</tr>
		</table>
		
		<div>
			후기 내용<br>
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
		<input type="submit" value="등록">
		</div>
	</form>
</div>
</body>
<script type="text/javascript">
function checkForm(){
	if((!document.writeReviewForm.writer.value) ||(!document.writeReviewForm.title.value) ||(!document.writeReviewForm.content.value)) {
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