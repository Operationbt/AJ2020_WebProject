<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<title>Donation Form Page</title>
</head>
<body>
<div class="jumbotron">
	<a class="navbar-brand" href="index.jsp">Home</a>
	<div class="container">
		<h2>프로젝트명: ${project.getTitle()}</h2>
	</div>
</div>
	<div class="container">
		<form name="donate" action="DonateAction.do?pid=${project.getPid()}" method="post">
		<div class="form-group">
			<label class="col-sm-2">기부할 금액</label>
			<div class="col-sm-3"><input type="text" value="0" name="donationAmount">원</div>
		</div>
		<div class="col-sm-offset-2 col-sm-10"><input type="submit" value="기부하기"></div>
		</form>
	</div>

</body>
</html>