<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">

</head>
<body>
<!--스타일이랑 스크립트는 천천히~!!!! 일단 기능구현해!! 프론트쪽은... 어느 정도 클론코딩하는 것도 괜찮아보여~!~!-->
<div class = "section_bg_wrap fixed_transform">
	<div class = "section bg_color">
		<div data-type="col-group" data-col-group="left" class="inline col-group inline-col-group-left" style="widgh:395px; background-color: #74992e;">왼쪽에 둘 박스</div>
		<div data-type="col-group" data-col-group="center" class="inline col-group inline-col-group-center">
			<div data-type="row" class="inline-row">
				<a href="/" style="block"> 카페 초승달</a>
			</div>
			<div data-type="row" class="inline-row">
				<nav class="navbar navbar-expand-sm bg-light justify-content-center">
				  <ul class="navbar-nav">
				    <li class="nav-item">
				      <a class="nav-link" href="#">첫 구매라면?</a>
				    </li>
				    <li class="nav-item">
				      <a class="nav-link" href="#">Shop(여기 드랍박스)</a>
				    </li>
				    <li class="nav-item">
				      <a class="nav-link" href="#">About(여기 드랍박스)</a>
				    </li>
				    <li class="nav-item">
				      <a class="nav-link" href="#">Review(여기 드랍박스)</a>
				    </li>
				    <li class="nav-item">
				      <a class="nav-link" href="#">고객센터(여기 드랍박스)</a>
				    </li>
				  </ul>
				</nav>
			</div>
		</div>
		<div data-type="col-group" data-col-group="right" class="inline col-group inline-col-group-right" style="widgh:395px; background-color: #60f4c7;">오른쪽에 둘 박스.
			<a href="#">LOGIN</a>
			<a href="#">JOIN</a>
			<a href="#">CART</a>
			
		</div>
	</div>	
</div>
	
</body>
</html>