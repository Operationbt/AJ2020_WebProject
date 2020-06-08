<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<title>Project Detail Page</title>
</head>
<body>

<div class="container">
<div class="col-md-12">
	<button type="button" class="btn btn-primary" name="home"  onclick="location.href='index.jsp'">Home</button>
</div>
</div>

<div class="container" style="padding-top: 50px">
<h1>${project.getTitle()}</h1>
<h4>프로젝트 기간:${project.getDate()} ~ ${project.getDeadline()}</h4>
<span style="background-color:yellow">
	<c:choose>
		<c:when test="${leftDay >= 0}">
			d-${leftDay}
		</c:when>
		<c:otherwise>
			종료
		</c:otherwise>
	</c:choose>
</span>
<br>
후원자 현황: ${project.getSponsor()}명
<br>
모금 현황: ${project.getCurrent()}원
<h3>프로젝트 소개</h3>
<table width="600px">
	<c:if test="${project.getImageURL() != null || project.getImageURL().length() != 0}">
	<tr>
		<td>
			<img src="${project.getImageURL()}" width="600"/>
		</td>
	</tr>
	</c:if>
	
	<tr>
		<td>
			<pre>${project.getContent()}</pre>
		</td>
	</tr>
</table>
	<a href="DonateViewAction.do?pid=${project.getPid()}" class="btn btn-secondary" role="button">후원하기</a>

</div>

<div class="commentArea">
	<c:out value="아이디:${userID}"/>
	<c:out value="글번호:${project.getPid()}"></c:out>
	<div class="writeComment">	<!-- 댓글 작성 -->
		<c:if test="${userID != null}"> 
			<form name="addComment" action="" method="post">
				<input type="hidden" name="commentPID" value="${project.getPid()}">
				<input type="hidden" name="commentWriter" value="${userID}">
				<textarea name = "content" cols="50" rows="5" placeholder="주제와 무관한 댓글, 악플은 삭제될 수 있습니다." maxlength="1000"></textarea>
				<input type="submit" value="등록">
			</form>
		</c:if>
	</div>
	<div class="showComment">	<!-- 댓글 목록 -->
		<p>총 "${cList.size()}" 개의 댓글이 있습니다.</p>
		<c:if test="${cList != null}">
			<table class="table table-bordered">
		        <c:forEach var="comment" items="${cList}">
		            <tr>
		                <!-- 댓글 작성자, 작성날짜 -->
		                <td>${comment.getWriter()}</td>
		                <td>${comment.getDate()}</td>

		                <!-- 댓글 내용 -->
		                <td width="550">${comment.getContent()}</td>
		                
		                <!-- 버튼 -->
		                <td width="100">
		                    <div id="btn" style="text-align:center;">
			                    <!-- 댓글 작성자만 수정, 삭제 가능하도록 -->    
			                    <c:if test="${comment.getWriter() == userID}">
			                        <a href="#">[수정]</a><br>    
			                        <a href="#">[삭제]</a>
			                    </c:if>        
		                    </div>
		                </td>
		            </tr>
		        </c:forEach>
		       </table>
    	</c:if>
	</div>
</div>

</body>
</html>