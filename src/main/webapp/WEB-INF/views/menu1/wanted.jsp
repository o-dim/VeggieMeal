<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
	// 전역 변수 
	var page = 1; 
	var totalPage = 0; 
	var timerId; 
	
	// DB에서 목록을 가져오는 함수 
	function fnGetSales() {
		
		// 목록 숨기기 
		$('.sales').hide();
		
		// 로딩 보여주기 
		$('.loading_wrap').show(); 
		
		// 목록을 가져오는 ajax 처리 
		$.ajax({
			// 요청 
			type: 'get',
			url: '${contextPath}/menu1/wanted.do',
			data: 'page=' + page, 
			
			// 응답 
			dataType: 'json',
			success: function(resData) {
				// 전체 페이지 개수를 전역 변수 totalPage에 저장 
				totalPage = resData.totalPage; 
				
				// 한번 스크롤을 통해서 목록을 9개씩 가져올 때마다 페이지가 증가해야 한다. 
				page++;
				
				// 화면에 뿌리기 
				$.each(resData.sales, function(i, sale){
					let str = '<div class="sale">';
					str += '<a href="${contextPath}/menu1/wantedDetail.do?saleNo='+sale.saleNo +'">';
					str += '<img src="${contextPath}/menu1/display.do?saleNo=' + sale.saleNo + '">';
					str += '<div>' + sale.saleTitle + '</div>';
					str += '<div>' + sale.salePrice.toLocaleString() +'원' + '</div>';
					str += '</div>';
					$('.sales').append(str);
				});
				
				// 목록 보여주기 
				$('.sales').show();
				// 로딩 숨기기 
				$('.loading_wrap').hide();
			}
		})
	} // fnGetSales
	
	// 함수 호출 (스크롤 이벤트 이전 첫 목록을 가져온다.)
	fnGetSales();
	
	// 스크롤 이벤트 
	$(window).on('scroll', function(){
		if(timerId) {
			clearTimeout(timerId);
		}
		// 200밀리초(0.2초) 후에 function()을 수행한다. 
		timerId = setTimeout(function(){
			let scrollTop = $(this).scrollTop();
			let windowHeight = $(this).height();
			let documentHeight = $(document).height();
			if((scrollTop + windowHeight + 50) >= documentHeight) {
				if(page > totalPage) {
					// 최종 로딩 숨기기
					$('.loading_wrap').addClass('blind');
					return;
				}
					fnGetSales();
			}
		}, 200); 
	})

	
</script>
<style>
	body {
	
	padding-top: 100px;
	margin-left: 70px;
    text-decoration: none;
	
	}
	div {
		box-sizing: border-box; 
		
	}
	a {
	  text-decoration: none !important;
	}

	.sales {
		width: 1310px;
		margin: 0 auto;
		display: flex;
		flex-wrap: wrap;
		color: black;
	}
	.sale {
		margin-bottom: 10px;
		text-align: center;
	
	}
	
	.sale img {
	  width: 400px;
	  height: 300px;
	  object-fit: cover;
	}
	

	.loading_wrap {
		display: flex;            /* justify-content, align-items 속성 사용을 위해 설정 */
		justify-content: center;  /* class="loading"의 가로 가운데 정렬 */
		align-items: center;      /* class="loading"의 세로 가운데 정렬 */
		min-height: 80vh;         /* 최소 높이를 화면 높이의 80%로 설정 */
	}
	.loading {
		width: 300px;
		height: 300px;
		background-image: url('../resources/images/loading.gif');
		background-size: 300px 300px;
		background-repeat: no-repeat;
	}
	.blind {  /* 반드시 .loading_wrap 이후에 작성 */
		/* display: none; */
		visibility: hidden;
	}
</style>
</head>
<body>
<c:if test="${sessionScope.id == null}">
	<%@ include file="../headfoot/header-x.jsp" %>
</c:if>
<c:if test="${sessionScope.id != null}">
	<%@ include file="../headfoot/header.jsp" %>
</c:if>




<h2 align="center">WANTED</h2>

	<!-- 판매목록 보여주는 곳 -->
	<div class="sales"></div>

	<!-- loading.gif 보여주는 곳  -->
	<div class="loading_wrap">
		<div class="loading"></div>
	</div>
	
<%@ include file="../headfoot/carrot.jsp" %>
</body>
</html>
