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

</script>
<style>

	

 header {
		position: fixed;
		top: 0;
		left: 0;
		right: 0;
		height: 50px;
		padding: 1rem;
		color: black;
		background: white;
		display: flex;
		justify-content: space-between;
		align-items: center;
		border-bottom: 20px solid #facc57;
	}
	

	
	button {
      margin-left: 10px;
      font-size: 16px;
      background-color: transparent;
      border: none;
   }

	body {
		padding-top: 100px;
	}
	
	 .payment2 {
    	
	  display: flex;
	  justify-content: center;
	  align-items: center;
	  flex-direction: column;
    }
	
	.consumer > input {
		width: 300px;
		border: none;
		border-bottom: 1px solid black;
		outline: none;
		padding-top: 5px;
		margin-bottom: 5px;
	}
	
	.receiver > input {
	width: 300px;
	border: none;
	border-bottom: 1px solid black;
	outline: none;
	padding-top: 5px;
	margin-bottom: 5px;
	}
	

      .main_section {
           display: flex;
       }
       .left_section {
       
           border: 1px solid gray;
           margin-right: 20px;
           flex: 4;  /* width: 40%; */
       }
       .found {
       	    display: block;
			border:none;
			background-color: #FACC57;
			margin: auto;
			padding: 6px;
			width: 149px;
			height: 42px;	
       
       }
       .right_section {
           border: 1px solid gray;
           flex: 6;  /* width: 60%; */
       }
       
       
       
          article {
            margin: 10px 5px 0;
            padding: 10px;
            background-color: #FFF;
        }
      
     
 

       
       .buy{
	       	display: block;
			border:none;
			background-color: #FACC57;
			margin: auto;
			padding: 6px;
			width: 568px;
			height: 50px;	
	   }
	   
	   .back {
	   	display: block;
			border:none;
			margin: auto;
			padding: 6px;
			width: 568px;
			height: 50px;	
	   
	   }
		
	   .wanted img {
	   	
	   	width:20%;
	   	height: 20%;
	   	
	   }
	   
	   .wanted p {
	   
	   float:right;
	   
	   }
	   
	   	#arrest {
		height: auto;
		min-height: 100px;
	
	}
	   
	
	  footer {
	  height: 120px;
	  position: relative;
	  bottom: 0;
	  left: 0;
	  right: 0;
	  background-color: #FACC57;
	  }	
       footer > p {
          text-align: left;
          line-height: 10px;
       }
		

	

</style>

</head>

<body>
  <header>
  		<div class="logo_img">
			<img src="${contextPath}/resources/images/mainlogo.png" width="400px">
		</div>

    <div>
      <form method="post">
        <button>메뉴</button>
        <button>메뉴2</button>
        <button>메뉴3</button>
        <button>로그인</button>
        <button>회원가입</button>
      </form>
    </div>
  </header>
	<div id="arrest">
	<div class="payment2">
		<img src="${contextPath}/resources/images/payment2.PNG" width="738px">
	</div>
  	<section class="main_section">
	    <section class="left_section">
	 
	      <article>
	        <h2>검거페이지</h2>
	        No.19293921 검거
	      </article>
	      <article>
	        <div class="consumer">
	          <h3>구매자 정보</h3>
	          <div>구매자 이름</div>
	          <input type="text" name="con_name" id="con_name">
	          <div>구매자 전화번호</div>
	          <input type="text" name="con_phoneNo" id="con_phoneNo">
	        </div>
	      </article>
	      <article>
	        <h3>받으시는 분 정보</h3>
	        <div class="receiver">
	          <label for="check" >
	            <input type="checkbox" id="check" style="margin-bottom: 30px;">구매자와 동일합니다
	          </label>
	          <div>이름</div>
	          <input type="text" name="rec_name" id="rec_name">
	          <div>전화번호</div>
	          <input type="text" name="rec_phoneNo" id="rec_phoneNo">
	          <div>우편번호</div>
	          <input type="text" name="rec_postcode" id="rec_postcode">
	          <span><button class="found" style="cursor: pointer;">우편번호찾기</button></span>
	          <div>주소</div>
	          <input type="text" name="rec_address" id="rec_address">
	          <div>상세주소</div>
	          <input type="text" name="rec_address2" id="rec_address2">
	          <form>
	            <h3>배송 요청 사항</h3>
	            <select name="delivery_memo">
	              <option value="1" selected>벨 누르고 앞에 두고 가주세요</option>
	              <option value="2">소화전에 넣어 주세요</option>
	              <option value="3">부재중일 시 문 앞에 두고 문자 주세요</option>
	            </select>
	          </form>
	        </div>
	      </article>
	    </section>
	    <section class="right_section">
	      <article>
	        <h2>상품목록</h2>
	   
		     
		<div class="wanted">
			<div>
		    <a href="${contextPath}/menu1/wantedDetail.do">
				<img src="${contextPath}/resources/images/v_01.png"></a>
				<p><span class="name">싸움고수 </span></p>
				<p><span class="price">15,000 </span></p>
			</div>
			<div>
			<a href="${contextPath}/menu1/wantedDetail.do">
				<img src="${contextPath}/resources/images/v_02.png"></a>
				<p><span class="name">깻잎</span></p>
				<p><span class="price">12,000</span></p>
			</div>
			<div>
			<a href="${contextPath}/menu1/wantedDetail.do">
				<img src="${contextPath}/resources/images/v_03.png"></a>
				<p><span class="name">땅땅콩콩</span></p>
				<p><span class="price">10,000</span></p>
			</div>
        <hr>
        <div>
        	<div>상품 금액</div>
        	<div>배송비</div>
        	<div><h2>결제예정</h2></div>
        </div>
        </div>
        
	    </article>
	      <article>
	        <button class="buy" style="cursor: pointer;">검거하기</button>
	        <div><button class="back" style="cursor: pointer;">돌아가기</button></div>
	        <div class="img"></div>
	        <div class="img"></div>
	        <div class="img"></div>
	      </article>
    </section>
  </section>
</div>
<footer>
    <h3>VeggieMeal</h3>
    <p>주식회사 중꺽마 | 대표: 구디자바61 | 사업자 등록번호: 888-82-8888</p>
    <p>소재지: (08505) 서울특별시 금천구 가산디지털2로 95 (가산동, km타워) 2층, 3층</p>
    <p>통신판매업 신고번호: 2023-서울금천-0526 | 제품 및 검거 문의: moneyplease@gmail.com | 농산물 포획 및 긴급 구출 제보: 02-3333-8282</p>
</footer>
</body>
</html>