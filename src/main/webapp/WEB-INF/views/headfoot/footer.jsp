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
        margin-top: 30px;
        font-size: 14px;
    }
    img {
        width: 400px;
        margin-left: 10px;
    }
    nav {
        width: 100%;
    }
    .mainMenu, .subMenu {
        display: flex;
        list-style: none;
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
    .menu, .subMenu > li {
        padding-top: 20px;
        text-align: center;
    }
    .subMenu > li:hover {
        color: green;
    }
</style>
<body>
    <!-- 로그인 안 했을 때의 Header 입니당 -->
    <header>
    	<div class="head">
        <a href="#" class="logo">야채단속반<img src="../headfoot/logo.png" alt=""></a>
        <a href="" class="logout">로그아웃</a>
        </div>
        <nav class="mainMenu">
            <li class="item">
                <ul><div class="menu">WANTED</div></ul>
                <ul class="subMenu">
                    <li>상품목록</li>
                </ul>
            </li>
            <li class="item">
                <ul><div class="menu">RECIPE</div></ul>
                <ul class="subMenu">
                    <li>레시피 목록</li>
                    <li>레시피 작성하기</li>
                </ul>
            </li>
            <li class="item">
                <ul><div class="menu">CART</div></ul>
                <ul class="subMenu">
                    <li>장바구니</li>
                </ul>
            </li>
            <li class="item">
                <ul><div class="menu">MYPAGE</div></ul>
                <ul class="subMenu">
                    <li>회원정보</li>
                    <li>주문내역</li>
                    <li>로그아웃</li>
                </ul>
            </li>
        </nav>

    </header>
</body>
</html>