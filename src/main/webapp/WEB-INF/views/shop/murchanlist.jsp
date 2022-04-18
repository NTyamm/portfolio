<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>SHOP</title>
 <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
<div>
	<form class="input-group mb-3" action="<%=request.getContextPath()%>/shop/murchanlist">
		  <input type="text" class="form-control" name="search" placeholder="검색어를 입력하세요." value="${pm.criteria.search }">
		  <div class="input-group-append">
		    <button class="btn btn-success" type="submit">검색</button>
		  </div>
		  <input type="hidden" name="type" value="${pm.criteria.type }">
		</form>
		<table class="table table-warning table-hover">
	    <thead>
	      <tr>
	        <th>상품명</th>
	      </tr>
	    </thead>
	    <tbody>
	    	<!-- 
	    		varStatus="vs" 일때
	    		vs.index : 0부터 시작해서 현재 반복된 횟수
	    		vs.count : 1부터 시작해서 현재 반복된 횟수
	    	-->
	    	<c:forEach items="${list}" var="murchandise" varStatus="vs">
		      <tr>
		        <td>${pm.totalCount - pm.criteria.pageStart - vs.index }</td>
	        	<td><a href="<%=request.getContextPath()%>/shop/murchanDetail?mu_num=${murchandise.mu_num}">${murchandise.mu_name}</a></td>
		      </tr>
	      </c:forEach>
	    </tbody>
	  </table>
   	<ul class="pagination justify-content-center">
   		<c:if test="${pm.prev}">
		    <li class="page-item">
		    	<a class="page-link" href="<%=request.getContextPath()%>/board/list?page=${pm.criteria.page-1}&search=${pm.criteria.search}&type=${pm.criteria.type}">이전</a>
		    </li>
	    </c:if>
	    <c:forEach begin="${pm.startPage}" end="${pm.endPage}" var="i">
	    	<c:if test="${i != pm.criteria.page }">
			    <li class="page-item">
			    	<a class="page-link" href="<%=request.getContextPath()%>/board/list?page=${i}&search=${pm.criteria.search}&type=${pm.criteria.type}">${i}</a>
			    </li>
		    </c:if>
		    <c:if test="${i == pm.criteria.page }">
			    <li class="page-item active">
			    	<a class="page-link" href="<%=request.getContextPath()%>/board/list?page=${i}&search=${pm.criteria.search}&type=${pm.criteria.type}">${i}</a>
			    </li>
		    </c:if>
	    </c:forEach>
	    <c:if test="${pm.next}">
		    <li class="page-item">
		    	<a class="page-link" href="<%=request.getContextPath()%>/board/list?page=${pm.criteria.page+1}&search=${pm.criteria.search}&type=${pm.criteria.type}">다음</a>
		    </li>
	    </c:if>
	  </ul>
	  <c:if test="${user != null}">
	  <a href="<%=request.getContextPath()%>/board/register?bd_type=${pm.criteria.type}">
	  	<button class="btn btn-outline-success">글쓰기</button>
	  </a>
	  </c:if>
	</div>
	<script>
	addSearch();
	//쿠키에 검색어 추가하는 함수로 이전에 검색했던 단어는 추가 안함.
	function addSearch(){
		//입력한 검색어 가져옴
		var search = '${pm.criteria.search}';
		//구분자
		var token = '___'
		//검색어가 없으면 종료
		if(search == '')
			return;
		//search 쿠키에 저장된 검색어들 가져옴
		var val = getCookie('search');
		//저장된 검색어들을 구분자를 이용하여 구분하여 배열에 저장
		var arr = val.split(token);
		//콘솔에 최근 검색어 출력(나중에 이부분을 활용하면 됨)
		console.log(arr);
		//이전에 사용했던 검색어는 중복해서 추가할 필요가 없기 때문에 그만함
		//최신순으로 나열하고 싶다면 이 조건문을 수정해야함.
		if(arr.indexOf(search) > 0)
			return;
		//이전 검색어들에 토큰과 현재 검색어를 추가
		val += token;
		val += search;
		//search쿠키에 검색어들을 덮어씀
		setCookie('search' , val, 7);
	}
	//쿠키의 값을 설정.
	//name : 쿠키 이름, value : 쿠키값, expireTime : 쿠키 만료시간(일)
	function setCookie(name, value, expireTime){
		var date = new Date();
		date.setTime(date.getTime() + expireTime*24*60*60*1000);
		document.cookie = name + '=' + value + ';expires=' + date.toUTCString() + ';path=/';
	}
	//쿠키 값을 가져옴
	//name : 쿠키이름
	function getCookie(name) {
	  var value = document.cookie.match('(^|;) ?' + name + '=([^;]*)(;|$)');
	  return value? value[2] : null;
	}
	</script>
</body>
</html>