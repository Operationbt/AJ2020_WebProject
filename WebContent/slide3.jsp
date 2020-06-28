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

		var $bannerWidth = $banner.children().outerWidth();//�̹����� ��
		var $bannerHeight = $banner.children().outerHeight(); // ����
		var $length = $banner.children().length;//�̹����� ����
		var rollingId;
		
	
		//������ �ʸ��� �Լ� ����
		rollingId = setInterval(function() { rollingStart(); }, 3000);//���� �̹����� �Ѹ� �ִϸ��̼� �� �ð���
    
		function rollingStart() {
			$banner.css("width", $bannerWidth * $length + "px");
			$banner.css("height", $bannerHeight + "px");
			//alert(bannerHeight);
			//����� ���� ��ġ�� �Ű� �ش�.
			$banner.animate({left: - $bannerWidth + "px"}, 1500, function() { //���ڴ� �Ѹ� ����Ǵ� �ð��̴�.
				//ù��° �̹����� ������ ���� ����(�̵��� �ƴ϶� ����)�ؼ� �߰��Ѵ�.
				$(this).append("<li>" + $(this).find("li:first").html() + "</li>");
				//�ڷ� ����� ù���� �̹����� �ʿ� ������ �����Ѵ�.
				$(this).find("li:first").remove();
				//���� �������� ���ؼ� ��� ������ ��ġ���� �ʱ�ȭ �Ѵ�.
				$(this).css("left", 0);
				//�� ������ �ݺ��ϸ鼭 ��� �Ѹ��ϴ� ��ʸ� ���� �� �ִ�.
			}
			
			);
		}
	  

	}); 

</script>
</body>
</html>