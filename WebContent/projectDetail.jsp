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
<style>
.projtext {
	width: 1000px;
	border: 3px outset gray;
	background-color: white;
}
pre {
	white-space: pre-wrap;
}
</style>

<body>
<%
	String userID = (String)session.getAttribute("userID");
%>
<jsp:include page="menuView.jsp" />
<div class="container" style="padding-top: 50px"> 
	<div>	<!-- 프로젝트 제목, 기간, 후원 현황 등등 머릿말-->
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
	</div>
	
	<div>	<!-- 프로젝트 첨부 이미지 -->
		<c:if test="${not empty project.getImageURL()}">
			<img src="${project.getImageURL()}" width="1000"/>
		</c:if>
	</div>
	
	<div class="projtext">	<!-- 프로젝트 본문 -->
		<pre>${project.getContent()}</pre>
	</div>
	
	<div style="padding-top:10px">
	<c:choose>
		<c:when test="${leftDay<0 }"><a href="#" class="btn btn-secondary btn-lg disabled" role="button">기한 종료</a></c:when>
		<c:when test="${userID==null }"><a href="signInView.jsp" class = "btn btn-primary btn-lg" role="button">후원하려면 로그인하세요</a></c:when>
	<c:when test="${userID!=null }"><a href="DonateViewAction.do?pid=${project.getPid()}" class="btn btn-secondary btn-lg" role="button">후원하기</a></c:when>
	</c:choose>
	</div>
	
	
	<div class="commentArea">
		<br>
		<div class="writeComment">	<!-- 댓글 작성 -->
			<c:if test="${userID != null}">
				<c:out value="아이디:${userID}"/>
				<form name="addComment" action="comment/WriteCommentAction" method="post">
					<input type="hidden" name="commentPID" value="${project.getPid()}">
					<input type="hidden" name="commentWriter" value="${userID}">
					<textarea name = "commentContent" cols="50" rows="5" placeholder="여러분의 후원 후기 및 의견을 댓글로 남겨주세요.&#13;&#10;주제와 무관한 댓글, 악플은 삭제될 수 있습니다." maxlength="1000"></textarea>
					<input type="submit" class="btn btn-primary" value="등록">
				</form>
			</c:if>
		</div>
		<div class="showComment">	<!-- 댓글 목록 -->
			<p>총 "${cList.size()}" 개의 댓글이 있습니다.</p>
			<c:if test="${cList != null}">
				<table class="table table-bordered" width="1000">
			        <c:forEach var="comment" items="${cList}">
			            <tr>
			                <!-- 댓글 작성자, 작성날짜 -->
			                <td width="20%">${comment.getWriter()}<br>${comment.getDate()}</td>
	
			                <!-- 댓글 내용 -->
			                <td width="70%">${comment.getContent()}</td>
			                
			                <!-- 버튼 -->
			                <c:if test="${comment.getWriter() == userID}">
				                <td width="10%">
				                    <div id="btn" style="text-align:center;">
					                    <!-- 댓글 작성자만 수정, 삭제 가능하도록 -->    
					                    
					                    	<!-- 댓글 수정도 함부로 못하게 할지 -->
					                        <!-- <a href="#" onclick="">[수정]</a><br>  -->   
											<a href="#" onclick="delteComment(${comment.getNum()}, ${project.getPid()})">[삭제]</a>     
				                    </div>
				                </td>
			                </c:if>
			            </tr>
			        </c:forEach>
			       </table>
	    	</c:if>
		</div>
	</div>
</div>

<script type="text/javascript">
function writeComment() {
	var form = document.addComment;
	form.submit();
}
function delteComment(num, pid) {
	if(confirm("댓글을 삭제하시겠습니까?") == true)
		location.href = "comment/DeleteCommentAction?num=" + num + "&pid=" + pid;
}
function editComment() {
	
}
</script>
</body>

