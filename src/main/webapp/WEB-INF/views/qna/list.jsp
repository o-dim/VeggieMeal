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
	function fnQnaWrite() {
		location.href = '${contextPath}/qna/qnaWrite.do';		
	}

</script>
<style>

	

	@font-face {
    font-family: 'Tenada';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2210-2@1.0/Tenada.woff2') format('woff2');
    font-weight: normal;
    font-style: normal;
}
	
 	header {
 		 position: fixed;
		  top: 0;
		  left: 0;
		  right: 0;
		  
		  height: 50px;
		  padding: 1rem;
		  color: black;
		  font-size : 32px;
		  background: white;
		  display: flex;
		  justify-content: space-between;
		  align-items: center;
		  border-bottom: 20px solid #facc57;
	
	}
	
	header > div {
		float:left;
		vertical-align: top;
		font-family: 'Tenada';
	}
	
	button {
      margin-left: 10px;
      font-size: 16px;
      background-color: transparent;
      border: none;
   }
	
	.logo {
		margin-bottom: -10px;
	}
	
	.logo_img {
		margin-right: 730px;
	
	}
	
	body {
		padding-top: 100px;
	}
	
	.consumer > input {
		width: 300px;
		border: none;
		border-bottom: 1px solid black;
		outline: none;
		padding-top: 5px;
		margin-bottom: 5px;
	}
	
	.receiver > input {
	width: 300px;
	border: none;
	border-bottom: 1px solid black;
	outline: none;
	padding-top: 5px;
	margin-bottom: 5px;
	}
	

      .main_section {
           display: flex;
       }
       .left_section {
           border: 1px solid gray;
           margin-right: 20px;
           flex: 4;  /* width: 40%; */
       }
       .right_section {
           border: 1px solid gray;
           flex: 6;  /* width: 60%; */
       }
       article {
           margin: 10px 5px 0;
           padding: 10px;
           background-color: #FFF;
       }
       .img {
           padding: 20px;
           background-color: #888;
       }
       footer {
           height: 150px;
           margin-top: 10px;
           background-color: #facc57;
       }
       footer > p {
           text-align: center;
           line-height: 150px;
       }
       .product {
        	color: black;
        	text-decoration: none;
       }
	
	.question{
  display: flex;
  flex-direction: column;
  text-align: center;
}

</style>

</head>

<body>
<header>

	<div class="logo">
	야채단속반
	</div>
	<div class="logo_img">
	<img src="${contextPath}/resources/images/logo.png" width="250px">	
	</div>

 <div>
 	<form method="post">
   <button>메뉴</button>
   <button>메뉴2</button>
   <button>메뉴2</button>
   <button>로그인</button>
   <button>회원가입</button>
	</form>
</div>
	

</header>
	
	
	<div>
		<h2>질문하기</h2>
	<div>
		<input type="button" value="글쓰기" onclick="fnQnaWrite()">
	</div>
		<table border="1">
			<thead>
				
				<tr>
					<td>글 번호</td>
					<td>답변유무</td>
					<td>제목</td>
					<td>글쓴이</td>
					<td>날짜</td>
				</tr>
			</thead>
			<tbody>
				<tr>
					
				</tr>
			</tbody>
		</table>
		
	</div>
		
	
	
	
</body>
</html>