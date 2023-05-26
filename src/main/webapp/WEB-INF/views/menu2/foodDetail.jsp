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

	var frm;
	$(function(){
		frm = $('#frm');
	})
	
	function fnEditRecipe(){
		frm.prop('action','${contextPath}/menu2/editRecipe.do');
		frm.submit();
	}
	
	function fnRemoveRecipe(){
		if(confirm('삭제 하시겠습니까?') == false){
			return;
		}
		frm.prop('action', '${contextPath}/menu2/removeRecipe.do');
		frm.submit();
	}
	
	let modifyResult = '${modifyResult}';
	if(modifyResult != ''){
		if(modifyResult == '1'){
		alert('수정되었습니다');
	} else {
		alert('수정하시는데 실패했습니다.');
	}
			
}

</script>
<style>
   
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
		margin-right: 50px;
   }
   
   .explanation_1 > h2 {
   		font-family:fantasy;
		font-size: 60px;
		font-weight: 1000;
		margin-top: -10px;
   }
   .explanation p {
		font-size: 25px;
		width: 600px;
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
		margin-right: 155px;
   }
   
   .explanation_3 > h2 {
   		font-family:fantasy;
		font-size: 40px;
		font-weight: 1000;
   }
   
   .explanation_3 p {
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
	
	#frm {
		text-align: right;

	}
	
	#btn_1{
		font-size: 25px;
		background-color: transparent;
		border: none;
		font-weight: bold;
		cursor: pointer;
		margin-bottom: 50px;
	}

   
</style>
</head>
<body>
<header>

	<%@ include file="../headfoot/header.jsp"%>
</header>

			<div class="recipe">
				<p>Recipe</p>
			</div>
			
	<div class="total">
			<div class="total_1">
				<h1>${r.recipeNo}번 레시피</h1>
			</div>
				
		<form id="frm" method="post">
			<input type="hidden" name="recipeNo" value="${r.recipeNo}">
			<input type="button" id ="btn_1" value="편집" onclick="fnEditRecipe()">
			<input type="button" id="btn_1" value="삭제" onclick="fnRemoveRecipe()">
		</form>
		
		
		
		<div class="explanation">
			<div class="pictures">
					<img src="${contextPath}/menu2/display.do?recipeNo=${r.recipeNo}" width="400px" height="300px">
			</div>
			<div class="explanation_1">
				<h2>${r.title}</h2>
				<p>${r.tool}</p>
			</div>
		</div>
		
		<div class="explanation1">
			<div class="explanation_2">
				<h2>준비물</h2>
				<p>${r.content1}</p>
			</div>
		
			<div class="explanation_3">
				<h2>레시피</h2>
				<p>${r.content2}</p>
			</div>

		</div>
		
		<div>
			<h2>댓글1개</h2>
		</div>

		<hr style="border: 2px solid black">
		
		<div class="dap">
			<h3>heart</h3>
			<p>ㅋㅋㅋ 맛있겠다.</p>
			<input type="button" id="btn_dap" value="답글 달기" onclick="">
		</div>
		
		
		
	</div>


<%@ include file="../headfoot/carrot.jsp" %>         
</body>
</html>