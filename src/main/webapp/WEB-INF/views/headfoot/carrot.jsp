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
</head>
<script>
	function clickMe() {
		window.scrollTo(0,0);
	}
</script>
<style>
    @import url('https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.3.0/css/all.min.css');
    #topBtn{
		top: 90%;
		left: 90%;
		position: fixed;
		z-index: 1;
	}
	
	#topBtn:hover {
		cursor: pointer;
	}
</style>
<body>
	<div id="topBtn" onclick="clickMe()">
		<div><i class="fa-solid fa-carrot fa-lg"></i></div><div>top</div>
	</div>
</body>
</html>