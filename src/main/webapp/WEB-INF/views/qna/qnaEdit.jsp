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
<c:if test="${sessionScope.loginId == null}">
		<%@ include file="../headfoot/header-x.jsp" %>
	</c:if>
	<c:if test="${sessionScope.loginId != null}">
		<%@ include file="../headfoot/header.jsp" %>
	</c:if>
	
	<div>
		<h1>의뢰 번복하기</h1>
	<h2>질문하기</h2>
		<form id="frmedit" method="post" action="${contextPath}/qna/qnaEdit.form">
			<div>
				<label for="editTitle">제목</label>
				<input type="text" id="editTitle" name="editTitle" value="${edit.title}">
			</div>
			
			<div>
				작성자 ${sessionScope.loginId}
				<input type="hidden" name="id" value="${sessionScope.loginId}">
			</div>
			<div>
				<label for="content">내용</label>
				<textarea id="content" name="content" rows="50" cols="30">${edit.content}</textarea>
			</div>
			<div>
				<input type="submit" name="request" value="의뢰하기" onclick="fnrequest()">	
			</div>
			<div>
				<input type="button" name="back" value="돌아가기" onclick="fnback()">
			</div>
		</form>
	</div>
	
	
	
	
</body>
</html>	