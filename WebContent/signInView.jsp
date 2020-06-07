<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<title>Sign In</title>
</head>
<body>
<%-- 폼 양식 확인하는 로직 짜야됨  --%>
<div class="container">
	<form name="signIn" action="sign/SignInAction" method="post">
		<div class="form-group row">
			<label class="col-sm-2">아이디</label>
			<div class="col-sm-3">
				<input type="text" name="userID" class="form-control">
			</div>
		</div>
		<div class="form-group row">
			<label class="col-sm-2">비밀번호</label>
			<div class="col-sm-3">
				<input type="password" name="userPW" class="form-control">
			</div>
		</div>
		<div class="form-group row">
			<div class="col-sm-offset-2 col-sm-10">
				<input type="submit" class="btn btn-primary" value="로그인">
			</div>
		</div>
	</form>
	<a href="signUpView.jsp" class="btn btn-secondary" role="button">Sign Up</a>
</div>
</body>
</html>