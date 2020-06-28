<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">	
	/* banner */
	.banner {position: relative; width: 1000px; height: 310px; top: 0px;  margin:0 auto; padding:0; overflow: hidden;}
	.banner ul {position: absolute; margin: 0px; padding:0; list-style: none; }
	.banner ul li {float: left; width: 1000px; height: 310px; margin:0; padding:0;}
.banner .btn_prev { left:0px;}
.banner .btn_next { right:10px;}
.banner .btn_prev,.product_con .btn_next { position:absolute;top:100px;}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

</head>
<body>
	<div class="container">
		<div class="banner">
			<ul>
				
				<li><a href="DetailViewAction.do?pid=1001"><img src="images/image1.jpg" width="1000" height="310px"></a></li>
				<li><a href="DetailViewAction.do?pid=1000"><img src="images/image2.jpg" width="1000" height="310px"></a></li>
				<li><a href="DetailViewAction.do?pid=1005"><img src="images/image3.jpg" width="1000" height="310px"></a></li>
				
			</ul>
		</div>
	</div>


<script language="JavaScript">

	$(document).ready(function() {
		var $banner = $(".banner").find("ul");

		var $bannerWidth = $banner.children().outerWidth();//이미지의 폭
		var $bannerHeight = $banner.children().outerHeight(); // 높이
		var $length = $banner.children().length;//이미지의 갯수
		var rollingId;
		
	
		//정해진 초마다 함수 실행
		rollingId = setInterval(function() { rollingStart(); }, 3000);//다음 이미지로 롤링 애니메이션 할 시간차
    
		function rollingStart() {
			$banner.css("width", $bannerWidth * $length + "px");
			$banner.css("height", $bannerHeight + "px");
			//alert(bannerHeight);
			//배너의 좌측 위치를 옮겨 준다.
			$banner.animate({left: - $bannerWidth + "px"}, 1500, function() { //숫자는 롤링 진행되는 시간이다.
				//첫번째 이미지를 마지막 끝에 복사(이동이 아니라 복사)해서 추가한다.
				$(this).append("<li>" + $(this).find("li:first").html() + "</li>");
				//뒤로 복사된 첫번재 이미지는 필요 없으니 삭제한다.
				$(this).find("li:first").remove();
				//다음 움직임을 위해서 배너 좌측의 위치값을 초기화 한다.
				$(this).css("left", 0);
				//이 과정을 반복하면서 계속 롤링하는 배너를 만들 수 있다.
			}
			
			);
		}
	  

	}); 

</script>
</body>
</html>