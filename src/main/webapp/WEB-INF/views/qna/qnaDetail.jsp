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
	var frm;
	$(function(){
		frm = $('#frm');
	})
	
	function fnList() {
		location.href = "${contextPath}/qna/list.form";
	}
	
	
		function fnEditUpload(){
			location.href = "${contextPath}/qna/qnaEdit.form?qnaNo=${}";
		}
	
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
		<h2>${qnaDTO.title}</h2>
			<ul>
				<li>제목 : ${qnaDTO.title}</li>
				<li>내용 : ${qnaDTO.content}</li>
				<li>작성일자 : ${qnaDTO.writeAt}</li>
			</ul>	
			<form id="frm" method="post">
				<input type="hidden" name="qnaNo" value="${qnaDTO.qnaNo}">
				<input type="button" value="편집" onclick="fnEditUpload()">
				<input type="button" value="삭제" onclick="fnRemoveUpload()">
				<input type="button" value="목록" onclick="fnList()">
			</form>
	</div>
	
	
	
	
	
</body>
</html>	