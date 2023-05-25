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
<style>
    @font-face {
        font-family: 'Tenada';
        src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2210-2@1.0/Tenada.woff2') format('woff2');
        font-weight: normal;
        font-style: normal;
    }
	footer {
		bottom: 0;
		width: 100%;
		height : 30vh;
		background-color: #FACC57;
		display: flex;
		justify-content: center;
	}
	.content {
		margin-top: 10px;
	}
	.top {
		font-size: 40px;
		font-family: 'Tenada';		
	}
	.bottom {
		font-size: 14px;
	}

</style>
<body>
	<footer>
		<div class="content">
	    <div class="top">
	      <h5>야채단속반</h5>
	    </div>
	    <div class="bottom">
	      주식회사 중꺽마  |   대표 : 구디자바61   |   사업자 등록번호 : 111-1111-1111    |    소재시 : 서울특별시 금천구<br>
	      통신판매업 신고번호 : 21324312412421    |     제품 및 취업 문의 : example@email.com     |      농산물포획 및 긴급구출제보 : 구디자바2조
	    </div>
	    </div>
	</footer>
</body>
</html>