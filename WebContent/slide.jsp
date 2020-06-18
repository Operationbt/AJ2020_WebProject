<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<title>W3.CSS</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<style>
.mySlides {display:none;}
</style>
<body>


<div class="w3-content w3-display-container">


<div class="w3-display-container mySlides">
  <a href="DetailViewAction.do?pid=1000"><img src="images/image6.jpg" style="width:100%" height="410px">
  <div class="w3-display-middle w3-large w3-container w3-padding-16 ">
    <p><font color="FFFFFF" size="5"><b>유기견 보호소 살펴보기</b></font></p>
  </div></a>
</div>

<div class="w3-display-container mySlides">
  <a href="DetailViewAction.do?pid=1001"><img src="images/image5.png" style="width:100%" height="410px">
  <div class="w3-display-middle w3-large w3-container w3-padding-16">
    <p><font color="FFFFFF" size="5"><b>코로나 관련 도움 주기</b></font></p>
  </div></a>
</div>

<div class="w3-display-container mySlides">
  <img src="images/image4.jpg" style="width:100%" height="410px">
  <div class="w3-display-middle w3-large w3-container w3-padding-16">
   <p><font color="FFFFFF" size="5"><b>환경 지키기</b></font></p>
  </div>
</div>

<div class="w3-display-container mySlides">
  <a href="infomation.jsp"><img src="images/image1.jfif" style="width:100%" height="410px">
  <div class="w3-display-middle w3-large w3-container w3-padding-16 w3-black">
  	<p><font color="FFFFFF" size="5"><b>사이트 소개</b></font></p>
  </div></a>
</div>

<button class="w3-button w3-display-left w3-black" onclick="plusDivs(-1)">&#10094;</button>
<button class="w3-button w3-display-right w3-black" onclick="plusDivs(1)">&#10095;</button>

</div>

<script>
var slideIndex = 1;
showDivs(slideIndex);

function plusDivs(n) {
  showDivs(slideIndex += n);
}

function showDivs(n) {
  var i;
  var x = document.getElementsByClassName("mySlides");
  if (n > x.length) {slideIndex = 1}
  if (n < 1) {slideIndex = x.length}
  for (i = 0; i < x.length; i++) {
     x[i].style.display = "none";  
  }
  x[slideIndex-1].style.display = "block";  
}
var myIndex = 0;
carousel();

function carousel() {
  var i;
  var x = document.getElementsByClassName("mySlides");
  for (i = 0; i < x.length; i++) {
    x[i].style.display = "none";  
  }
  myIndex++;
  if (myIndex > x.length) {myIndex = 1}    
  x[myIndex-1].style.display = "block";  
  setTimeout(carousel, 2000); // Change image every 2 seconds
}
</script>

</body>
</html>