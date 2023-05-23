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
console.log(${r.recipeNo.RecipeNo});
</script>
<style>
   @import url("https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.3.0/css/all.min.css");
   
   /* header */
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
		background: white;
		display: flex;
		font-size : 32px;
		justify-content: space-between;
		align-items: center;
		border-bottom: 20px solid #facc57;
		margin-bottom: 30px;
   }
   
   header > div {
      float:left;
      vertical-align: top;
      font-family: 'Tenada';
   }
   
	.logo {
      margin-bottom: -10px;
   }
   
   .logo_img {
      margin-right: 730px;
   }
   
   button {
      margin-left: 10px;
      font-size: 16px;
      background-color: transparent;
      border: none;
   }
   
   /* 여기까지 헤더 위에 */
   
   /* Recipe */
	.recipe > p {
		font-family: "궁서", "명조", sans-serif;
		font-size: 150px;
		font-weight: 1000;
		font-style: italic;
		text-align: right;
		color: #FACC57;
		margin-right:-20px;
	}
	
	.total{
		margin-left:130px;
		margin-right:130px;
	}
	
	button {
		text-align: right;
	}
   
	.total_1 {
		display: flex;
		justify-content: space-between;
	}
	
	.btn {
		text-align: right;
	}
   
   .btn > button {
   		font-size:20px;
   }
   
   /* 부가 설명 */
   
   .pictures {
		margin-right:40px;
   }
   
   .explanation {
		display:flex;
		justify-content: space-between;
   }
   
   /* 버섯 꼬치구이 라인 맞추기 실패 ;;  */
   .explanation_1 {
   
   }
   
   .explanation_1 > h2 {
   		font-family:fantasy;
		font-size: 60px;
		font-weight: 1000;
		margin-top: -10px;
   }
   .explanation p {
		font-size: 32px;
   }
   
   .explanation_2 {
		width:500px;
   }
   
   .explanation_2 > h2 {
   		font-family:fantasy;
		font-size: 40px;
		font-weight: 1000;
   }
   
   .explanation_2 p {
		font-size: 20px;
   }
   
   .explanation_3 {
		width:500px;
   }
   
   .explanation_3 > h2 {
   		font-family:fantasy;
		font-size: 40px;
		font-weight: 1000;
   }
   
   .explanation_3 p {
		font-size: 20px;
   }
   
   .explanation_4 {
		width:500px;
		margin-top:100px;
   }
   
   .explanation_4 p {
		font-size: 20px;
   }
   
   .explanation1 {
		display:flex;
		justify-content: space-between;
   }
   
   .dap {
		margin-right:70px;
		margin-left: 70px;
   }
   
	#btn_dap{
		background-color: transparent;
		border: none;
		font-size:20px;
	}

   
</style>
</head>
<body>
<header>

	<div class="logo">야채단속반</div>
	<div class="logo_img">
		<img src="${contextPath}/resources/images/logo.png" width="250px">   
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

			<div class="recipe">
				<p>Recipe</p>
			</div>
			
	<div class="total">
		<form action="" method="post" id="ha">
			<div class="total_1">
				<h3>${r.recipeNo}번 게시글</h3>
				
				<div class="btn">
					<button>수정하기</button>
					<button>삭제하기</button>
				</div>
			</div>
		</form>
		
		<div class="explanation">
			<div class="pictures">
				<a href="${contextPath}/menu2/foodDetail.do">
					<img src="${contextPath}/resources/images/r_12.png" width="600px" height="500px"></a>
			</div>
			<div class="explanation_1">
				<h2>버섯 꼬치구이</h2>
				<p>
					오늘은 간단하지만, 매력이 솔솔 넘치는  버섯꼬치구이로 인사드립니다. 지금 한창 표고버섯이 고기만큼 맛있어서
					사실 어떻게 요리해도 맛있습니다~~ 하여, 간단한 술안주로 양보도 해봅니다ㅎㅎ 유난히 씹는 질감이 좋은 버섯에 
					매콤달콤한 양념에 발라 구웠더니 매력넘치는 술안주가 되었습니다ㅎㅎ
			   </p>
			</div>
		</div>
		
		<div class="explanation_2">
			<h2>준비물</h2>
			<p>
				재료: 표고버섯5개, 대파3대(흰부분) &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			    바름장: 고추장1작은술, 매실청1큰술, 간장1작은술,설탕1작은술, 참기름1작은술,통깨약간 </p>
		</div>
		
		<div class="explanation1">
			<div class="explanation_3">
				<h2>레시피</h2>
				<p>
					1. 준비: 표고버섯은 기둥을 떼어내고 갓만 준비한다.도톰하게 편썰어준다. 꼬치에 꿰어지는 두께는 되어야 합니당ㅎㅎ
			          (표고버섯이 아니여도 새송이버섯도 잘 어울릴듯합니다~) 대파는 떨어져서 오늘 1단사왔어요 굵기가 굵은것만 골라 흰대부분만 사용합니다 
					  너무 굵은 부분은 반갈라서 준비합니다. (양파도 곁들여도 좋습니다~참조)
					2. 꼬치에 꿰기 대파, 버섯 , 대파 순으로 꽂아줍니다. 대파보다 버섯이 단단해서 버섯을 끝쪽으로 가게 하면 좋더군요ㅎㅎ 
					  버섯5개일뿐인데..꼬치로 만드니 양이 많아져 보이네요~~ 모양이쁜  꼬치로 넣으려니 넘 굵더군요ㅠㅠ 하여, 산적꼬치로 바꿔 꿰였다는ㅎㅎㅎ
				</p>
			</div>
			
			<div class="explanation_4">
				<p>
					3. 굽기 뭐, 양념에 재워두었다가 구워도 되지만 저는 노릇하게 구운뒤에 양념을 발랐어요 먼저 달궈진팬에 올리브유 넉넉하게 두르고 꼬지를 앞뒤로 구워준다.
					다 구워지면 쟁반에 담아두고, 양념볼에  고추장1작은술, 매실청1큰술, 간장1작은술,설탕1작은술, 참기름1작은술,통깨약간을 섞어 바름장을 만든다.   
					쟁반에 놓여진 꼬치에 바름장을 앞뒤로 발라주고 달궈진 팬에 올려 구워준다. 구울때 바름장을 한번씩 더 덧발라 준다. 이미 한번 초벌구이를 해준 관계로 양념이 
					어느 배여들면 불을 끈다~ 4. 담기 그릇에 담고 맛있게 먹기~~ 밥반찬으로도 좋을듯합니다ㅎㅎ 지집은 술안주로..다가.. 해결했어요~~
					매콤달콤짭조롬한 양념에 쫄깃한 버섯과 달큰한 대파가 별미인데요~ 간단한 술안주 혹은 밥반찬 어떠세요?
				</p>
			</div>
		</div>
		
		<div>
			<h2>댓글n개</h2>
		</div>
		
<%-- 		<c:forEach items="#" var="#" varStatus="#">
			<c:if test="#">
			</c:if>
		
		</c:forEach> --%>
		<hr style="border: 2px solid black">
		
		<div class="dap">
			<h3>아이디</h3>
			<p>댓글다는 곳</p>
			<input type="button" id="btn_dap" value="답글 달기" onclick="">
		</div>
		
		
		
	</div>












         
</body>
</html>