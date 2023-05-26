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
<style>
	.box {
		width: 1000px;
		left : calc(50% - 1000px/2);
		background-position: center;
		background: #F4F4F4;
		border-radius: 59px;
		position: absolute;
		padding-bottom: 100px;
	}
	.title {
		text-align: center;
		margin-top : 50px;
		margin-bottom : 50px;
	}
	table {
	   width: 100%;
	   border-collapse: collapse;
	   bottom: 300px;
  	}
  	th, td {
	    border: 1px solid #444444;
	    padding: 10px;
  	}
  	.thead {
  		font-style: oblique;
  	}
  	table th:first-child,
	table td:first-child {
		border-left: 0;
	}
	table th:last-child,
	table td:last-child {
		border-right: 0;
	}
  	
	.tbl {
		margin-left: auto;
		margin-right: auto;
		width : 800px;
	}
	.btnwrap {
		margin-left: auto;
		margin-right: auto;
	}
	.qBtn {
		width : 800px;
		height: 30px;
		background-color: transparent;
		border: 1px solid black;
		animation: motion 0.3s linear 0s infinite alternate;
		margin : 50px 0 5px 100px;
	}
	a {
		text-decoration: none;
		color: black;
	}
	a:visited {
		color: black;
	}
	.thead {
		margin-top : 5px;
		margin-bottom: 5px;
		text-align : center;
		
	}
        
	@keyframes motion {
		0% {margin-top: 0px;}
		100% {margin-top: 10px;}
	}	
</style>
<body>
	<c:if test="${sessionScope.loginId == null}">
		<%@ include file="../headfoot/header-x.jsp" %>
	</c:if>
	<c:if test="${sessionScope.loginId != null}">
		<%@ include file="../headfoot/header.jsp" %>
	</c:if>
	<div class="box">
		<div class="title">
			<h2>자주하는 질문</h2>
		</div>
		<form id="frmList">
		<table border="1" class="tbl">
			<thead>
				<tr class="thead">	
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
			
		
		</form>
		<div class="btnwrap">
			<input type="button" id="write" value="질문하기" onclick="fnWrite()" class="qBtn">
		</div>
			

	</div>	
	
	
	
</body>
</html>