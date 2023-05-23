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
</head>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;500;700&family=Open+Sans:wght@300;500;700&display=swap" rel="stylesheet">
<style>
    @font-face {
        font-family: 'Tenada';
        src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2210-2@1.0/Tenada.woff2') format('woff2');
        font-weight: normal;
        font-style: normal;
    }

    header {
        width: 100%;
        font-family: 'Open Sans', sans-serif;
        top : 0;
        right : 0;
        left : 0;
        background-color: white;
    }
    .head {
    	margin-top : 50px;
    }
    .logo {
        text-decoration: none;
        font-family: 'Tenada';
        font-size: 40px;
        color: black;
        margin-left: 120px;
    }
    .logout {
        text-decoration: none;
        float: right;
        margin-right: 120px;
        margin-top: 50px;
        font-size: 14px;
    }

    img {
        width: 400px;
        margin-left: 10px;
    }
    nav {
        width: 100%;
    }
    ul {
    	display: flex;
        list-style: none;
    }
    li {
    	list-style : none;
    }
    .item {
        padding-right: 50px;
        padding-left: 50px;
        width: 25%;
    }
    .subMenu {
        display: none;
    }
    .item:hover .subMenu{
        display: block;
        cursor: pointer;
    }
    .menu, .subMenu > div {
        padding-top: 20px;
        text-align: center;
    }
    a, a:visited {
    	text-decoration: none;
    	color: black;
    }
    .subMenu > div:hover {
        color: green;
    }
</style>
<script>
	$('.mypage').on('click', function() {
		location.href = '${contextPath}/person/mypage.form';
		
	})
</script>
<body>
    <!-- 로그인 안 했을 때의 Header 입니당 -->
    <header>
    	<div class="head">
        <a href="${contextPath}/person/index.form" class="logo">야채단속반<img src="${contextPath}/resources/images/logo.png"></a>
        <a href="${contextPath}/person/logout.do" class="logout">로그아웃</a>
        </div>
        <nav class="mainMenu">
	        <ul class="items">
	            <li class="item">
	                <div class="menu">WANTED</div>
	        		<div class="subMenu">
	        			<div><a href="${contextPath}/menu1/wanted.form">상품목록</a></div>
	        		</div>
	            </li>
	            <li class="item">
	                <div class="menu">RECIPE</div>
	        		<div class="subMenu">
	        			<div><a href="${contextPath}/menu2/recipe.form">레시피 목록</a></div>
	        			<div><a>레시피 작성</a></div>
	        		</div>
	            </li>
	            <li class="item">
	                <div class="menu">CART</div>
	        		<div class="subMenu">
	        			<div><a href="${contextPath}/order/cart.form">장바구니</a></div>
	        		</div>
	            </li>
	            <li class="item">
	                <div class="menu">MY PAGE</div>
	        		<div class="subMenu">
	        			<div><a href="${contextPath}/person/mypage.form">회원정보</a></div>
	        			<div><a href="${contextPath}/qna/list.form">QnA</a></div>
	        		</div>
	            </li>
	        </ul>
		</nav>
    </header>
</body>
</html>