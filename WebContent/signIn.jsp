<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
</head>
<body>
<%-- 복붙해서 부트스트랩 CSS가 적혀있음 --%>
<%-- 아이디, 비번 입력 -> 로그인 버튼 클릭 -> DB와 검증  --%>
<div class="container">
	<form name="signIn" action="signInProcess.jsp" method="post">
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
			<div class="col-sm-offset-2 col-sm-10">
				<input type="submit" class="btn btn-primary" value="로그인">
			</div>
		</div>
	</form>
</div>
</body>
</html>