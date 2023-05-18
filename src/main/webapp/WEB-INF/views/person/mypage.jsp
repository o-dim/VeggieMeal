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
	
	function fnModify(n){
		location.href="${contextPath}/person/edit.do?perNo=" + n;
	}
	
	function fnOrder(){
		location.href = "${contextPath}/person/order.do"
	}
	
	function fnQna(){
		location.href="${contextPath}/qna/list.do";
	}
	
	function fnLeave() {
		if(confirm('탈퇴시 기존 아이디로 재가입이 불가능합니다<br>정말 탈퇴하시겠습니까?')){
			location.href="${contextPath}/person/leave.form";
		}
	}
	
</script>
</head>
<style>
	.mypage{
		width: 500px;
		height: 500px;
		margin: 100px auto;
		border-radius: 10px;
		background-color: #F4F4F4;
		padding: 30px 0;
	}
	h1 {
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
	<div class="mypage">
		<div>
			<h1>마이페이지</h1>
		</div>
			<div class="mypagecontent">
			<div>
				<h2>${sessionScope.id}님 어서오세요</h2>
			</div>
			<div>
				<form action="${contextPath}/person/edit.do" method="post">
					<input type="button" value="회원 정보 수정" onclick="fnModify(${sessionScope.perNo})">					
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