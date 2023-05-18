<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="${contextPath}/resources/js/lib/jquery-3.6.4.min.js"></script>
</head>
<body>
	<iframe src="https://giphy.com/embed/TgFibAJdezKXUYsddv" width="480" height="360" frameBorder="0" class="giphy-embed" allowFullScreen></iframe>
	<h1>중꺽마</h1>
	<h1>인덱스는 수정하면 안돼요!!!</h1>
	
	<br>
	<a href="${contextPath}/admin/adminPage.do">admin</a>
	<br>
	<a href="${contextPath}/person/login.do">login</a>
	<br>
	<a href="${contextPath}/person/mypage.do">my page</a>
	<br>
	<a href="${contextPath}/menu1/wanted.do">wanted</a>
	<br>
	<a href="${contextPath}/menu2/recipe.do">recipe</a>
	<br>
	<a href="${contextPath}/order/cart.do">cart</a>
	<br>
	<a href="${contextPath}/qna/list.do">qna list</a>
</body>
</html>