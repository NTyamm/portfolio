<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SHOP</title>
</head>
<body>
	<c:forEach var="murchandise" items="${list}"><!-- c:를 이용해 반복문 작성 -->
		<tr>
		<!-- 썸네일 게시판형...? 으로 가는 게 나을지도 모르겠음 -->
			<td>${murchandise.mu_name}</td>
		</tr>
	</c:forEach>
</body>
</html>