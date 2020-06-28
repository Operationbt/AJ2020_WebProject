  
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
	
footer{ position:fixed; 
  right:150px;
  left:150px; 
  bottom:0px; 
  height:50px; 
  width:70%;
  background:white; opacity: 1.0;
  color: white; }
	
</style>

<body>
<%
	String userID = (String)session.getAttribute("userID");
%>
<jsp:include page="menuView.jsp" />

<!-- 후기 작성하려면 프로젝트 작성자와 id일치하는지 검사하는 로직 추가해야함 -->
<c:if test="${project.getWriter() == userID }">
	<c:if test="${leftDay < 0}"> <!-- 마감된 프로젝트만 후기를 작성할 수 있다 -->
		<c:if test="${review == null }"> <!-- 아직 후기가 없을 때만 작성 가능 -->
			<a href="WriteReviewView.jsp?pid=${project.getPid()}">후기 작성</a>
		</c:if>
	</c:if>
</c:if>


<div class="container"> 
	<div class="col-md-10" style="margin-left:70px; margin-top:50px;">	<!-- 프로젝트 제목, 기간, 후원 현황 등등 머릿말-->
		<h2>${project.getTitle()}</h2>
		<h5>프로젝트 기간 : ${project.getDate()} ~ ${project.getDeadline()}
		<span style="background-color:yellow; margin-left:10px">
			<c:choose>
				<c:when test="${leftDay >= 0}">
					d-${leftDay}
				</c:when>
				<c:otherwise>
					종료
				</c:otherwise>
			</c:choose>
		</span>
		</h5>
		후원자 현황 : ${project.getSponsor()}명
		<br>
		모금 현황 : ${project.getCurrent()}원
	</div>
	<div class="col-md-10" style="margin-left:70px; padding-top:30px">	<!-- 프로젝트 첨부 이미지 -->
		<h6>프로젝트 소개</h6>
		<c:if test="${project.getImageURL() != null || project.getImageURL().length() == 0}">
			<img src="${project.getImageURL()}" width="100%"/>
		</c:if>
	
		<div class="projtext">	<!-- 프로젝트 본문 -->
			<p><pre>${project.getContent()}</pre>
		</div>

		<div style="padding-top:10px; width:50%; margin-left:25%">
		<c:choose>
			<c:when test="${leftDay<0 }">
				<a href="#" class="btn btn-secondary btn-lg btn-block disabled" role="button">기한 종료</a>
				<c:if test="${review != null }"> <!-- 작성된 후기가 있을 때만 버튼 활성화  -->
					<a href="/CoffeeWebProject/review/ShowReviewAction?pid=${project.getPid()}" class="btn btn-primary btn-lg btn-block" role="button">후기 보기</a>
				</c:if>
			</c:when>
			<c:when test="${userID==null }">
				<a href="/CoffeeWebProject/signInView.jsp" class = "btn btn-primary btn-lg btn-block" role="button">후원하려면 로그인하세요</a>
			</c:when>
		<c:when test="${userID!=null }"><a href="DonateViewAction.do?pid=${project.getPid()}" class="btn btn-secondary btn-lg btn-block" role="button">후원하기</a></c:when>
		</c:choose>
		</div>
	</div>

	<div class="commentArea">
		<div class="col-md-10" style="margin-left:70px;">
			<br>
			<div class="writeComment">	<!-- 댓글 작성 -->
				<c:if test="${userID != null}">
					<c:out value="아이디:${userID}"/>
					<form name="addComment" action="/CoffeeWebProject/comment/WriteCommentAction" method="post">
						<input type="hidden" name="commentPID" value="${project.getPid()}">
						<input type="hidden" name="commentWriter" value="${userID}">
						<textarea name = "commentContent" cols="120" rows="5" placeholder="여러분의 후원 후기 및 의견을 댓글로 남겨주세요.&#13;&#10;주제와 무관한 댓글, 악플은 삭제될 수 있습니다." maxlength="1000"></textarea>
						<input type="submit" class="btn btn-primary" value="등록" style="margin-left:92%";>
					</form>
				</c:if>
			</div>
			<div class="showComment" style="margin-bottom:40px;">	<!-- 댓글 목록 -->
				<p>총 "${cList.size()}" 개의 댓글이 있습니다.</p>
				<c:if test="${cList != null}">
					<table class="table table-bordered" width="100%">
				        <c:forEach var="comment" items="${cList}">
				            <tr>
				                <!-- 댓글 작성자, 작성날짜 -->
				                <td width="20%" style="text-align:center">${comment.getWriter()}<br>${comment.getDate()}</td>
		
				                <!-- 댓글 내용 -->
				                <td width="70%">${comment.getContent()}</td>
				                
				                <!-- 버튼 -->
				                <c:if test="${comment.getWriter() == userID}"> <!-- 댓글 작성자만 수정, 삭제 가능하도록 -->   
					                <td width="10%">
					                    <div id="btn" style="text-align:center;">
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
</div>
<footer align="center">

<c:choose>
		<c:when test="${leftDay<0 }"><a href="#" class="btn btn-secondary btn-lg btn-block disabled" role="button" height="50px">기한 종료</a></c:when>
		<c:when test="${userID==null }"><a href="signInView.jsp" class = "btn btn-success btn-lg btn-block" style="height:50px" role="button">후원하려면 로그인하세요</a></c:when>
		<c:when test="${userID!=null }"><a href="DonateViewAction.do?pid=${project.getPid()}" class="btn btn-success btn-lg btn-block" style="height:50px" role="button">후원하기</a></c:when>
</c:choose>
		

	
</footer>
<script type="text/javascript">
function writeComment() {
	var form = document.addComment;
	form.submit();
}
function delteComment(num, pid) {
	if(confirm("댓글을 삭제하시겠습니까?") == true)
		location.href = "/CoffeeWebProject/comment/DeleteCommentAction?num=" + num + "&pid=" + pid;
}
function editComment() {
	
}
</script>
</body>
