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
<style>
.form-center {
  margin-top: 100px;
  padding: 20px 20px 0;
  left:50%;
  right:50%;
  top:100px;
}
</style>
<%-- 폼 양식 확인하는 로직 짜야됨  --%>

<%String status=request.getParameter("status"); %>
<div class="container">
 <div class="jumbotron" style="padding-top: 0px; width:400px; margin-left:300px; margin-top:50px;">
	<form class="form-center" name="signIn" action="sign/SignInAction" method="post" onsubmit="return checkForm()" >
		<h3 style="text-align: center;"> 로그인</h3>
		<div class="form-group row" align="center">
				<input type="text" name="userID" class="form-control" placeholder="아이디">
			
		</div>
		<div class="form-group row">
				<input type="password" name="userPW" class="form-control" placeholder="비밀번호">
			
		</div>
		<div class="form-group row">
			<div class="col-sm-offset-2 col-sm-10">
				<input type="submit" class="btn btn-primary" value="로그인">
			</div>
		</div>
		아직 아이디가 없으신가요? <a href="signUpView.jsp">가입하기</a><br>
		<a href="index.jsp">Home</a>으로 돌아가기
	</form>
	${error }
	
	
	</div>
</div>



<script type="text/javascript">
function checkForm(){
	if((!document.signIn.userID.value) ||(!document.signIn.userPW.value)) {
		alert("빈 칸을 채워주세요");
		return false;
	}
}
</script>
 <!-- 로긴폼 -->

</body>
</html>