<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<br>

<!-- 이 뷰는 있을 이유가 없음 projectDetail 뷰에 들어감 -->
<!-- 나중에 삭제해야됨 -->

<a href="comment/ShowCommentListAction?pid=${project.getPid()}">댓글 보기</a>
<c:out value="아이디:${userID}"/>
<c:out value="글번호:${project.getPid()}"></c:out>
<div class="commentArea">
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
			
		        <c:forEach var="comment" items="${cList}">
		            <tr>
		                <!-- 댓글 작성자, 작성날짜 -->
		                <td>${comment.getWriter()}</td>
		                <td>${comment.getDate()}</td>

		                <!-- 댓글 내용 -->
		                <td>${comment.getContent()}</td>
		                
		                <!-- 버튼 -->
		                <td>
		                    <!-- 댓글 작성자만 수정, 삭제 가능하도록 -->    
		                    <c:if test="${comment.getWriter() == userID}">
		                        <a href="#">[수정]</a><br>    
		                        <a href="#">[삭제]</a>
		                    </c:if>        
		                </td>
		            </tr>
		            
		        </c:forEach>
		       
    	</c:if>
	</div>
</div>


	
</body>
</html>