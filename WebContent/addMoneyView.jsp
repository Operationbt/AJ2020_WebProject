<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<title>Add Money View</title>
</head>
<body>
<jsp:include page="menuView.jsp" />
<div class="jumbotron" width=600px>
	<div class="container" style="padding-top: 0px; width:1000px; margin-left:100px; margin-top:0px; margin-right:100px">
<form name="addMoneyForm" action="AddMoneyAction.do" method="post">
	<div class="form-group row">
		<label class="col-sm-3">충전할 금액을 입력하세요</label>
		<div class="col-sm-2">
			<input type="text" value="0" name="Amount" class="form-control" onkeyPress="return onlyNumber(event)">
			<input type="submit" value="확인">
		</div>
	</div>
</form>
</div></div>
</body>
<script type="text/javascript">
function onlyNumber(evt){
	var charCode=(evt.which) ? evt.which:event.keyCode;
	var _value=event.srcElement.value;
	if((event.keyCode <48) || (event.keyCode >57)){
		if(event.keyCode !=46) return false;
	}
}
</script>
</html>