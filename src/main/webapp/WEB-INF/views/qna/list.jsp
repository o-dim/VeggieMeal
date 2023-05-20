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

</script>
<style>

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
			<form>
				<table border="1">
					<tr class="question">
						<div>
							<td>Q.야채가 상해서 왔어요</td>
							<td>야채에 대한 믿음이 부족해서입니다.</td>	
						</div>
						<div>
							<td>Q.야채가 너무 맛없어요</td>	
 							<td>잘 달래주세요.</td>		
						</div>
						<div>
							<td>Q.야채가 너무너무너무너무</td>					
							<td>너무너무너무너무너무좋아한다면 내게 말해줘</td>						
						</div>			
						<div>
							<td>Q.야채가 친절하고 사장님이 맛있어요.</td>
							<td>ㅈㄴㄷ</td>											
						</div>							
					</tr>
				</table>
			</form>
		</div>
	
	
	
</body>
</html>