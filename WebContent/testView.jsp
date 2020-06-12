<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="${pageContext.request.contextPath}/css/donationListStyle.css" rel="stylesheet" type="text/css">
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>	<!-- 제이쿼리 라이브러리를 CDN으로 로드 -->
<style type="text/css">
.wrap {
    width: 300px;
    height: auto;
    position: relative;
    display: inline-block;
}
.wrap textarea {
    width: 100%;
    resize: none;
    min-height: 4.5em;
    line-height:1.6em;
    max-height: 9em;
}
.wrap span {
    position: absolute;
    bottom: 5px;
    right: 5px;
}
#counter {
  background:rgba(255,50,0,0.5);
  border-radius: 0.5em;
  padding: 0 .5em 0 .5em;
  font-size: 0.75em;
}

</style>
</head>
<body>
${pageContext.request.contextPath}
<!-- 디자인 확인이나 테스트 용으로 만든 뷰입니다 -->

<a href="/donations/H000000172217" class="card">
	<img src="https://happybean-phinf.pstatic.net/20200520_236/1589959976434zcAfN_JPEG/KakaoTalk_20200520_095646015_naver.jpg?type=a360" alt="" width="267" height="200" class="card_img">
	<div class="card_content">
		<strong class="card_title">코로나로 바뀐 우리 일상, 배고파 힘겨운 소외된 이웃..</strong>
		<div class="card_organization">다일공동체</div>
		<div class="card_bar" aria-label="모금률"><span class="card_bar_collection" style="width:72%"></span></div>
		<strong class="card_percent">72%</strong>
		<strong class="card_money">7,129,500<span class="text">원</span></strong>
	</div>
</a>


<div class="wrap">
    <textarea id="content" maxlength="300"></textarea>
    <span id="counter">###</span>
</div>


<br>
<br>
<br>
<div class="MainDonateList">
	<a href="/donations/H000000172217" class="card">
		<img src="https://happybean-phinf.pstatic.net/20200520_236/1589959976434zcAfN_JPEG/KakaoTalk_20200520_095646015_naver.jpg?type=a360" alt="" width="267" height="200" class="card_img">
		<div class="card_content">
			<strong class="card_title">코로나로 바뀐 우리 일상, 배고파 힘겨운 소외된 이웃..</strong>
			<div class="card_organization">다일공동체</div>
			<div class="card_bar" aria-label="모금률"><span class="card_bar_collection" style="width:72%"></span></div>
			<strong class="card_percent">72%</strong>
			<strong class="card_money">7,129,500<span class="text">원</span></strong>
		</div>
	</a>
	<a href="/donations/H000000172217" class="card">
		<img src="https://happybean-phinf.pstatic.net/20200520_236/1589959976434zcAfN_JPEG/KakaoTalk_20200520_095646015_naver.jpg?type=a360" alt="" width="267" height="200" class="card_img">
		<div class="card_content">
			<strong class="card_title">코로나로 바뀐 우리 일상, 배고파 힘겨운 소외된 이웃..</strong>
			<div class="card_organization">다일공동체</div>
			<div class="card_bar" aria-label="모금률"><span class="card_bar_collection" style="width:72%"></span></div>
			<strong class="card_percent">72%</strong>
			<strong class="card_money">7,129,500<span class="text">원</span></strong>
		</div>
	</a>
	<a href="/donations/H000000172217" class="card">
		<img src="https://happybean-phinf.pstatic.net/20200520_236/1589959976434zcAfN_JPEG/KakaoTalk_20200520_095646015_naver.jpg?type=a360" alt="" width="267" height="200" class="card_img">
		<div class="card_content">
			<strong class="card_title">코로나로 바뀐 우리 일상, 배고파 힘겨운 소외된 이웃..</strong>
			<div class="card_organization">다일공동체</div>
			<div class="card_bar" aria-label="모금률"><span class="card_bar_collection" style="width:72%"></span></div>
			<strong class="card_percent">72%</strong>
			<strong class="card_money">7,129,500<span class="text">원</span></strong>
		</div>
	</a>
	<a href="/donations/H000000172217" class="card">
		<img src="https://happybean-phinf.pstatic.net/20200520_236/1589959976434zcAfN_JPEG/KakaoTalk_20200520_095646015_naver.jpg?type=a360" alt="" width="267" height="200" class="card_img">
		<div class="card_content">
			<strong class="card_title">코로나로 바뀐 우리 일상, 배고파 힘겨운 소외된 이웃..</strong>
			<div class="card_organization">다일공동체</div>
			<div class="card_bar" aria-label="모금률"><span class="card_bar_collection" style="width:72%"></span></div>
			<strong class="card_percent">72%</strong>
			<strong class="card_money">7,129,500<span class="text">원</span></strong>
		</div>
	</a>	
</div>
<script type="text/javascript">
$(function() {
    $('#content').keyup(function (e){
        var content = $(this).val();
        $(this).height(((content.split('\n').length + 1) * 1.5) + 'em');
        $('#counter').html(content.length + '/300');
    });
    $('#content').keyup();
});
</script>

</body>
</html>