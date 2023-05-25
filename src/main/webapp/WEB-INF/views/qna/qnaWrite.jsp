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
<script src="${contextPath}/resources/summernote-0.8.18-dist/summernote-lite.min.js"></script>
<script src="${contextPath}/resources/summernote-0.8.18-dist/lang/summernote-ko-KR.min.js"></script>
<link rel="stylesheet" href="${contextPath}/resources/summernote-0.8.18-dist/summernote-lite.min.css">
<script>
		
	function fnback() {
		history.back();
	}
	
	
	$(function(){
		$('#content').summernote({
			width: 640,
			height: 480,
			lang: 'ko-KR',
			toolbar: [
				['style', ['bold', 'italic', 'underline', 'clear']],
				['font', ['strikethrough', 'superscript', 'subscript']],
				['para', ['ul', 'ol', 'paragraph']],
				['table', ['table']],
				['insert', ['link', 'picture', 'video']],
				['view', ['fullscreen', 'codeview', 'help']]
			]
		})
	})

	
	
</script>


</head>

<body>
<%@ include file="../headfoot/header.jsp" %>

<h2>질문하기</h2>
	<form id="frmwrite" method="post" action="${contextPath}/qna/qnaWrite.form">
		<div>
			<label for="title">제목</label>
			<input type="text" id="title" name="title" required="required" onclick="fntitle()">
		</div>
		
		<div>
			<label for="writer">작성자</label>
			<input type="text" id="writer" name="writer" required="required">
		</div>
		<div>
			<label for="content">내용</label>
			<textarea id="content" name="content" rows="30" cols="30" required="required"></textarea>
		</div>
	</form>
	
	<form id="frmbutton" method="post" action="${contextPath}/qna/list.form">
	<div>
		<input type="submit" name="signUp" value="질문하기" onclick="fnsignUp()">
	</div>
	<div>
		<input type="button" name="back" value="돌아가기" onclick="fnback()">
	</div>
	</form>
	
	
	
	
	
</body>
</html>	