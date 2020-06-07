<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<title>회원가입</title>
</head>
<body>
<script type="text/javascript">
function confirm() {
	var checkForm = document.signUp;
	var id = signUp.id;
	var p1 = signUp.password;
	var p2 = signUp.passwordCheck;

	//값 비교 하려면 value 꼭 사용! p1 == p2 처럼 삽질 안하게 조심
	if(!id.value || !p1.value || !p2.value){
		alert("양식을 모두 채워주세요.");
		return;
	}
	else{
		if(id.value.length > 20 || p1.value.length > 20 || p2.value.length > 20){
			alert("길이는 20자 이하로 해주세요.");
			return;
		}
		if(p1.value == p2.value){	
			checkForm.submit();
		}
		else{
			alert("비밀번호가 일치하지 않습니다.");
		}
	}
}
</script>

<%-- 복붙해서 부트스트랩 CSS가 적혀있음 --%>
<div class="container">
	<form name="signUp" action="/sign/SignUpAction" method="post">
		<p>길이는 20자 이하로 제한됩니다.</p>
		<div class="form-group row">
			<label class="col-sm-2">아이디</label>
			<div class="col-sm-3">
				<input type="text" name="id" class="form-control">
			</div>
		</div>
		<div class="form-group row">
			<label class="col-sm-2">비밀번호</label>
			<div class="col-sm-3">
				<input type="password" name="password" class="form-control">
			</div>
		</div>
		<div class="form-group row">
			<label class="col-sm-2">비밀번호 재확인</label>
			<div class="col-sm-3">
				<input type="password" name="passwordCheck" class="form-control">
			</div>
		</div>
		<div class="form-group row">
			<label class="col-sm-2">이름</label>
			<div class="col-sm-3">
				<input type="text" name="name" class="form-control">
			</div>
		</div>
		<div class="form-group row">
			<label class="col-sm-2">이메일</label>
			<div class="col-sm-10">
				<input type="text" name="email1" maxlength="45">@
				<select name="email2">
					<option>naver.com</option>
					<option>daum.net</option>
					<option>gmail.com</option>
				</select>
			</div>
		</div>
		<div class="form-group row">
			<label class="col-sm-2">전화번호</label>
			<div class="col-sm-3">
				<input type="text" name="phone" class="form-control">
			</div>
		</div>
		<div class="form-group row">
			<div class="col-sm-offset-2 col-sm-10">
				<input type="button" class="btn btn-primary" onclick="confirm()" value="회원가입">
			</div>
		</div>
	</form>
</div>
</body>
</html>