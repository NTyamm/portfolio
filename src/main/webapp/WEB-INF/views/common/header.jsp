<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Document</title>
	<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
	<script src="https://code.jquery.com/ui/1.13.0/jquery-ui.js"></script>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap" rel="stylesheet">
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	
	<style>
		.col-group{width: 100%; height: 103px; display: flex; align-items: center;justify-content: space-around; }
		.inline-col-group-left{width: calc(100% / 3); float:left;}
		.inline-col-group-center{width: calc(100% / 3); float:left; flex: auto; display: table;border-collapse: collapse;}
		.inline-col-group-right{width: calc(100% / 3); float: right; text-align: right;}
		.inline-row{position: relative;  width: 100%; display: block; min-height: 20px;display: table-row; text-align: center;}
		.navbar-nav{justify-content: center;}
		.nav-item{list-style: none; margin: 0 5px 0 5px; text-align: center; display: inline-block;}

		.modal-open{
			overflow-x: hidden; overflow-y: auto; height: 100%;
		}
		.modal-open .modal{
			z-index: 1000; position: fixed; top: 50%; left:50%; transform: translate(-50%,-50%); outline: 0;  
			display: none; font-size: 13px; padding: 0px 24px 24px 24px !important;  
			
		}
		.modal-site-join-policy{
			margin-top: 0; margin-bottom: 500px; padding: 10px;
		}
		.modal-overlay {
			width: 100%; height: 100%;
			position: fixed; overflow-y: auto;
			display: block; padding-left: 16px;
			flex-direction: column; 
		
			background: rgba(0, 0, 0, 0.2); -webkit-backdrop-filter: blur(1.5);
		}
		.modal-content{
			background-color: #fafafa; border-radius: 10px; box-sizing: border-box; 
			position: fixed; z-index: 5000;
			width: 370px;
		
			text-align: left; font-family: 'Nanum Gothic', 'Noto Sans','sans-serif';
			line-height: 1.6; letter-spacing: 0px; -webkit-font-smoothing: antialiased;
		}
		.modal-content2{
			background-color: #fafafa; border-radius: 10px; box-sizing: border-box; 
			position: fixed; z-index: 5000; display: none;
			width: 370px;
	
			text-align: left; font-family: 'Nanum Gothic', 'Noto Sans','sans-serif';
			line-height: 1.6; letter-spacing: 0px; -webkit-font-smoothing: antialiased;
		}
		.modal-content3{
			background-color: #fafafa; border-radius: 10px; box-sizing: border-box; 
			position: fixed; z-index: 5000; display: none;
			width: 370px;
	
			text-align: left; font-family: 'Nanum Gothic', 'Noto Sans','sans-serif';
			line-height: 1.6; letter-spacing: 0px; -webkit-font-smoothing: antialiased;
		}
		
		.modal-policy-ttl {
			padding-left: 10px;
			display: inline;
			color: rgb(19, 19, 19);
		}
		.closebox {
			display: inline;
			float: right;
			padding-right: 10px; margin-top: 12px;
			cursor: pointer;
			text-shadow: 1px 1px 2px gray;
			color: white;
		}		
		
		.inputbox{
			margin: 10px 0 5px 0; cursor: pointer;
		}
		.form-group .box{
			height: 100px; border:1px solid #dfe0df; box-sizing: border-box;
			margin-top: -2px; border-radius: 4px; padding: 12px 14px; overflow-y: auto; background:#fff; color:#000;
		}
		.alert{color: red; padding: 0}
		.gray{color:gray}
		.btn-block .btn:first-child{
			margin-right: 1%; 
		}
		.btn-block .btn{
			width: 49%; height: 48px; line-height: 46px;padding: 0;letter-spacing: 0.1em; font-size: 14px; border: 1px solid #AAAAAA ; display: inline-block; text-align: center; white-space: nowrap;
			vertical-align: middle; cursor: pointer; text-decoration: none; font-weight: bold;
		}
		.btn-block .btn-default{
			float: left; color: #333; background-color: #FFF; border-color: #CCC; box-sizing: border-box;
		}
		.btn-block .btn-primary{
			float: right; color: #fff; background-color: #0b2f7f; border-color: #0b2f7f; box-sizing: border-box;
		}
		.form-group{
			margin-bottom: 25px;
		}
		.input-form{
			border: 1px solid #e0e0e0; background: #fff; border-top: 1px solid #e0e0e0; box-sizing: border-box; position: relative;
		}
		.input-form input{
			border: none; width: 288px; height: 39.6px;  padding: 0 16px; line-height: 1.2; font-size: inherit; margin: 0; display: inline-block; cursor: text; 
		}
		.btn-idchk{
			letter-spacing: 0; font-size: 14px;  font-family: inherit;
			color: #FFF; font-weight: bold; vertical-align: middle; text-align: center;
			border: 1px solid rgba(0,0,0,0.2); background-color: #000;
			cursor: pointer; 
			margin: 0; padding: 12px 16px; width: 322px; 
		}
		.icon-required{
			display: inline-block; width: 5px; height: 5px; background: #f25656; border-radius: 50%; margin-left: 5px; vertical-align: 2px;
		}
		.input-form2{
			box-sizing: border-box; position: relative; display:flex; justify-content: space-between; align-items:center;
		}
		.input-form2 input{
			border: 1px solid #e0e0e0; width:49%; height: 39.6px; padding: 0 16px; line-height: 1.2; font-size: inherit; margin: 0; display: inline-block; cursor: text;
			box-shadow: none;
		}
		.me_zipbtn{
			cursor: pointer; 
			color: #FFF; font-weight: bold; vertical-align: middle; text-align: center;
			border: 1px solid rgba(0,0,0,0.2); background-color: #000; float: right; box-sizing: border-box;
		}
		.alert-info{
			background-color: transperant; border: none;
		}
		.btn{
			cursor: pointer;
		}
		._join_btn2{
			background: #0b2f7f; border: 0px solid #0b2f7f; color: #fff; font-size: 14px; font-weight: bold; 
			padding: 10px 25px; width: 100%; height: 45px;
		}
		.btn-block{
		}
		.btn-block .btn-login{
			background: #0b2f7f; border: 0px solid #0b2f7f; color: #fff; font-size: 14px; font-weight: bold; 
			padding: 10px 25px; width: 100%; height: 45px; vertical-align:middle;
		}
		.float-l{
			float:left;  border: none; background:transparent;
		}
		.float-r{
			float:right; border: none; background:transparent;
		}
</style>
</head>
<body class="modal-open">
<!--이거머라고쓴거냐!-->
<div class = "section_bg_wrap fixed_transform">
	<div class = "section bg_color">
		<div data-type="col-group" data-col-group="left" class="inline col-group inline-col-group-left" style="background-color: #74992e;"></div>
		<div data-type="col-group" data-col-group="center" class="inline col-group inline-col-group-center"> <p>
			<div class="inline-row"></div>
			<div data-type="row" class="inline-row">
				<a href="/" style="block"></a>
			</div>
			<div data-type="row" class="inline-row">
				<nav class="navbar navbar-expand-sm bg-light justify-content-center">
				  <ul class="navbar-nav">
				    <li class="nav-item">
				      <a class="nav-link" href="#">첫 구매라면?</a>
				    </li>
				    <li class="nav-item">
				      <a class="nav-link" href="<%=request.getContextPath()%>/murchanlist">Shop</a>
				    </li>
				    <li class="nav-item">
				      <a class="nav-link" href="<%=request.getContextPath()%>/about">About</a>
				    </li>
				    <li class="nav-item">
				      <a class="nav-link" href="<%=request.getContextPath()%>/list">Review</a>
				    </li>
				    <li class="nav-item">
				      <a class="nav-link" href="#">고객센터</a>
				    </li>
				  </ul>
				</nav>
			</div>
		</div>
		<div data-type="col-group" data-col-group="right" class="inline col-group inline-col-group-right" style="widgh:395px; background-color: #60f4c7;">
			<div class="btn-header-box">
			<!-- 비로그인상태 -->
				<c:if test="${ user == null }">
					<button class="btn btn-header btn-login">LOGIN</button>
					<button class="btn btn-header btn-join" id="btn-join">JOIN</button>
				</c:if>
			<!-- 로그인상태 -->
				<c:if test="${ user != null }">
				     <a class="btn btn-header btn-my" href="<%=request.getContextPath()%>/mypage">MY</a>
				     <a class="btn btn-header btn-logout" href="<%=request.getContextPath()%>/logout">LOGOUT</a>
			    </c:if>
			   	<a class="btn btn-header btn-text" href="#">CART</a>
			   	 <c:if test="${user != null && user.me_auth =='슈퍼 관리자' }">
			    	<a class="btn btn-header btn-admin" href="<%=request.getContextPath()%>/admin/index">ADMIN</a>
			    </c:if>
			</div>
		</div>
	</div>	
	<div id="modal_join" class="modal modal-overlay">
		<div class="modal modal-content">
			<div class="modal-policy-ttl">
				<div class="closebox">X</div>
				<h1 style="text-align: center;">약관동의</h1>
				<div class="checkbox-group">
					<div class="inputbox input-all-check">
						<label class="inputbox all-check-label">
							<input type="checkbox" id="check-all">
							<span class="agree_ttl">이용약관, 개인정보 수집 및 이용에 모두 동의합니다.</span>
						</label>
					</div>
					<div class="inputbox input-policy-check">
						<label class="inputbox policy-check-label">
							<input type="checkbox" id="cahck-1" class="checklabel">
							<span class="agree_ttl">이용약관 동의<em class="alert">(필수)</em></span>
						</label>
					</div>
					<div class="form-group policy">
						<div tabindex="0" class="form-group box">
								제1조 목적
								<br><br>
								본 이용약관은 “카페초승달”(이하 "사이트")의 서비스의 이용조건과 운영에 관한 제반사항 규정을 목적으로 합니다.
								<br><br>
								제2조 용어의 정의
								<br><br>
								본 약관에서 사용되는 주요한 용어의 정의는 다음과 같습니다.
								<br><br>
								① 회원 : 사이트의 약관에 동의하고 개인정보를 제공하여 회원등록을 한 자로서, 사이트와의 이용계약을 체결하고 사이트를 이용하는 이용자를 말합니다.<br>
								② 이용계약 : 사이트 이용과 관련하여 사이트와 회원간에 체결 하는 계약을 말합니다.<br>
								③ 회원 아이디(이하 "ID") : 회원의 식별과 회원의 서비스 이용을 위하여 회원별로 부여하는 고유한 문자와 숫자의 조합을 말합니다.<br>
								④ 비밀번호 : 회원이 부여받은 ID와 일치된 회원임을 확인하고 회원의 권익보호를 위하여 회원이 선정한 문자와 숫자의 조합을 말합니다.<br>
								⑤ 운영자 : 서비스에 홈페이지를 개설하여 운영하는 운영자를 말합니다.<br>
								⑥ 해지 : 회원이 이용계약을 해약하는 것을 말합니다.<br>
								<br><br>
								제3조 약관외 준칙
								<br><br>
								운영자는 필요한 경우 별도로 운영정책을 공지 안내할 수 있으며, 본 약관과 운영정책이 중첩될 경우 운영정책이 우선 적용됩니다.
								<br><br>
								제4조 이용계약 체결
								<br><br>
								① 이용계약은 회원으로 등록하여 사이트를 이용하려는 자의 본 약관 내용에 대한 동의와 가입신청에 대하여 운영자의 이용승낙으로 성립합니다.<br>
								② 회원으로 등록하여 서비스를 이용하려는 자는 사이트 가입신청시 본 약관을 읽고 아래에 있는 "동의합니다"를 선택하는 것으로 본 약관에 대한 동의 의사 표시를 합니다.<br>
								<br>
								제5조 서비스 이용 신청
								<br><br>
								① 회원으로 등록하여 사이트를 이용하려는 이용자는 사이트에서 요청하는 제반정보(이용자ID,비밀번호, 닉네임 등)를 제공해야 합니다.<br>
								② 타인의 정보를 도용하거나 허위의 정보를 등록하는 등 본인의 진정한 정보를 등록하지 않은 회원은 사이트 이용과 관련하여 아무런 권리를 주장할 수 없으며, 관계 법령에 따라 처벌 받을 수 있습니다.<br>
								<br>
								제6조 개인정보처리방침
								<br><br>
								사이트 및 운영자는 회원가입시 제공한 개인정보 중 비밀번호를 가지고 있지 않으며 이와 관련된 부분은 사이트의 개인정보처리방침을 따릅니다.<br>
								운영자는 관계법령이 정하는 바에 따라 회원등록정보를 포함한 회원의 개인정보를 보호하기 위하여 노력을 합니다.<br>
								<br>
								회원의 개인정보보호에 관하여 관계법령 및 사이트가 정하는 개인정보처리방침에 정한 바에 따릅니다.<br>
								<br>
								단, 회원의 귀책사유로 인해 노출된 정보에 대해 운영자는 일체의 책임을 지지 않습니다.<br>
								운영자는 회원이 미풍양속에 저해되거나 국가안보에 위배되는 게시물 등 위법한 게시물을 등록 · 배포할 경우 관련기관의 요청이 있을시 회원의 자료를 열람 및 해당 자료를 관련기관에 제출할 수 있습니다.<br>
								<br>
								제7조 운영자의 의무
								<br>
								① 운영자는 이용회원으로부터 제기되는 의견이나 불만이 정당하다고 인정할 경우에는 가급적빨리 처리하여야 합니다. 다만, 개인적인 사정으로 신속한 처리가 곤란한 경우에는 사후에공지 또는 이용회원에게 쪽지, 전자우편 등을 보내는 등 최선을 다합니다.<br>
								② 운영자는 계속적이고 안정적인 사이트 제공을 위하여 설비에 장애가 생기거나 유실된 때에는 이를 지체 없이 수리 또는 복구할 수 있도록 사이트에 요구할 수 있습니다. 다만, 천재지변 또는 사이트나 운영자에 부득이한 사유가 있는 경우, 사이트 운영을 일시 정지할 수 있습니다.<br>
								<br>
								제8조 회원의 의무
								<br><br>
								① 회원은 본 약관에서 규정하는 사항과 운영자가 정한 제반규정, 공지사항 및 운영정책 등 사이트가 공지하는 사항 및 관계법령을 준수하여야 하며, 기타 사이트의 업무에 방해가 되는 행위, 사이트의 명예를 손상시키는 행위를 해서는 안됩니다.<br>
								② 회원은 사이트의 명시적 동의가 없는 한 서비스의 이용권한, 기타 이용계약상 지위를 타인에게 양도, 증여할 수 없으며, 이를 담보로 제공할 수 없습니다.<br>
								③ 이용고객은 아이디 및 비밀번호 관리에 상당한 주의를 기울여야 하며, 운영자나 사이트의 동의 없이 제3자에게 아이디를 제공하여 이용하게 할 수 없습니다.<br>
								④ 회원은 운영자와 사이트 및 제3자의 지적 재산권을 침해해서는 안됩니다.<br>
								<br>
								제9조 서비스 이용시간
								<br><br>
								① 서비스 이용시간은 업무상 또는 기술상 특별한 지장이 없는 한 연중무휴 1일 24시간을 원칙으로 합니다. 단, 사이트는 시스템 정기점검, 증설 및 교체를 위해 사이트가 정한 날이나 시간에 서비스를 일시중단 할 수 있으며 예정된 작업으로 인한 서비스 일시 중단은 사이트의 홈페이지에 사전에 공지하오니 수시로 참고하시길 바랍니다.<br>
								② 단, 사이트는 다음 경우에 대하여 사전 공지나 예고없이 서비스를 일시적 혹은 영구적으로 중단할 수 있습니다.<br>
								- 긴급한 시스템 점검, 증설, 교체, 고장 혹은 오동작을 일으키는 경우<br>
								- 국가비상사태, 정전, 천재지변 등의 불가항력적인 사유가 있는 경우<br>
								- 전기통신사업법에 규정된 기간통신사업자가 전기통신 서비스를 중지한 경우<br>
								- 서비스 이용의 폭주 등으로 정상적인 서비스 이용에 지장이 있는 경우<br>
								③ 전항에 의한 서비스 중단의 경우 사이트는 사전에 공지사항 등을 통하여 회원에게 통지 합니다. 단, 사이트가 통제할 수 없는 사유로 발생한 서비스의 중단에 대하여 사전공지가 불가능한 경우에는 사후공지로 대신합니다.<br>
								<br>
								제10조 서비스 이용 해지
								<br><br>
								① 회원이 사이트와의 이용계약을 해지하고자 하는 경우에는 회원 본인이 온라인을 통하여 등록해지신청을 하여야 합니다. 한편, 사이트 이용해지와 별개로 사이트에 대한 이용계약 해지는 별도로 하셔야 합니다.<br>
								② 해지신청과 동시에 사이트가 제공하는 사이트 관련 프로그램이 회원관리 화면에서 자동적으로 삭제됨으로 운영자는 더 이상 해지신청자의 정보를 볼 수 없습니다.<br>
								<br>
								제11조 서비스 이용 제한
								<br><br>
								회원은 다음 각 호에 해당하는 행위를 하여서는 아니되며 해당 행위를 한 경우에 사이트는 회원의 서비스 이용 제한 및 적법한 조치를 취할 수 있으며 이용계약을 해지하거나 기간을 정하여 서비스를 중지할 수 있습니다.<br>
								① 회원 가입시 혹은 가입 후 정보 변경시 허위 내용을 등록하는 행위<br>
								② 타인의 사이트 이용을 방해하거나 정보를 도용하는 행위<br>
								③ 사이트의 운영진, 직원 또는 관계자를 사칭하는 행위<br>
								④ 사이트, 기타 제3자의 인격권 또는 지적재산권을 침해하거나 업무를 방해하는 행위<br>
								⑤ 다른 회원의 ID를 부정하게 사용하는 행위<br>
								⑥ 다른 회원에 대한 개인정보를 그 동의 없이 수집, 저장, 공개하는 행위<br>
								⑦ 범죄와 결부된다고 객관적으로 판단되는 행위<br>
								⑧ 기타 관련 법령에 위배되는 행위<br>
								<br>
								제12조 게시물의 관리
								<br><br>
								① 사이트의 게시물과 자료의 관리 및 운영의 책임은 운영자에게 있습니다. 운영자는 항상 불량 게시물 및 자료에 대하여 모니터링을 하여야 하며, 불량 게시물 및 자료를 발견하거나 신고를 받으면 해당 게시물 및 자료를 삭제하고 이를 등록한 회원에게 주의를 주어야 합니다.<br>
								한편, 이용회원이 올린 게시물에 대해서는 게시자 본인에게 책임이 있으니 회원스스로 본 이용약관에서 위배되는 게시물은 게재해서된 안됩니다.<br>
								② 정보통신윤리위원회 등 공공기관의 시정요구가 있는 경우 운영자는 회원의 사전동의 없이 게시물을 삭제하거나 이동 할 수 있습니다.<br>
								③ 불량게시물의 판단기준은 다음과 같습니다.<br>
								- 다른 회원 또는 제3자에게 심한 모욕을 주거나 명예를 손상시키는 내용인 경우<br>
								- 공공질서 및 미풍양속에 위반되는 내용을 유포하거나 링크시키는 경우<br>
								- 불법복제 또는 해킹을 조장하는 내용인 경우<br>
								- 영리를 목적으로 하는 광고일 경우<br>
								- 범죄와 결부된다고 객관적으로 인정되는 내용일 경우<br>
								- 다른 이용자 또는 제3자와 저작권 등 기타 권리를 침해하는 경우<br>
								- 기타 관계법령에 위배된다고 판단되는 경우<br>
								④ 사이트 및 운영자는 게시물 등에 대하여 제3자로부터 명예훼손, 지적재산권 등의 권리 침해를 이유로 게시중단 요청을 받은 경우 이를 임시로 게시중단(전송중단)할 수 있으며, 게시중단 요청자와 게시물 등록자 간에 소송, 합의 기타 이에 준하는 관련기관의 결정 등이 이루어져 사이트에 접수된 경우 이에 따릅니다.<br>
								<br>
								제13조 게시물의 보관
								<br><br>
								사이트 운영자가 불가피한 사정으로 본 사이트를 중단하게 될 경우, 회원에게 사전 공지를 하고 게시물의 이전이 쉽도록 모든 조치를 취하기 위해 노력합니다.<br>
								<br>
								제14조 게시물에 대한 저작권
								<br><br>
								① 회원이 사이트 내에 게시한 게시물의 저작권은 게시한 회원에게 귀속됩니다. 또한 사이트는 게시자의 동의 없이 게시물을 상업적으로 이용할 수 없습니다. 다만 비영리 목적인 경우는 그러하지 아니하며, 또한 서비스 내의 게재권을 갖습니다.<br>
								② 회원은 서비스를 이용하여 취득한 정보를 임의 가공, 판매하는 행위 등 서비스에 게재된 자료를 상업적으로 사용할 수 없습니다.<br>
								③ 운영자는 회원이 게시하거나 등록하는 사이트 내의 내용물, 게시 내용에 대해 제12조 각 호에 해당된다고 판단되는 경우 사전통지 없이 삭제하거나 이동 또는 등록 거부할 수 있습니다.<br>
								<br>
								제15조 손해배상
								<br><br>
								① 본 사이트의 발생한 모든 민,형법상 책임은 회원 본인에게 1차적으로 있습니다.<br>
								② 본 사이트로부터 회원이 받은 손해가 천재지변 등 불가항력적이거나 회원의 고의 또는 과실로 인하여 발생한 때에는 손해배상을 하지 하지 않습니다.<br>
								<br>
								제16조 면책
								<br><br>
								① 운영자는 회원이 사이트의 서비스 제공으로부터 기대되는 이익을 얻지 못하였거나 서비스 자료에 대한 취사선택 또는 이용으로 발생하는 손해 등에 대해서는 책임이 면제됩니다.<br>
								② 운영자는 본 사이트의 서비스 기반 및 타 통신업자가 제공하는 전기통신서비스의 장애로 인한 경우에는 책임이 면제되며 본 사이트의 서비스 기반과 관련되어 발생한 손해에 대해서는 사이트의 이용약관에 준합니다<br>
								③ 운영자는 회원이 저장, 게시 또는 전송한 자료와 관련하여 일체의 책임을 지지 않습니다.<br>
								④ 운영자는 회원의 귀책사유로 인하여 서비스 이용의 장애가 발생한 경우에는 책임지지 아니합니다.<br>
								⑤ 운영자는 회원 상호간 또는 회원과 제3자 상호간, 기타 회원의 본 서비스 내외를 불문한 일체의 활동(데이터 전송, 기타 커뮤니티 활동 포함)에 대하여 책임을 지지 않습니다.<br>
								⑥ 운영자는 회원이 게시 또는 전송한 자료 및 본 사이트로 회원이 제공받을 수 있는 모든 자료들의 진위, 신뢰도, 정확성 등 그 내용에 대해서는 책임지지 아니합니다.<br>
								⑦ 운영자는 회원 상호간 또는 회원과 제3자 상호간에 서비스를 매개로 하여 물품거래 등을 한 경우에 그로부터 발생하는 일체의 손해에 대하여 책임지지 아니합니다.<br>
								⑧ 운영자는 시삽의 귀책사유 없이 회원간 또는 회원과 제3자간에 발생한 일체의 분쟁에 대하여 책임지지 아니합니다.<br>
								⑨ 운영자는 서버 등 설비의 관리, 점검, 보수, 교체 과정 또는 소프트웨어의 운용 과정에서 고의 또는 고의에 준하는 중대한 과실 없이 발생할 수 있는 시스템의 장애, 제3자의 공격으로 인한 시스템의 장애, 국내외의 저명한 연구기관이나 보안관련 업체에 의해 대응방법이 개발되지 아니한 컴퓨터 바이러스 등의 유포나 기타 운영자가 통제할 수 없는 불가항력적 사유로 인한 회원의 손해에 대하여 책임지지 않습니다.<br>
								<br>
								제17조 마케팅활용동의 및 광고수신동의
								<br><br>
								① 운영자는 가입에 사용된 메일로 서비스와 관련된 신상품 소식, 이벤트 안내, 고객 혜택 등 다양한 정보를 제공할 수 있습니다.<br>
								<br>
								부칙
								<br><br>
								이 약관은 <사이트 개설일> 부터 시행합니다.<br><br>
						</div>
					</div>
					<div class="inputbox input-policy-check ">
						<label class="inputbox policy-check-label">
							<input type="checkbox" id="check-2" class="checklabel" >
							<span class="agree_ttl">개인정보 수집 및 이용 동의<em class="alert">(필수)</em></span>
						</label>
					</div>
					<div class="form-group policy">
						<div tabindex="0" class="form-group box">
							1. 개인정보 수집목적 및 이용목적
							<br><br>
							(1) 홈페이지 회원 가입 및 관리<br>
							회원 가입 의사 확인, 회원제 서비스 제공에 따른 본인 식별․인증, 회원자격 유지․관리, 제한적 본인확인제 시행에 따른 본인확인, 서비스 부정 이용 방지, 만 14세 미만 아동의 개인정보 처리시 법정대리인의 동의 여부 확인, 각종 고지․통지, 고충 처리 등의 목적
							<br><br>
							(2) 재화 또는 서비스 제공<br>
							물품 배송, 서비스 제공, 계약서․청구서 발송, 콘텐츠 제공, 맞춤 서비스 제공, 본인인증, 연령인증, 요금 결제 및 정산, 채권추심 등의 목적
							<br><br>
							(3) 고충 처리<br>
							민원인의 신원 확인, 민원사항 확인, 사실조사를 위한 연락․통지, 처리 결과 통보 등
							<br><br>
							2. 수집하는 개인정보 항목<br>
							ID, 성명, 비밀번호, 주소, 휴대폰 번호, 이메일, 14세 미만 가입자의 경우 법정대리인 정보
							<br><br>
							3. 개인정보 보유 및 이용기간<br>
							회원탈퇴 시까지 (단, 관계 법령에 보존 근거가 있는 경우 해당 기간 시까지 보유, 개인정보처리방침에서 확인 가능)<br><br>
						</div>
					</div>
				</div>
				<div class="inputbox input-lable">
					<label class="inputbox marketing-label">
						<span class="agree_ttl">마케팅 활용 동의 및 광고 수신 동의</span>
					</label>
				</div>
				<div class="form-group policy">
					<div tabindex="0" class="form-group box">
						서비스와 관련된 신상품 소식, 이벤트 안내, 고객 혜택 등 다양한 정보를 제공합니다..					
					</div>
				</div>
				<div class="inputbox input-sms-check">
				<label class="inputbox sms-check-label">
						<input type="checkbox" id="check-3">
						<span class="agree_ttl">SMS 수신 동의<span class="gray">(선택)</span></span>
					</label>
				</div>
				<div class="inputbox input-email-check">
					<label class="inputbox email-check-label">
						<input type="checkbox" id="check-4">
						<span class="agree_ttl">E-Mail 수신 동의<span class="gray">(선택)</span></span>
					</label>
				</div>
				<div class="btn-block btn-join-block">
					<a href="" data-dismiss="modal" class="btn btn-default btn-cancel">취소</a>
					<button class="btn btn-primary _join_btn">가입하기</button>
				</div>
			</div>
		</div>
		<div class="modal modal-content2">
			<div class="modal-policy-ttl">
				<div class="closebox">X</div>
				<h1 style="text-align: center;">회원가입</h1>
			</div>
			<div class="alert alert-info">추천인 코드 입력하면 1,000원 즉시 적립!</div>
			<form class="join-screen" style="position: relative;"action="<%=request.getContextPath()%>/signup" method="post">
				<div class="input_block form-group">
					<div class="input-form _item me_id">
						<input type="text" title="아이디" name="me_id" placeholder="아이디"  >
					</div>
					<button type="button" class="btn btn-idchk" name="idCheck">아이디 중복 확인</button>
					<div class="input-form _item me_pw">
						<input type="password" title="비밀번호" name="me_pw"placeholder="비밀번호"  >
					</div>
					<div class="input-form _item me_pw2">
						<input type="password" title="비밀번호확인" name="me_pw2" placeholder="비밀번호 확인">
					</div>
					<div class="input-form _item me_email">
						<input type="email" title="이메일" name="me_email" placeholder="이메일">
					</div>
				</div>
				<div class="input_block form-group">
					<label class="mini-ttl">이름
						<i aria-hidden="true" class="icon-required"></i>	
					</label>
					<div class="input-form _item me_name">
						<input type="text" title="이름" name="me_name" placeholder="이름을 입력하세요">
					</div>
				</div>
				<div class="input_block form-group">
					<label class="mini-ttl">연락처
						<i aria-hidden="true" class="icon-required"></i>	
					</label>
					<div class="input-form _item me_phone">
						<input type="text" title="연락처" name="me_phone" placeholder="연락처">
					</div>
				</div>
				<div class="input_block form-group">
					<label class="mini-ttl">주소
						<i aria-hidden="true" class="icon-required"></i>	
					</label>
					<div class="form-inline mb-2">
				<input type="text" id="postcode" name="me_zip" placeholder="우편번호" class="input-form2 form-control col-6">
				<input type="button" onclick="execDaumPostcode()" value="우편번호 찾기" class="form-control col-6">
			</div>
			<input type="text" id="address" name="me_address1" placeholder="주소" class="form-control mb-2">
			<input type="text" id="detailAddress" name="me_address2" placeholder="상세주소" class="form-control mb-2">
			<input type="hidden" name="me_address">
				</div>
				<div class="input_block form-group">
					<label class="mini-ttl">추천인</label>
					<div class="input-form _item me_name">
						<input type="text" title="추천인" name="me_name" placeholder="추천인 코드를 입력하세요.">
					</div>
				</div>
				<div class="input_block form-group no-margin">
					<button class="btn btn-brand _join_btn2">회원가입</button>
				</div>
			</form>
		</div>
		<div class="modal modal-content3">
			<div class="modal-login-ttl">
				<div class="closebox">X</div>
				<h1 style="text-align: center;">로그인</h1>
			</div>
			<form class="login-screen" style="position: relative;" action="<%=request.getContextPath()%>/login" method="post">
				<div class="input_block form-group">
					<div class="input-form me_id">
						<input type="text" title="아이디" name="me_id" placeholder="아이디"  >
					</div>
					<div class="input-form me_pw">
						<input type="password" title="비밀번호" name="me_pw"placeholder="비밀번호"  >
					</div>
				</div>
				<div class="inputbox input-login-check ">
					<label>
						<input type="checkbox" name="me_auto_login" value="ok">로그인상태유지
				</div>
				<div class="btn-block">
					<button class="btn btn-login">로그인</button>
				</div>
				<div class="other_btns">
					<button type="button" class="float-l btn-join">회원가입</button>
					<button type="button" class="float-r find-info">아이디·비밀번호 찾기</button>
				</div>
			</form>
		</div>
	</div>
	
</div>
<script>
	$('.btn-join').click(function(){
		$('.modal').show();
		$('.modal-content3').hide();
		$('.modal-content2').hide();
	});
	$('.closebox').click(function(){
		$('.modal').hide();
	});
	$('.btn-cancel').click(function(){
		$('.modal').hide();
	});
	$('.checkbox-group').on('click','#check-all',function(){
		var checked=$(this).is(':checked');
		if(checked){
			$(this).parents('.checkbox-group').find('input').prop('checked', true);
		}else{
			$(this).parents('.checkbox-group').find('input').prop('checked',false);
		}
	});
	$('.checkbox-group').on('click','.checklabel',function(){
		var checked=$(this).is(':checked');
		if(!checked){
			$('#check-all').prop('checked',false);
		}
	});
	$('.checkbox-group').on('click','.checklabel',function(){
		var is_checked=true;
		$('.checkbox-group .checklabel').each(function(){
			is_checked=is_checked && $(this).is(':checked');
		});
		$('#check-all').prop('checked',is_checked);
	});
	$('._join_btn').on('click',function(){
		var isAgree = $('#check-all').is(':checked');
		if(!isAgree){
        alert('필수약관에 동의해야 합니다.');
        $('#check-all').focus();
        return false;
		}
		$('.modal-content').hide();
		$('.modal-content2').show();
	});
	$('.btn-login').click(function(){
		$('.modal').show();
		$('.modal-content').hide();
		$('.modal-content2').hide();
	})
	
	
	var idCheck = false;
	$('[name=idCheck]').click(function(){
		var id = $('.modal-content2 [name = me_id]').val();//회원가입 창 안의 me_id만 활용. 로그인용 모달과 충돌 없도록
		if(id == ''){
			alert();
			return;
		}
			
		$.ajax({ //중괄호 안에 ajax 옵션을 선택해서 넣으라는 의미
			async: false, //다 끝날 때까지 기다리삼
			type: 'get', //id는 url에 노출되어도 상관없음
			//data: {id: ??}, get 방식ㅇ은 딱히 필요 없음. 대신 url에 아이디를 붙여준다
			url:'<%=request.getContextPath()%>/idcheck?me_id='+id,
			success:function(data){
				if(data=='true'){
					alert('사용 가능한 아이디입니다.');
					idCheck = true;
				}else{
					alert('이미 사용중인 아이디입니다.');
					idCheck = false;
				}
			}
		});
	})
	$('[name=me_id]').change(function(){
			idCheck = false;
		});
	
	//회원가입폼 서브밋
	$('.join-screen').submit(function(){
		if(!idCheck){
			alert('아이디 중복검사를 하세요.');
			return false;
		}
		
	});
	
	
	
	function execDaumPostcode() {
		new daum.Postcode({
			oncomplete: function(data) {
				var addr = ''; // 주소 변수
				var extraAddr = ''; // 참고항목 변수
				if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
					addr = data.roadAddress;
				} else { // 사용자가 지번 주소를 선택했을 경우(J)
					addr = data.jibunAddress;
				}

				// 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
				if(data.userSelectedType === 'R'){
					// 법정동명이 있을 경우 추가한다. (법정리는 제외)
					// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
					if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
							extraAddr += data.bname;
					}
					// 건물명이 있고, 공동주택일 경우 추가한다.
					if(data.buildingName !== '' && data.apartment === 'Y'){
							extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
					}
				
				} 
				// 우편번호와 주소 정보를 해당 필드에 넣는다.
				document.getElementById('postcode').value = data.zonecode;
				document.getElementById("address").value = addr;
				// 커서를 상세주소 필드로 이동한다.
				document.getElementById("detailAddress").focus();
			}
		}).open();
	}

</script>
</body>
</html>