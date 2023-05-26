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
<link rel="stylesheet" href="${contextPath}/resources/jquery-ui-1.13.2/jquery-ui.css" />
<script src="${contextPath}/resources/js/lib/jquery-3.6.4.min.js"></script>
<script src="${contextPath}/resources/jquery-ui-1.13.2/jquery-ui.js"></script>
<script>

$(document).ready(function(){
	   $('#spinner').spinner({
	      min:0,
	      max:99,
	      step:1,
	      spin: function(event, ui){
	         $('.sum').html((${s.salePrice} * ui.value).toLocaleString('ko-KR') + '원');
	      }
	   });
	});
</script>
<style>


</style>
</head>
<body>
	
	<c:if test="${sessionScope.id == null}">
	<%@ include file="../headfoot/header-x.jsp" %>
	</c:if>
	<c:if test="${sessionScope.id != null}">
		<%@ include file="../headfoot/header.jsp" %>
	</c:if>
	
	<h1>장바구니</h1>
	
	<div>
        	<label for="spinner">주문수량 :</label>
           	<span><input type="text" id="spinner" name="count" value="0"/></span>
            <div><input type="text" id="spinner" value="총합계 :" readOnly=readOnly size= "3"/><span class="sum">0원</span></div>
    </div>
	
		<div class="goods">
			<img src="${contextPath}/order/display.do?cartDetailNo=${cartDetail.cartDetailNo}" style="width:100px; height:50px;">
		</div>
	
	
	
	
			
	
	
</body>
</html>