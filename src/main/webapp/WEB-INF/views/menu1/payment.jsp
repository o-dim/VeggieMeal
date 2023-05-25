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
<script src="https://kit.fontawesome.com/a076d05399.js" crossorigin="anonymous"></script>

<style>

	
	header {
		position: fixed;
		top: 0;
		left: 0;
		right: 0;
		height: 50px;
		padding: 1rem;
		color: black;
		background: white;
		display: flex;
		justify-content: space-between;
		align-items: center;
		border-bottom: 20px solid #facc57;
	}
	
	
	button {
		margin-left: 10px;
		font-size: 16px;
		background-color: transparent;
		border: none;
	}
	

	
	body {
		padding-top: 100px;
	}

    .payment {
    	
	  display: flex;
	  justify-content: center;
	  align-items: center;
	  flex-direction: column;
	  height: 30vh;
    }
    
    .payment1 {
      margin-left: 300px;
      text-align: left;
    }
    
    .wrap1 {
        display: flex;
        justify-content: center;
        margin-bottom: 20px;
    }
    
    .wrap1 > div {
        width: 300px;
        height: 300px;
        text-align: center;
        line-height: 50px;
        border: 1px solid gray;
        margin: 10px;
        display: flex;
        flex-direction: column;
        justify-content: center;
        align-items: center;
    }
    
 

    .btn {
    	display: flex;
    	justify-content: center;
    }
    
    

</style>
</head>

<body>
	<header>

		<div class="logo_img">
			<img src="${contextPath}/resources/images/mainlogo.png" width="400px">
		</div>
		
	  <div>
      <form method="post">
        <button>메뉴</button>
        <button>메뉴2</button>
        <button>메뉴3</button>
        <button>로그인</button>
        <button>회원가입</button>
      </form>
    </div>
	</header>
	

	<div class="payment">
		<img src="${contextPath}/resources/images/payment.PNG" width="738px">
	</div>
	
	<div class="payment1">
		<h1>결제하기</h1>
		<div>결제방법을 선택해주세요</div>
	</div>
		<div class="wrap1">
			<div>
				<button class="click1" style="cursor: pointer;"><i class="fas fa-comment-alt bubble-icon fa-4x"></i></button>
				<span>카카오페이</span>
			</div>
			<div>
				<button class="click2" style="cursor: pointer;"><i class="fas fa-credit-card fa-4x"></i></button>
				<span>카드결제</span>
			</div>
		</div>
	
		<div class="btn">	
			<button class="back" style="cursor: pointer;">돌아가기</button>
		</div>
	
</body>
</html>
