<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="${contextPath}/resources/js/lib/jquery-3.6.4.min.js"></script>
<script>

	
	$(function(){
		fnChkAll();
		fnChkOne();
		fnRemoveList();
	})
	
	// 전체선택 체크박스
	function fnChkAll(){
		$('#chk_all').on('click', function(){
			$('.chk_one').prop('checked', $(this).prop('checked'));
		})
	}
	
	// 개별선택 체크박스
	function fnChkOne(){
		let chkOne = $('.chk_one');  // 모든 개별선택
		chkOne.on('click', function(){
			let chkCnt = 0;
			for(let i = 0; i < chkOne.length; i++) {
				chkCnt += $(chkOne[i]).prop('checked');
			}
			$('#chk_all').prop('checked', chkCnt == chkOne.length);
		})
	}
	
	// 선택 항목 삭제
	function fnRemoveList(){
		$('#frm_remove_list').on('submit', function(event){
			if(confirm('선택한 수량을 모두 삭제할까요?') == false){
				event.preventDefault();
				return;
			}
			if($('.chk_one:checked').length == 0){
				alert('선택된 수량이 없습니다.');
				event.preventDefault();
				return;
			}
		})
	}
	function fnDetail(n) {
		location.href='${contextPath}/order/cart.do?carDetailNo=' + n;
	}
	
</script>
<style>

	h1 {
		margin-left: 10%;
	}
	
	#check1 {
		margin-left: 10%;
		padding: 10px 20px;
		font-size: 16px;
	}
	
	table {
        border-collapse: collapse;
        margin: 0 auto; 			/* 가운데 정렬 */
        width: 80%; 				/* 테이블 너비 조정 */
    }
    
    
    th, td {
        border: 1px solid black;
        padding: 8px;
        text-align: center; 		/* 셀 텍스트 가운데 정렬 */
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
	

	<h1>장바구니</h1>


	<div>
		<form id="frm_remove_list" action="${contextPath}/order/removeList.form" method="post">
			<div id="check1">
				<input type="button" name="btn1" value="선택삭제">
			</div>

		<table border="1">
			<thead>
				<tr>
					<td>
						<label for="chk_all" id="lbl_chk_all">전체선택</label>
						<input type="checkbox" id="chk_all">
					</td>
					<td>장바구니</td>
					<td>상품명</td>
					<td>가격</td>
					<td>상품수량</td>
				</tr>
			</thead>
			<tbody>
				<c:if test="${empty cartDetailList}">
					<tr>
						<td colspan="5">카트에 물건을 담아보세요!</td>
					</tr>
				</c:if>
				<c:if test="${not empty cartDetailList}">
					<c:forEach items="${cartDetailList}" var="cartDetail">
						<tr>
							<td><input type="checkbox" class="chk_one" name="cartNoList" value="${cartDetail.count}"></td>
							<td><img src="${contextPath}/order/display.do?cartDetailNo=${cartDetail.cartDetailNo}" style="width:150px; height:100px;"></td>
							<td>${cartDetail.saleDTO.productDTO.prodName}</td>
							<td>${cartDetail.saleDTO.salePrice}</td>
							<td>${cartDetail.count}</td>
						</tr>
					</c:forEach>
				</c:if>
			</tbody>
		</table>
	</form>
</div>

</body>
</html>