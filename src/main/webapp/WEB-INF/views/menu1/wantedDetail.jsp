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

<link rel="stylesheet" href="${contextPath}/resources/jquery-ui-1.13.2/jquery-ui.css" />
<script src="${contextPath}/resources/js/lib/jquery-3.6.4.min.js"></script>
<script src="${contextPath}/resources/jquery-ui-1.13.2/jquery-ui.js"></script>

<!-- 금액 총 합계  -->
<script>
$(document).ready(function(){
	$('#spinner').spinner({
		min:1,
		max:99,
		step:1,
		spin: function(event, ui){
			$('.sum').html(${s.salePrice} * ui.value);
		}
	});
});
 
</script>
<style>
	
	.products {
		
		margin-top: 50px;
		margin-right: 300px;
		margin-left: 300px;
		display: flex;
	}
	
	.products img {
		
		margin:20px;
     }
     
     .productsDetail {
     
    	margin-right: 300px;
		margin-left: 300px;
		justify
     	
     }
     
     button {
      font-size: 16px;
      background-color: transparent;
      border: none;
      font-weight: bold;
      
   	}
   	
   	
   	.btn_group {
   		display:flex;
   		margin-bottom: 10px;
   	}
   	
   	.btn_count {
   		margin-bottom: 10px;
   	}
   	
     .cart {
     	display: block;
     	width: 210px;
     	height: 50px;
     	border: 1px solid black;
     	justify-content: center;
 
     	
     }
     
     
     .jjim {
     	display: block;
     	width: 210px;
     	height: 50px;
     	border: 1px solid black;
     	margin-left: 10px;
     }
     
     .now {
     	  display: block;
   		  background-color: #FACC57;
     	  width: 430px;
     	  height: 50px;
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


		<div class="products">
			<img src="${contextPath}/menu1/display.do?saleNo=${s.saleNo}" style="width:400px; height: 260px;">
				<div id="prouctsInfo">
					<p class="name"><span>상품명: ${s.saleTitle}</span></p>
					<p class="price">
					   상품가격: <fmt:formatNumber pattern="###,###,###" value="${s.salePrice}"/>원
					</p>
					<div class=btn>
					  <div class="btn_count">
					  	<p>
						  <label for="spinner">주문수량</label>
						  <span><input type="text" id="spinner" name="count" value="1"/></span><span class="sum">합계</span>
						</p>
    				  </div>
					 <div class="btn_group">
				        <button class="cart" style="cursor: pointer;">장바구니</button>
				        <button class="jjim" style="cursor: pointer;">찜해두기</button>
				    </div>		
				    <button class="now" style="cursor: pointer;">지금 바로 검거하기</button>
				</div>
			</div>
		</div>
			

			<div class="productsDetail">
				<hr>
				<h3>${s.saleNo}번째 검거 상품 ${s.saleTitle} 상세정보</h3>
				<br>
					<div style="text-align:center">${s.saleContent}</div>
				<br>
					<c:if test="${s.productDTO.prodImgName != null && s.productDTO.prodImgName != ''}">
						<img src="${contextPath}/menu1/display.do?saleNo=${s.saleNo}" style="width:880px; height: 600px;">
					</c:if>
		
			</div>



</body>
</html>
