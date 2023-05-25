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
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script>
	function fnLogin() {
		$('#login_frm').on('submit', function() {
			if($('#id').val() == '' || $('#pw').val() == ''){
				event.preventDefault();
				swal('로그인 실패', '아이디와 비밀번호를 확인해주세요', 'error')
				.then(function() {
					return;
				})
			}
		})
	}
	function fnRegister(){
		location.href = '${contextPath}/person/register.form';
	}
	$(function() {
		fnLogin();
	})
	
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
	.box2 {
		display: flex;
		justify-content: center;
	}

	h1 {
		text-align: center;
		margin-top : 100px;
		margin-bottom: 50px;
		
	}

	input {
		width : 410px;
		border: none;
		border-bottom: 1px solid black;
		padding-top: 20px;
		margin-bottom: 20px;
		outline: none;
		background-color: transparent;
	}
	
	.regiLogin{
		border-radius: 10px;
		border:none;
		background-color: #FACC57;
		margin: 30px auto;
		padding: 6px;
		width : 410px;
		height: 50px;
	}
	.notyet {
		text-align: center;
		margin-bottom: 200px;
	}

	
</style>
<body>
	<%@ include file="../headfoot/header-x.jsp" %>	
	<!-- 로그인 -->
	<div class="box">
		<h1>로그인</h1>
		<div class="box2">
		<form action="${contextPath}/person/login.do" method="post" id="login_frm">
			<div class="id">
				<div>아이디</div>
				<input type="text" name="id" id="id">
				<div id="id_msg"></div>
			</div>
			<div class="pw">
				<div>비밀번호</div>
				<input type="password" name="pw" id="pw">
				<div id="pw_msg"></div>
			</div>
			<button class="regiLogin" style="cursor: pointer;">로그인</button>
			<div class="notyet">아직 회원이 아니신가요? <span style="cursor: pointer;" onclick="fnRegister()">회원가입하러가기</span></div>
		</form>
		</div>
	</div>
</body>
</html>


