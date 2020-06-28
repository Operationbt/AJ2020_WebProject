<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<title>Donation Form Page</title>
</head>
<body>
<jsp:include page="menuView.jsp" />
<div class="jumbotron">
	<div class="container">
		<h2>${project.getTitle()}</h2>
	</div>
</div>

<div class="container">
	<div class="jumbotron" style="padding-top: 0px; width:400px; margin-left:300px; margin-top:50px;">
		<form class="form-center" name="donate" action="DonateAction.do?pid=${project.getPid()}" method="post" onsubmit="return checkForm(${user.getMoney()})">
			<div class="form-group row" align="center" style="padding-top: 70px">
				<h4>보유 금액 : <fmt:formatNumber value="${user.getMoney()}" pattern="#,###" />원</h4>
			</div>
			<div class="form-group row">
				<input type="text" name="donationAmount" class="form-control" placeholder="후원할 금액" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');">
			</div>
			<div class="form-group row">
				<div class="col-sm-offset-2 col-sm-10">
					<input type="submit" class="btn btn-primary" value="후원하기">
				</div>
			</div>
		</form>
	</div>
</div>

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


<script type="text/javascript">
function checkForm(m){
	//보유 금액보다 기부 금액이 크면 안됨
	alert('document.donate.donationAmount.value');
	return false;
	if(m > document.donate.donationAmount.value) {
		alert("보유 금액을 넘는 금액은 후원할 수 없습니다.");
		return false;
	}
	return false;
}
function inNumber(){
	if(event.keyCode<48 || event.keyCode>57){
	   event.returnValue=false;
	}
}
</script>
</body>
</html>