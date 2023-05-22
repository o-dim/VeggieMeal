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
	function fnRegister(){
		location.href = '${contextPath}/person/register.do';
	}
	
</script>
</head>
<style>


	h1 {
		text-align: center;
		margin-bottom: 50px;
	}
	
	#login_frm{
		display: flex;
		justify-content: center;
	}

	.login {
		width: 600px;
		height: 500px;
		margin: 100px auto;
		border-radius: 10px;
		background-color: #F4F4F4;
		padding: 30px 0;
	}
	
	.login2 {
		text-align: center;
		width: 500px;
	}
	
		input {
		width : 300px;
		border: none;
		border-bottom: 1px solid black;
		background-color: #F4F4F4;
		padding-top: 20px;
		margin-bottom: 20px;
		outline: none;
		
	}
	.regiLogin{
		border-radius: 10px;
		border:none;
		background-color: #FACC57;
		margin: 30px auto;
		padding: 6px;
		width: 300px;
		height: 50px;
	}
	
</style>
<body>
	<!-- 로그인 -->
	<div class="login">
		<h1>로그인</h1>
		<form action="${contextPath}/person/login.form" method="post" id="login_frm">
			<div class="login2">
				<div>아이디</div>
				<input type="text" name="perId" id="perId">
				<div id="id_msg"></div>
				
				<div>비밀번호</div>
				<input type="password" name="perPw" id="perPw">
				<div id="pw_msg"></div>
				
				<div>
				<button class="regiLogin" style="cursor: pointer;">로그인</button>
				<div>아직 회원이 아니신가요? <span style="cursor: pointer;" onclick="fnRegister()">회원가입하러가기</span></div>
				</div>
			</div>
		</form>
	</div>

</body>
</html>