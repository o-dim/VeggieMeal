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

$(function(){
   $('.explanation_1').summernote({
      width: 640,
      height: 480,
      lang: 'ko-KR',
      toolbar: [
         ['style', ['bold', 'italic', 'underline', 'clear']],
         ['font', ['strikethrough', 'superscript', 'subscript']],
         ['fontname', ['fontname']],
         ['color', ['color']],
         ['para', ['ul', 'ol', 'paragraph']],
         ['table', ['table']],
         ['insert', ['link', 'picture', 'video']],
         ['view', ['fullscreen', 'codeview', 'help']]
      ]
   })
})

</script>
<style>

   
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
		font-size: 25px;	
		display: flex;
		justify-content: space-between;
		margin-left: 80px;
   }
   
	.total {
	margin-left:400px;
	margin-right: 400px;
	}
	
	#recipeContent1 {
		width:500px;
		height:150px;
	}
	#recipeContent2 {
		width:500px;
		height:150px;
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
            <h1>${r.recipeNo}번 레시피 편집하기</h1>
         </div>
         <div class="fn">
	      <form id="edit_frm" method="post" action="${contextPath}/menu2/modify.do">
	               <div class="explanation_1">
		               <table>
		                  <tbody>
		                  <tr>
		                     <td><label for="recipeTitle" style="font-size:16px;">제목</label></td>
		                     <td><input type="text" id="recipeTitle" name="recipeTitle" value="${r.title}" size="30px"></td>
		                  </tr>
		                 <tr>
		                    <td><label for="recipeContent1">준비물</label></td>
		                    <td><textarea id="recipeContent1" name="recipeContent1" rows="10" cols="30">${r.content1}</textarea></td>
		                 </tr>  
		                  <tr>
		                     <td><label for="recipeContent2">레시피</label></td>
		                     <td><textarea id="recipeContent2" name="recipeContent2" rows="10" cols="30">${r.content2}</textarea></td>
		                  </tr>
		                  </tbody>
		               </table>
	              </div>
	 		<div>
				<input type="hidden" name="recipeNo" value="${r.recipeNo}">
				<button>편집완료!</button>
			</div>
		</form>
			</div>
      </div>
	     
      
      
      


<%@ include file="../headfoot/carrot.jsp" %>        
</body>
</html>