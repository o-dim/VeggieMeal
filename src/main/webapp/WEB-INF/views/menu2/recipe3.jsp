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
	function fnList(){
		location.href='${contextPath}/menu2/recipe.form';
	}
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
	
	.write {
		margin-right:130px;
		margin-left:130px;
	}
   
	.write > h1 {
		font-size: 70px;
		text-align:center;
	}
	
	.write_1 {
		text-align:center;
	}
	

	
	#uploadTitle {
		border: 3px solid silver;
		border-radius: 5px;
		width:800px;
		height:40px;
	}
	
	
	#uploadContent{
		border: 3px solid silver;
		border-radius: 5px;	
		width:800px;
		height:500px;	
	}
	
	.content {
		margin-top: 30px;
	}
	
	.content > span {
		vertical-align: top;
	}
	.img {
		text-align:left;
		margin-left:80px;
	}
	
	span {
		font-size:20px;
		font-weight: 550;
	}
	
	.btn_1 {
		text-align:right;
 		margin-right:70px;
		margin-top: 200px;
	}
	
	.img {
		text-align: right;
	}
	
	#fileList {
		margin-right: 70px;
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
			
	<div class="write">
		<h1>게시글 작성</h1>
	
	
	<div class="write_1">
		<form method="post" enctype="multipart/form-data" action="${contextPath}/menu2/addRecipe.do">
			<div class="title">
				<span>제목</span>
				<input type="text" id="uploadTitle" name="uploadTitle">
			</div>
			<div class="content">
				<span>본문</span>
				<textarea id="uploadContent" name="uploadContent" rows="20" cols="500"></textarea>
			</div>
			<div class="img">
				<span>이미지 파일 첨부</span>
				<input type="file" id="files" name="files" multiple="multiple" onchange="fnFileCheck(this)">
				<div id="fileList">첨부 파일의 목록이 이 곳에 표시됩니다.</div>
			</div>
			<div class="btn_1">
				<button>작성완료</button>
				<input type="button" value="목록" onclick="fnList()">
			</div>
		</form>
	</div>
	</div>
			



         
</body>
</html>