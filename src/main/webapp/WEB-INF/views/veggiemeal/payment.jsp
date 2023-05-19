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
<script>

</script>

<style>
	
	@font-face {
    font-family: 'Tenada';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2210-2@1.0/Tenada.woff2') format('woff2');
    font-weight: normal;
    font-style: normal;
}
	
 	header {
 		 position: fixed;
		  top: 0;
		  left: 0;
		  right: 0;
		  
		  height: 50px;
		  padding: 1rem;
		  color: black;
		  font-size : 32px;
		  background: white;
		  display: flex;
		  justify-content: space-between;
		  align-items: center;
		  border-bottom: 20px solid #facc57;
	
	}
	
	header > div {
		float:left;
		vertical-align: top;
		font-family: 'Tenada';
	}
	
	button {
      margin-left: 10px;
      font-size: 16px;
      background-color: transparent;
      border: none;
   }
	
	.logo {
		margin-bottom: -10px;
	}
	
	.logo_img {
		margin-right: 730px;
	
	}
	
	 .main_section {
           display: flex;
       }
       .left_section {
           border: 1px solid gray;
           margin-right: 20px;
           flex: 4;  /* width: 40%; */
       }
       .right_section {
           border: 1px solid gray;
           flex: 6;  /* width: 60%; */
       }
       article {
           margin: 10px 5px 0;
           padding: 10px;
           background-color: #FFF;
       }
       .img {
           padding: 20px;
           background-color: #888;
       }
       footer {
           height: 150px;
           margin-top: 10px;
           background-color: #facc57;
       }
       footer > p {
           text-align: center;
           line-height: 150px;
       }
	</style>
</head>

<body>
	<header>

	<div class="logo">
	야채단속반
	</div>
	<div class="logo_img">
	<img src="${contextPath}/resources/images/logo.png" width="250px">	
	</div>
	</header>
	
	
	
	<footer>
		   <div></div>
	       <h3>야채단속반</h3>
	       <div>주식회사 중꺽마 | 대표 : 구디자바61 | 사업자 등록번호 : 888-82-8888 </div>
	       <div>소재지:(08505) 서울특별시 금천구 가산디지털2로 95 (가산동, km타워) 2층, 3층</div>
		   <div>통신판매업 신고번호: 2023-서울금천-0526 | 제품 및 검거 문의 : moneyplease@gmail.com | 농산물 포회 및 긴급 구출 제보 : 02-3333-8282</div>
	</footer>	

</body>
</html>