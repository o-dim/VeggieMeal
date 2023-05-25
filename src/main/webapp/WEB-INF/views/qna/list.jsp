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
function fnWrite() {
	 location.href = "${contextPath}/qna/qnaWrite.form";
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
		<h2>자주하는 질문</h2>
	</div>
	<div>
		<input type="button" id="write" value="질문하기" onclick="fnWrite()">
	</div>
	<div>
		<form id="frmList">
		<table border="1">
			<thead>
				<tr>	
					<td>글 번호</td>
					<td>제목</td>
					<td>내용</td>
					<td>검거단</td>
					<td>날짜</td>
				</tr>
			</thead>
			<tbody>
				<c:if test="${empty qnaList}">
					<tr>
						<td colspan="4">단속반에게 궁금한걸 물어봐주세요!</td>
					</tr>
				</c:if>
				<c:if test="${not empty qnaList}">
					<c:forEach items="${qnaList}" var="q">
						<tr>
							<td>${q.qnaNo}</td>
							<td><a href="${contextPath}/qna/qnaDetail.form?qnaNo=${q.qnaNo}">${q.title}</a></td>
							<td>${q.content}</td>
							<td>${q.personDTO.id}</td>
							<td>${q.writeAt}</td>
						</tr>
					</c:forEach>
				</c:if>
			</tbody>
		</table>
			${pagination}
		
		</form>
		
		
	</div>
		
	
	
	
</body>
</html>