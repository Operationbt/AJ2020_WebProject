<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<title>Add Money View</title>
</head>
<body>
<div class="container">
<a class="navbar-brand" href="index.jsp">Home</a>
<form name="addMoneyForm" action="AddMoneyAction.do" method="post">
<div class="form-group row">
			<label class="col-sm-2">충전할 금액을 입력하시오</label>
			<div class="col-sm-3"><input type="text" value="0" name="Amount" class="form-control">원</div>
			</div>
			<div class="form-group row">
			<div class="col-sm-offset-2 col-sm-10"><input type="submit" value="확인"></div>
			</div>
</form>
</div>
</body>
</html>