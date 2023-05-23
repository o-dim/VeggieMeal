<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:if test="${sessionScope.id == null}">
	<%@ include file="headfoot/header-x.jsp" %>
</c:if>
<c:if test="${sessionScope.id != null}">
	<%@ include file="headfoot/header.jsp" %>
</c:if>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="${contextPath}/resources/js/lib/jquery-3.6.4.min.js"></script>
</head>
<style>

   .image1 {
   		width : 100vw;
   		height : 60vw;
        background : url("${contextPath}/resources/images/index1.png");
        background-size: 100% 100%;
   }
   .image2 {
        width: 100vw;
        height: 270vh;
        background: url("${contextPath}/resources/images/2.png") scroll;
        background-size: 100% 100%;
   }

</style>
<body>
	
    <div class="image1"></div>
    <div class="image2"></div>
	
	<br>
	<a href="${contextPath}/admin/adminPage.form">admin</a>
	<br>
	<a href="${contextPath}/person/login.form">login</a>
	<br>
	<a href="${contextPath}/person/mypage.form">my page</a>
	<br>
	<a href="${contextPath}/menu1/wanted.form">wanted</a>
	<br>
	<a href="${contextPath}/menu2/recipe.form">recipe</a>
	<br>
	<a href="${contextPath}/order/cart.form">cart</a>
	<br>
	<a href="${contextPath}/qna/list.form">qna list</a>
</body>
</html>