<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<script src="https://code.jquery.com/ui/1.13.0/jquery-ui.js"></script>
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<style>
	.main-container{height : 100%; margin: 0 auto; display:block; box-sizing: border-box; color: #212121; font-size: 13px; line-height: 1.6; font-weight: normal; font-style:normal;}
	.inside .doz_row{margin-left:-15px; margin-right:-15px; box-sizing: border-box;}
	.line-making{box-sizing:border-box; display:block; margin-top:15px; margin-botton:15px;}
	.line{position:relative; width:100%; margin: 0 auto; box-sizing: border-box; border: 0px; width:100%; box-shadow:none;}
	.line:first-child{border-style:solid; max-width:100%; margin: 0 auto; box-sizing: content-box; display:block; overflow: hidden; unicode-bidi:isolate;}
	.text-wrap{box-sizing: border-box; display: block; font-size: 13px; color:#212121; line-height:1.6;}
	.container-fluid{position:relative; padding-botton:60px; display:block; }
	.col-md-2{width:16.66666667%; float:left; padding-left:15px; padding-right:15px;}
	.vertical-middle:before{content:''; display:block; width: 1px; height: 100px; position: absolute; background:#e5e5e5; left:0; top:50%; margin-top:-50px}
	.vertical-middle{vertical-align:middle;}
	.table-cell{dsplay:tabel-cell;}
	.point-view{position:relative; width:25%}
</style>
</head>
<body class="body container" method="post" action="<%=request.getContextPath()%>/mypage">
<div class="container-box main-container">
	<div class="inside">
		<div class="doz_row" doz_grid="12">
			<div class="col-dz col-dz-12" doz_grid="12">
				<div class="line-making">
					<div class="line">
						<hr>
					</div>
				</div>
			</div>
		</div>
		<div class="doz_row" doz_grid="12">
			<div class="text-wrap">
				<div class="text-table">
					<p style="text-align: left;">
						<span style="font-size:20px;">&nbsp;</span>
					</p>
					<p style="text-align: center;">
						<span style="font-size:20px;">
							<strong>
								<span style="color: rgb(0,0,0);">⚠️ 배송지 변경 및 주문 취소</span>
							</strong>
							는<br>
							<strong>
								<span style="color: rgb(0,0,0);">주문/결제 당일</span>
							</strong>
							문의해주셔야 변경 가능합니다.
						</span>
					</p>
					<p style="text-align: left;">
						<span style="font-size:20px;">&nbsp;</span>
					</p>
				</div>
			</div>
		</div>
		<div class="doz_row">
			<div class="col-dz col-dz-12">
				<div class="shop-content mypage">
					<div class="container-fluid">
						<div class="col-md-2 col-sm-12 hidden-xs hidden-sm left-menu">
							<ul>
								<li class="on">
									<a href="/" class="text-gray-dark fade-link">주문 조회</a>
								</li>
								<li class="on">
									<a href="/" class="text-gray-dark fade-link">위시 리스트</a>
								</li>
								<li class="on">
									<a href="/" class="text-gray-dark fade-link">취소 조회</a>
								</li>
								<li class="on">
									<a href="/" class="text-gray-dark fade-link">포인트 조회</a>
								</li>
								<li class="on">
									<a href="/" class="text-gray-dark fade-link">1:1 문의</a>
								</li>
								<li class="on">
									<a href="/" class="text-gray-dark fade-link">정보 수정</a>
								</li>
								<li class="on">
									<a href="/" class="text-gray-dark fade-link">회원 탈퇴</a>
								</li>
							</ul>
						</div>
						<div class="col-md-10 col-sm-12">
							<div class="head-mypage-front">
								<div class="my-theme tabled full-width">
									<div class=" vertical-middle no-margin-top">
										<span class="ug_name text-brand">달까지 10km</span>
										<div class=ug_text>
											구매금액 100,000원 달성 시<br>달까지 1km 로 승급됩니다.
										</div>
										<div class="ug_btn">
											<a href="/" class="btn hidden-xs " role="button" data-toggle="popover" data-placement="bottom" data-popover-content="#list-popover" data-original-title="" title="">등급혜택 보기</a>
										</div>
									</div>
									<div class="table-cell vertical-middle point-view text-center">
										<a href="/">
											<p>만월포인트</p>
											<span class="text-bold text-32">1000</span>
										</a>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>


 
</body>
</html>