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
<div class="container" style="padding:30px;">
	<form name="writeReviewForm" action="review/WriteReviewAction" method="post" onsubmit="return checkForm()">
		<div class="col-md-10" style="margin-left:70px;">
			<h3>후기 작성</h3>
			<input type="hidden" name="reviewPID" value="${param.pid}">
			<input type="hidden" value="${userID}"class="form-control" name="writer" readonly>
			<table class="table table-bordered">
				<tr align="center">
					<td width="20%" bgcolor="#F5F5F5">후기 제목</td>
					<td width="80%"><input type="text" class="form-control" name="title" placeholder="후기 제목을 입력해주세요."></td>
				</tr>
			</table>
		</div>
		<div class="col-md-10" style="margin-left:70px;">
		후기 내용
		<textarea name = "content" class="form-control" rows="20" placeholder="프로젝트 진행 소감, 후원금 사용내역을 작성해주세요."></textarea>
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
				 <button type="submit" class="btn btn-success btn-lg btn-block">등록</button>
		 	</div>
		 	</div>
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