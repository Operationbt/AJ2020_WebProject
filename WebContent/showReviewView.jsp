<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>프로젝트 후기</title>
<style>
	/* 이렇게 링크해서 사용하면 됩니다 */
	@import url('https://fonts.googleapis.com/css?family=Nanum+Gothic:400,700,800');

	/* 폰트 이름은 'Nanum Gothic' 입니다. 공백이 있으므로 주의해 주세요. */
	/* font-family : 'Nanum Gothic'; 으로 지정해 줍니다. */
 body {
	font-family : 'Nanum Gothic';
}

.projtext {
	width: 100%;
	background-color: white;
	border: 1px solid rgb(192,192,192);
	border-collapse: collapse;
	font-size:20px;
}

pre {
	white-space: pre-wrap;
}
img { display: block; margin: 0px auto; }
</style>
</head>
<body>
<jsp:include page="menuView.jsp" />

<div class="container"> 
	<div class="col-md-10" style="margin-left:70px; margin-top:50px;">	<!-- 후기 제목, 기간, 후원 현황 등등 머릿말-->
		<h2>${review.getTitle()}</h2>
		<h4>작성일 : ${review.getDate()}</h4>
		<h5>프로젝트 기간 : ${project.getDate()} ~ ${project.getDeadline()}</h5>
		총 후원자 : ${project.getSponsor()}명
		<br>
		총 모금액 : ${project.getCurrent()}원
	</div>
	<div class="col-md-10" style="margin-left:70px; padding-top:30px">	<!-- 후기 첨부 이미지 -->
		<c:if test="${review.getImageURL() != null && review.getImageURL().length() != 0}">
			<img src="${review.getImageURL()}" width="100%"/>
		</c:if>
	
		<div class="projtext">	<!-- 후기 본문 -->
			<p><pre>${review.getContent()}</pre>
		</div>
	</div>
</div>
<br>
<br>
<br>
</body>
</html>