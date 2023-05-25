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
<script src="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.js"></script>
<script type="text/javascript">
	function fnGo() {
		location.href = "${contextPath}/menu1/wanted.form";
	}
</script>	
</head>
<style>
    @font-face {
        font-family: 'Tenada';
        src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2210-2@1.0/Tenada.woff2') format('woff2');
        font-weight: normal;
        font-style: normal;
    }
	@font-face {
	    font-family: 'OTWelcomeRA';
	    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2110@1.0/OTWelcomeRA.woff2') format('woff2');
	    font-weight: normal;
	    font-style: normal;
	}
    @keyframes fadeInUp {
        0% {
            opacity: 0;
            transform: translate3d(0, 100%, 0);
        }
        to {
            opacity: 1;
            transform: translateZ(0);
        }
    }
 
    .main {
        position: relative;
        top : 100px;
        left : 180px;
                animation: fadeInUp 3s;
        
    }
    .write {
    	font-family: 'OTWelcomeRA';
        font-size: 60px;
    }
    .goBtn {
    	background-color: black;
    	color : white;
    	padding : 10px 20px 10px 20px;
    	margin-top : 10px;
    	width: 120px;
    	height: 40px;
    	display: block;
    }
    .goBtn:hover {
    	cursor: pointer;
    }
   .image1 {
   		width : 100vw;
   		height : 60vw;
   		margin-top : -50px;
        background : url("${contextPath}/resources/images/index1-new.png");
        background-size: 100% 100%;
   }
   .image2 {
        width: 100vw;
        height: 280vh;
        background: url("${contextPath}/resources/images/2.png") scroll;
        background-size: 100% 100%;
   }
	
	
</style>
<body>
	<c:if test="${sessionScope.loginId == null}">
		<%@ include file="headfoot/header-x.jsp" %>
	</c:if>
	<c:if test="${sessionScope.loginId != null}">
		<%@ include file="headfoot/header.jsp" %>
	</c:if>
	<div class="main">
		<div class="write">
            버려지는 야채를
            <br>당신의 테이블로 검거하세요
        </div>
    	<input type="button" onclick="fnGo()" class="goBtn" value="검거하러 가기">
    </div>
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
	<%@ include file="headfoot/carrot.jsp" %>
</body>
</html>