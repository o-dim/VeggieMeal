<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ include file="../headfoot/header.jsp" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="${contextPath}/resources/js/lib/jquery-3.6.4.min.js"></script>
<script>
	var pwValidate = false;
	var phoneNoValidate = false;
	
	// 비밀번호 테스트
	function fnCheckPw() {
		// 숫자, 영문, 특수기호 포함 8글자 이상
		var pwTest = /^[0-9a-z!@#$%^&?]{8,}$/
		
		$('#pw2').keyup(function(event) {
			
			if(pwTest.test($('#pw1').val()) == true && pwTest.test($('#pw2').val()) == true){
				$('#pw_msg').text('')
				pwValidate = true;
				
				if ($('#pw1').val() != $('#pw2').val()) {
					$('#pw2').css('margin-bottom', '0px');
					$('#pw_msg').css('margin', '10px 0px 10px 0px');
					$('#pw_msg').text('비밀번호가 일치하지 않습니다.')
					pwValidate = false;
				}
			} else if (pwTest.test($('#pw1').val()) != true) {
					$('#pw2').css('margin-bottom', '0px');
					$('#pw_msg').css('margin', '10px 0px 10px 0px');
					$('#pw_msg').text('비밀번호는 영문, 숫자, 특수기호를 혼합하여 8자 이상 가능합니다.')
					pwValidate = false;
			}
			
		})
	}
	
	function fnCheckPhoneNo() {
		// 핸드폰 번호 검사
		var phoneNoTest = /^010-[0-9]{4}-[0-9]{4}$/
		$('#phoneNo').keyup(function(event) {
			if(phoneNoTest.test($('#phoneNo').val()) != true){
				$('#perPhoneNo').css('margin-bottom', '0px');
				$('#phone_msg').text('핸드폰 번호를 확인해주세요.');
				$('#phone_msg').css('margin', '5px 0px 5px 0px');
				var phoneNoValidate = false;
			} else {
				$('#phone_msg').text('');
				var phoneNoValidate = true;
			}
		})
	}
	
	// 돌아가기 버튼 눌렀을 때 뒤로 감
	function fnBack() {
		location.href = "${contextPath}/person/mypage.do";
	}
	
	// 함수 호출
	$(function() {
		fnCheckPw();
		fnCheckPhoneNo();
	})

</script>
<!-- 클래스는 . 아이디는 # -->
<style type="text/css">
	.box {
		position: absolute;
		width: 1000px;
		top: 330px;
		left : calc(50% - 1000px/2);
		background-position: center;
		background: #F4F4F4;
		border-radius: 59px;
		margin-bottom: 100px;
	}
	
	h1 {
		text-align: center;
		margin-bottom: 50px;
	}
	
	#update_frm {
		display: flex;
		justify-content: center;
	}
	
	.centerplz {
		margin : 0 300px;
	}
	
	input {
		width : 410px;
		border: none;
		border-bottom: 1px solid black;
		padding-top: 20px;
		margin-bottom: 20px;
		outline: none;
		background-color: transparent;
	}
	#name, #id, #email {
		border-bottom : none;
	}
	input[type="button"] {
		width : 200px;
	}
	#postcode {
		width : 200px;
	}
	
	input[type="radio"] {
		width: 40px;
	}
	.gender {
		display: flex;
	}
	.updateBtn {
		border: none;
		background-color : #FACC57;
		padding : 6px;
		width : 410px;
		height: 40px;
	}
	.fnBack {
		text-align: center;
		font-size: 14px;
		margin : 20px 0;
	}
	/* 로그인 관련  */
	#pw_msg, #id_msg, #phone_msg {
		color : red;
	}
</style>
<body>
	<!-- 회원가입란 -->
	<div class="box">
	<div>
		<h1>회원정보수정</h1>
	</div>
		<form action="/edit.do" method="post" id="update_frm">
			<div class="centerplz">
				<div>이름</div>
				<input type="text" id="name" placeholder="이름은 변경이 불가능합니다." readonly="readonly">
				<div>아이디</div>
				<input type="text" id="id" placeholder="아이디는 변경이 불가능합니다." readonly="readonly">
				<div id="id_msg"></div>
				<div>이메일</div>
				<input type="text" name="email" id="email" placeholder="이메일은 변경이 불가능합니다." readonly="readonly">
				<div>핸드폰번호</div>
				<input type="text" id="phoneNo" name="phoneNo" placeholder="하이픈기호(-)를 포함하여 입력해주세요">
				<div id="phone_msg"></div>
				<div>비밀번호</div>
				<input type="password" name="pw" id="pw1" placeholder="비밀번호는 8자이상입니다">
				<div>비밀번호 확인</div>
				<div id="pw_msg1"></div>
				<input type="password" id="pw2" placeholder="비밀번호는 8자이상입니다.">
				<!-- 패스워드 일치시, 불일치시 메세지 -->
				<div id="pw_msg2"></div>
					
				<div class="gender">
					<span>성별</span>
					<label for="male">
						<input type="radio" name="gender" value="male" id="male">남성
					</label>
					<label for="female">
						<input type="radio" name="gender" value="female" id="female">여성
					</label>
				</div>
				<div>주소</div>
				<!-- 주소 api 자리 -->
				<span><input type="text" id="postcode" onclick="daumPostcode()" name = "postcode" placeholder="우편번호"></span>
				<span><input type="button" onclick="daumPostcode()" value="우편번호 찾기"><br></span>
				<input type="text" id="roadAddress" name="roadAddress" placeholder="도로명주소">
				<input type="text" id="jibunAddress" name="jibunAddress" placeholder="지번주소">
				<span id="guide" style="color:#999;display:none"></span>
				<div>상세주소</div>
				<input type="text" id="detailAddress" name="detailAddress" placeholder="상세주소">
				<input type="text" id="extraAddress" name="extraAddress" placeholder="참고항목">
				<button class="updateBtn">수정완료</button>
				<div onclick="fnBack()" class="fnBack">돌아가기</div>
			</div>
		</form>
	</div>
	
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
		<script>
		    function daumPostcode() {
		        new daum.Postcode({
		            oncomplete: function(data) {
		                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
		
		                // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
		                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
		                var roadAddr = data.roadAddress; // 도로명 주소 변수
		                var extraRoadAddr = ''; // 참고 항목 변수
		
		                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
		                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
		                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
		                    extraRoadAddr += data.bname;
		                }
		                // 건물명이 있고, 공동주택일 경우 추가한다.
		                if(data.buildingName !== '' && data.apartment === 'Y'){
		                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
		                }
		                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
		                if(extraRoadAddr !== ''){
		                    extraRoadAddr = ' (' + extraRoadAddr + ')';
		                }
		
		                // 우편번호와 주소 정보를 해당 필드에 넣는다.
		                document.getElementById('postcode').value = data.zonecode;
		                document.getElementById("roadAddress").value = roadAddr;
		                document.getElementById("jibunAddress").value = data.jibunAddress;
		                
		                // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
		                if(roadAddr !== ''){
		                    document.getElementById("extraAddress").value = extraRoadAddr;
		                } else {
		                    document.getElementById("extraAddress").value = '';
		                }
		
		                var guideTextBox = document.getElementById("guide");
		                // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
		                if(data.autoRoadAddress) {
		                    var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
		                    guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
		                    guideTextBox.style.display = 'block';
		
		                } else if(data.autoJibunAddress) {
		                    var expJibunAddr = data.autoJibunAddress;
		                    guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
		                    guideTextBox.style.display = 'block';
		                } else {
		                    guideTextBox.innerHTML = '';
		                    guideTextBox.style.display = 'none';
		                }
		            }
		        }).open();
		    }
		</script>
</body>
</html>