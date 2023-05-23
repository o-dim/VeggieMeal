<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ include file="../headfoot/header.jsp" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="${contextPath}/resources/js/lib/jquery-3.6.4.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script>
	
	function fnModify(){
		location.href="${contextPath}/person/edit.form";
	}
	
	function fnOrder(){
		location.href = "${contextPath}/person/order.form"
	}
	
	function fnQna(){
		location.href="${contextPath}/qna/list.form";
	}
	
	function fnLeave() {
		Swal.fire({
			   title: '탈퇴하시겠습니까?',
			   text: '탈퇴시 기존 아이디로 재가입이 불가능합니다. 정말 탈퇴하시겠습니까?',
			   icon: 'warning',
			   
			   showCancelButton: true, // cancel버튼 보이기. 기본은 원래 없음
			   confirmButtonColor: '#3085d6', // confrim 버튼 색깔 지정
			   cancelButtonColor: '#d33', // cancel 버튼 색깔 지정
			   confirmButtonText: '승인', // confirm 버튼 텍스트 지정
			   cancelButtonText: '취소', // cancel 버튼 텍스트 지정
			   
			   reverseButtons: true, // 버튼 순서 거꾸로
			   
			}).then(result => {
			   // 만약 Promise리턴을 받으면,
			   if (result.isConfirmed) { // 만약 모달창에서 confirm 버튼을 눌렀다면
					location.href="${contextPath}/person/leave.do";			
			  		Swal.fire('탈퇴되었습니다.', 'success');
			   }
			});
	}
	
</script>
</head>
<style>
	.box {
		position: absolute;
		width: 1000px;
		top: 330px;
		left : calc(50% - 1000px/2);
		background-position: center;
		background: #F4F4F4;
		border-radius: 59px;
		margin-bottom: 100px;
		
	}
	h2 {
		text-align: center;
		margin-bottom: 50px;
	}
	
	input {
		border-radius: 10px;
		border:none;
		background-color: #FACC57;
		margin: 10px auto;
		padding: 6px;
		width: 300px;
		height: 50px;
	}
	.mypagecontent {
		text-align: center;
	}
</style>
<body>
	<div class="box">
		<div>
			<h2>마이페이지</h2>
		</div>
			<div class="mypagecontent">
			<div>
				<h2>${sessionScope.loginId}님 어서오세요</h2>
			</div>
			<div>
				<form action="${contextPath}/person/edit.form" method="get">
					<input type="button" value="회원 정보 수정" onclick="fnModify()">
					<input type="hidden" value="${sessionScope.loginId}">					
				</form>
			</div>
			<div>
				<input type="button" value="주문확인 및 취소" onclick="fnOrder()">
			</div>
			<div>
				<input type="button" value="QnA" onclick="fnQna()">
			</div>
			<div>
				<input type="button" value="탈퇴하기" onclick="fnLeave()"> 
			</div>
		</div>
	</div>
	

</body>
</html>