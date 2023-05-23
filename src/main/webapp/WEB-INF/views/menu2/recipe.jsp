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

<style>
   @import url("https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.3.0/css/all.min.css");
   
   @font-face {
    font-family: 'Tenada';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2210-2@1.0/Tenada.woff2') format('woff2');
    font-weight: normal;
    font-style: normal;
	}

   
   button {
      margin-left: 10px;
      font-size: 16px;
      background-color: transparent;
      border: none;
   }
   
	.pictures {
		margin-left: 130px;
		margin-right: 130px;	
	}
	
	.recipe1 {
		display:flex;
		justify-content: space-between;
	}
	
	.recipe2 {
		display:flex;
		justify-content: space-between;
		margin-top: 50px;
	}
	
	
	
	.pictures h2 {
		font-size: 32px;
	}
   
	.pictures img {
		width:400px;
		height:250px;
	}
   
   .recipe2 h2{
      font-size: 32px;
   }
	

	.searchbar a {
	   margin-left: 10px;
	}

	
	.searchbar {
        width: 750px;
        height: 50px;
        border: solid 3px black;
        display: flex;
        justify-content: space-between;
      }
      .searchbar > div {
        height: 50px;
      }
      .searchbar > div:nth-of-type(2) {
        margin-right: 10px;
      }
      .search-bar__input {
        width: 600px;
        height: 50px;
        border: none;
        outline: none;
        margin-left: 10px;
      }

      .fa-magnifying-glass {
        font-size: 30px;
        right: 100px;
      }
      
      .btn {
        background-color: transparent;
        border: none;
        align-items: right;
        height: 50px;
      }
      
      .test{
      	display:flex;
      	margin-top:30px;
      	display: flex;
        justify-content: space-between;
      }

	.search_2{
		color: rgba(0, 0, 0, 0.5);
		padding-right: 100px;
		margin-top:15px;
	}
	
	p {
		text-align:center;
		font-size:20px;
		margin-bottom:20px;
	}
	

   
</style>
</head>
<body>
	<%@ include file="../headfoot/header.jsp" %>
	<div class="pictures">
		<h2>인기 레시피&gt;</h2>
		<div class="recipe1">
		<a href="${contextPath}/menu2/foodDetail.do?recipeNo=${r.recipeNo}">
			<img src="${contextPath}/resources/images/r_11.png"></a>
		<a href="${contextPath}/menu2/foodDetail.do">
			<img src="${contextPath}/resources/images/r_12.png"></a>
		<a href="${contextPath}/menu2/foodDetail.do">
			<img src="${contextPath}/resources/images/r_16.png"></a>
	</div>
	
	<div class="test">
		<div>
			<span class="searchbar">
				  <div> 
				      <input class="search-bar__input" type="search" placeholder="오늘 뭐 먹을까?">
			      </div>
			      <div>
				      <button type="submit" class="btn" onclick="fn_btn">
				      <span id="search" class="search_1">
				      	<i class="fa-solid fa-magnifying-glass"></i>
				      </span>
				      </button>
				  </div>
			</span>	
		</div>	      
				  <div class="search_2">
			      		#밀푀유나베 #고기완자 #연어아보카도덮밥
			      </div>
			      <div style="margin-top:15px;">
			      		<a href="${contextPath}/menu2/foodDetail.do">글쓰기</a>
			      </div>
	</div>
		
		<h2>전체 레시피&gt;</h2>
		<div class="recipe1">
			<div>
				<a href="${contextPath}/menu2/foodDetail.do">
					<img src="${contextPath}/resources/images/r_11.png"></a>
						<p>바게트 부르스게타</p>
			</div>
			<div>
				<a href="${contextPath}/menu2/foodDetail.do">
					<img src="${contextPath}/resources/images/r_12.png"></a>
						<p>버섯꼬치구이</p>
			</div>
			<div>
				<a href="${contextPath}/menu2/foodDetail.do">
					<img src="${contextPath}/resources/images/r_16.png"></a>
						<p>감자뇨끼</p>
			</div>
	    </div>
	   
		<div class="recipe2">
			<div>
				<a href="${contextPath}/menu2/foodDetail.do">
					<img src="${contextPath}/resources/images/r_29.png"></a>
						<p>완두콩스프</p>
			</div>
			<div>
				<a href="${contextPath}/menu2/foodDetail.do">
					<img src="${contextPath}/resources/images/r_31.png"></a>
						<p>가지피자</p>
			</div>
			<div>
				<a href="${contextPath}/menu2/foodDetail.do">
					<img src="${contextPath}/resources/images/r_27.png"></a>
						<p>부리또</p>
			</div>화이팅하시게나 병인언니:)
		</div>
		
		<div class="recipe2">
			<div>
				<a href="${contextPath}/menu2/foodDetail.do">
					<img style="object-fit: cover;" src="${contextPath}/resources/images/r_15.png"></a>
						<p>메쉬드포테이토</p>
			</div>	
			<div>
				<a href="${contextPath}/menu2/foodDetail.do">
					<img src="${contextPath}/resources/images/r_08.png"></a>
						<p>쌀국수</p>
			</div>	
			<div>
				<a href="${contextPath}/menu2/foodDetail.do">
					<img src="${contextPath}/resources/images/r_10.png"></a>
						<p>카레</p>
			</div>	
		</div>
		
		<div class="recipe2">
		<div>
			<a href="${contextPath}/menu2/foodDetail.do">
				<img src="${contextPath}/resources/images/r_22.png"></a>
					<p>라따뚜이</p>
		</div>
		<div>	
			<a href="${contextPath}/menu2/foodDetail.do">
				<img src="${contextPath}/resources/images/r_24.png"></a>
					<p>단호박찜</p>
		</div>
		<div>	
			<a href="${contextPath}/menu2/foodDetail.do">
				<img src="${contextPath}/resources/images/r_30.png"></a>
					<p>오크라조림</p>
		</div>	
		</div>
		
		<div class="recipe2">
			<div>
				<a href="${contextPath}/menu2/foodDetail.do">
					<img src="${contextPath}/resources/images/r_34.png"></a>
						<p>제육볶음</p>
			</div>
			<div>		
				<a href="${contextPath}/menu2/foodDetail.do">
					<img src="${contextPath}/resources/images/r_01.png"></a>
						<p>애플파이</p>
			</div>
			<div>		
				<a href="${contextPath}/menu2/foodDetail.do">
					<img src="${contextPath}/resources/images/r_09.png"></a>
						<p>방울양배추캐서롤</p>
			</div>		
		</div>
		
		<div class="recipe2">
			<div>		
				<a href="${contextPath}/menu2/foodDetail.do">
					<img src="${contextPath}/resources/images/r_20.png"></a>
						<p>후무스</p>
			</div>	
			<div>		
				<a href="${contextPath}/menu2/foodDetail.do">
					<img src="${contextPath}/resources/images/r_21.png"></a>
						<p>토마토스프</p>
			</div>	
			<div>		
				<a href="${contextPath}/menu2/foodDetail.do">
					<img src="${contextPath}/resources/images/r_23.png"></a>
						<p>버터감자</p>
			</div>	
		</div>
		
		<div class="recipe2">
		<div>		
				<a href="${contextPath}/menu2/foodDetail.do">
					<img src="${contextPath}/resources/images/r_05.png"></a>
						<p>라즈베리푸딩</p>
			</div>	
			<div>		
				<a href="${contextPath}/menu2/foodDetail.do">
					<img src="${contextPath}/resources/images/r_02.png"></a>
						<p>딸기라떼</p>
			</div>	
			<div>		
				<a href="${contextPath}/menu2/foodDetail.do">
					<img src="${contextPath}/resources/images/r_03.png"></a>
						<p>블루베리머핀</p>
			</div>
		</div>
		
		<div class="recipe2">
			<div>
				<a href="${contextPath}/menu2/foodDetail.do">
					<img src="${contextPath}/resources/images/r_04.png"></a>
						<p>살구타르트</p>
			</div>
			<div>		
				<a href="${contextPath}/menu2/foodDetail.do">
					<img style="object-fit: cover;" src="${contextPath}/resources/images/r_14.png"></a>
						<p>당근케익</p>
			</div>
			<div>
				<a href="${contextPath}/menu2/foodDetail.do">
					<img src="${contextPath}/resources/images/r_19.png"></a>
						<p>당근라페 샌드위치</p>
			</div>
		</div>
		
		<div class="recipe2">
			<div>
				<a href="${contextPath}/menu2/foodDetail.do">
					<img style="object-fit: cover;" src="${contextPath}/resources/images/r_06.png"></a>
						<p>무화과쨈</p>
			</div>
			<div>	
				<a href="${contextPath}/menu2/foodDetail.do">
					<img src="${contextPath}/resources/images/r_25.png"></a>
						<p>오이샌드위치</p>
			</div>
			<div>	
				<a href="${contextPath}/menu2/foodDetail.do">
					<img style="object-fit: cover;" src="${contextPath}/resources/images/r_26.png"></a>
						<p>아스파라거스오픈샌드위치</p>
			</div>	
		</div>
		
		<div class="recipe2">
		<div>		
				<a href="${contextPath}/menu2/foodDetail.do">
					<img src="${contextPath}/resources/images/r_27.png"></a>
						<p>부리또</p>
			</div>	
			<div>		
				<a href="${contextPath}/menu2/foodDetail.do">
					<img src="${contextPath}/resources/images/r_13.png"></a>
						<p>삶은 옥수수</p>
			</div>	
			<div>		
				<a href="${contextPath}/menu2/foodDetail.do">
					<img src="${contextPath}/resources/images/r_07.png"></a>
						<p>애호박전</p>
			</div>
		</div>
		
		<div class="recipe2">
		<div>		
				<a href="${contextPath}/menu2/foodDetail.do">
					<img src="${contextPath}/resources/images/r_17.png"></a>
						<p>감자전</p>
			</div>	
			<div>		
				<a href="${contextPath}/menu2/foodDetail.do">
					<img src="${contextPath}/resources/images/r_18.png"></a>
						<p>토마토샐러드</p>
			</div>	
			<div>		
				<a href="${contextPath}/menu2/foodDetail.do">
					<img src="${contextPath}/resources/images/r_28.png"></a>
						<p>비트샐러드</p>
			</div>
		</div>

		
	</div>
         
</body>
</html>