<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="${contextPath}/resources/js/lib/jquery-3.6.4.min.js"></script>
<script>

	$('.recipe_1').on('click', function(){
		location.href='${contextPath}/menu2/detail.do?recipeNo='$(this).data('recipe_no');
	})
	
</script>
<style>
@import
	url("https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.3.0/css/all.min.css")
	;

@font-face {
	font-family: 'Tenada';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2210-2@1.0/Tenada.woff2')
		format('woff2');
	font-weight: normal;
	font-style: normal;
}

button {
	margin-left: 10px;
	font-size: 16px;
	background-color: transparent;
	border: none;
}

.pictures {
	margin-left: 130px;
	margin-right: 130px;
}

.recipe {
	display: flex;
	justify-content: space-between;
}

.pictures h2 {
	font-size: 32px;
}

.pictures img {
	width: 400px;
	height: 250px;
}

.recipe2 {
	padding-bottom: 60px;
}

.recipe2 h2 {
	font-size: 32px;
}

.searchbar a {
	margin-left: 10px;
}

.searchbar {
	width: 750px;
	height: 50px;
	border: solid 3px black;
	display: flex;
	justify-content: space-between;
}

.searchbar>div {
	height: 50px;
}

.searchbar>div:nth-of-type(2) {
	margin-right: 10px;
}

.search-bar__input {
	width: 600px;
	height: 50px;
	border: none;
	outline: none;
	margin-left: 10px;
}

.fa-magnifying-glass {
	font-size: 30px;
	right: 100px;
}

.btn {
	background-color: transparent;
	border: none;
	align-items: right;
	height: 50px;
}

.test {
	display: flex;
	margin-top: 30px;
	display: flex;
	justify-content: space-between;
}

.search_2 {
	color: rgba(0, 0, 0, 0.5);
	padding-right: 100px;
	margin-top: 15px;
}

p {
	text-align: center;
	font-size: 20px;
	margin-bottom: 20px;
}

.recipes {
	display: flex;
	justify-content: space-between;
	cursor: pointer;
}


</style>
</head>
<body>

	<%@ include file="../headfoot/header.jsp"%>
	<div class="pictures">
		<h2>인기 레시피&gt;</h2>
		<div class="recipe">
		<div class="recipe1">
			<a href="${contextPath}/menu2/detail.do?recipeNo=1"> 
			<img src="${contextPath}/menu2/display.do?recipeNo=1">
			</a>
		</div>
		<div class="recipe2">
			<a href="${contextPath}/menu2/detail.do?recipeNo=2"> 
			<img src="${contextPath}/menu2/display.do?recipeNo=2">
			</a>
		</div>
		<div class="recipe3">
			<a href="${contextPath}/menu2/detail.do?recipeNo=3"> 
			<img src="${contextPath}/menu2/display.do?recipeNo=3">
			</a>
		</div>
		</div>

		<div class="test">
			<div>
				<div class="searchbar">
					<div>
						<input class="search-bar__input" type="search" placeholder="오늘 뭐 먹을까?">
					</div>
					<div>
						<button type="submit" class="btn" onclick="fn_btn()">
							<span id="search" class="search_1"> <i
								class="fa-solid fa-magnifying-glass"></i>
							</span>
						</button>
					</div>
				</div>
			</div>
			<div class="search_2">#밀푀유나베 #고기완자 #연어아보카도덮밥</div>
			<div style="margin-top: 15px;">
				<a href="${contextPath}/menu2/writeRecipe.form">글쓰기</a>
			</div>
		</div>
		<h2>전체 레시피&gt;</h2>
		<div class="recipes">
			<c:forEach items="${recipeList}" var="r">
				<div class="recipe_1">
					<div>
						<a href="${contextPath}/menu2/detail.do?recipeNo=${r.recipeNo}">
							<img src="${contextPath}/menu2/display.do?recipeNo=${r.recipeNo}">
						</a>
					</div>
					<div>${r.title}</div>
				</div>
			</c:forEach>
		</div>
		<div>${pagination}</div>
	</div>


<%@ include file="../headfoot/carrot.jsp" %>
</body>
</html>