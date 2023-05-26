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
	
	
	function fnRemove(){
		if(confirm('삭제할까요?')){
			$('#frm_remove').submit();
		}
	}
	
	function fnList(){
		location.href = '${contextPath}/qna/list.do';
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
	
	
		<h1>의뢰 번복하기</h1>
		<form method="post" action="${contextPath}/qna/list.do">
			<div>
				<label for="title">제목</label>
				<input type="text" id="title" name="title" value="${qnaDTO.title}">
			</div>
			<div>
				<label for="wirter">작성자</label>
				<input type="text" id="writer" name="writer" value="${qnaDTO.personDTO.id}" readonly="readonly">
			</div>
			<div>
				<div><label for="content">내용</label></div>
				<textarea id="content" name="content">${qnaDTO.content}</textarea>  <!-- summernote 편집기로 바뀌는 textarea -->
			</div>
			<div>
				<input type="hidden" name="qnaNo" value="${qnaDTO.qnaNo}">
				<button>수정완료</button>
				<input type="button" value="목록" onclick="fnList()">
			</div>
		</form>
	
	
	
	
	
	
</body>
</html>	