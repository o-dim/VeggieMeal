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
	var idValidate = false;
	var pwValidate = false;
	var phonenoValidate = false;
	var nameValidate = false;
	var emailValidate = false;
	
	// 아이디 테스트
	function fnCheckId() {
		// 알파벳으로 시작, 알파벳, 숫자, 하이픈, 언더바로만 이루어지되 4자 이상
		var idTest = /^[a-z0-9][0-9a-z-_]{4,}$/;
		
		$('#id').keyup(function() {
			verifyId = idTest.test($('#id').val());
			if(verifyId == false){				
				$('#id_msg').addClass('id_false');
				$('#id_msg').removeClass('id_true');
				$('#id_msg').removeClass('id_init');
				$('#id_msg').text('아이디는 4자 이상, 숫자, 영어, 하이픈 및 언더바만 가능합니다.');
				return;
			}
			// 중복 아이디 테스트
			$.ajax({
				type : 'get',
				url : '${contextPath}/person/verifyId.form',
				data : "id=" + id,
				dataType : 'json',
				success : function(resData) {
					verifyId = resData.enableId;
					if(verifyId){
						$('#id_msg').text('사용 가능한 아이디입니다.');
						$('#id_msg').addClass('id_true');
						$('#id_msg').removeClass('id_false');
						$('#id_msg').removeClass('id_init');	
						idValidate = true;
					} else {
						$('#id_msg').text('이미 존재하는 아이디입니다.');
						$('#id_msg').addClass('id_false');
						$('#id_msg').removeClass('id_true');
						$('#id_msg').removeClass('id_init');
						idValidate = false;
					}
				}
			})
		})
	}
	
	// 비밀번호 검사
	function fnCheckPw() {
		$('#pw1').on('keyup', function() {
			let pw = $(this).val();
			let pwLength = pw.length;
			let validCount = /[a-zA-Z]/.test(pw)  
            				+ /[0-9]/.test(pw)
            				+ /[^a-zA-Z0-9]/.test(pw);
 			verifyPw = (pwLength >= 8) && (validCount >= 3);
			if(verifyPw) {
				$('#pw1').css('margin-bottom', '0px');
				$('#pw_msg1').addClass('pw_true');
				$('#pw_msg1').removeClass('pw_init');
				$('#pw_msg1').removeClass('pw_false');
				$('#pw_msg1').text('사용 가능한 비밀번호입니다.');
			} else {
				$('#pw1').css('margin-bottom', '0px');
				$('#pw_msg1').text('비밀번호는 8자 이상, 영문, 숫자, 특수문자의 조합이 필요합니다.');
				$('#pw_msg1').addClass('pw_false');
				$('#pw_msg1').removeClass('pw_init');
				$('#pw_msg1').removeClass('pw_true');
				pwValidate = false;
			}
		})
	}
	
	// 비밀번호 일치 검사
	function fnCheckPwAgain() {
		$('#pw2').on('keyup', function() {
			let pw1 = $('#pw1').val();
			let pw2 = $('#pw2').val();
			verifyPw = (pw1 == pw2);
			if(verifyPw) {
				$('#pw2').css('margin-bottom', '0px');
				$('#pw_msg2').text('비밀번호가 일치합니다.');
				$('#pw_msg2').addClass('pw_true');
				$('#pw_msg2').removeClass('pw_init');
				$('#pw_msg2').removeClass('pw_false');
				pwValidate = true;
			} else {
				$('#pw2').css('margin-bottom', '0px');
				$('#pw_msg2').text('비밀번호가 일치하지 않습니다.');
				$('#pw_msg2').addClass('pw_false');
				$('#pw_msg2').removeClass('pw_init');
				$('#pw_msg2').removeClass('pw_true');
			}
		})
	}
	
	// 이름 검사
	function fnNameCheck() {
		$('#name').on('keyup', function(){
			nameValidate = $(this).val() != '';
		 })
	}
	
	// 핸드폰 번호 검사
	function fnCheckPhoneno() {
		var phonenoTest = /^010[0-9]{8}$/
		$('#phoneno').on('keyup', function() {
			verifyPhone = phonenoTest.test($('#phoneno').val());
			if(verifyPhone){
				$('#phone_msg').text('');
				var phonenoValidate = true;
			} else {
				$('#phoneno').css('margin-bottom', '0px');
				$('#phone_msg').text('핸드폰 번호를 확인해주세요.');
				$('#phone_msg').css('margin', '10px 0px 10px 0px');
				var phonenoValidate = false;
			}
		})
	}

	// 이메일 검사
	function fnEmailCheck() {
		$('#btnGetCode').on('click', function() {
			let email = $('#email').val();
			new Promise(function(resolve, reject) { 
				let emailTest = /^[a-zA-Z0-9-_]+@[a-zA-Z0-9]{2,}(\.[a-zA-Z]{2,6}){1,2}$/;
				verifyEmail = emailTest.test(email);
				alert('인증번호를 이메일로 전송하였습니다.');
				if(verifyEmail == false) {
					reject(1);
					return;
				}
				
				// 이메일 중복 검사
				$.ajax({
					type : 'get',
					url : '${contextPath}/person/verifyEmail.form',
					data : 'email=' + email,
					dataType : 'json',
					success : function(resData) {
						if(resData.enableEmail) {
							resolve();
						} else {
							reject(2);
						}
					}
				})
				
			}).then(function() {
				$.ajax({
					type : 'get',
					url : '${contextPath}/person/sendAuthCode.form',
					data : 'email=' + email,
					dataType : 'json',
					success : function(resData) {
						$('#btnVerifyCode').on('click', function() {
							emailValidate = (resData.authCode == $('#authCode').val());
							if (emailValidate) {
								$('#email_verify_msg').text('이메일 인증이 완료되었습니다.');
							} else {
								$('#email_verify_msg').text('이메일 인증에 실패하였습니다.');
							}
						})
					},
					error : function(jqXHR) {
						$('#email_verify_msg').text('인증 메일이 발송되지 않았습니다.');
						emailValidate == false;
					}
				})
				
			}).catch(function(number) {
				let msg = '';
				switch (number) {
				case 1:
					msg = '이메일 형식이 올바르지 않습니다';
					break;
				case 2:
					break;
				}
				$('#email_msg').text(msg);
			})
		})
	}
	
	// 돌아가기 버튼 눌렀을 때 뒤로 감
	function fnBack() {
		hitory.back();
	}
	// form 제출여부
	function fnJoin() {
		$('#register_frm').on('submit', function(event) {
			if(idValidate == false) {
				alert('아이디를 확인해주세요.');
				event.preventDefault();
				return false;
			} else if (pwValidate == false) {
				alert('비밀번호를 확인해주세요.');
				event.preventDefault();
				return false;
			} else if (nameValidate == false) {
				alert('이름을 확인해주세요.');
				event.preventDefault();			
				return false;
			} else if (emailValidate == false) {
				alert('이메일을 확인해주세요.');
				event.preventDefault();			
				return false;
			}
		})
	}
	// 함수 호출
	$(function() {
		fnCheckId();
		fnCheckPw();
		fnCheckPwAgain();
		fnNameCheck();
		fnCheckPhoneno();
		fnEmailCheck();
		fnJoin();
	})

</script>
<!-- 클래스는 . 아이디는 # -->
<style type="text/css">
	
	.box {
		position: absolute;
		width: 1000px;
		top: 210px;
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
	#register_frm {
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
	input[type="button"] {
		border: 1px solid black;
		width : 190px;
		margin-left : 20px;
	}
	#postcode, #email, #authCode {
		width : 190px;
	}

	input[type="radio"] {
		width: 40px;
	}
	.gender {
		display: flex;
	}
	.regiBtn {
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
	#email_verify_msg {
	 	color : blue;
	 	font-size: 14px;
	 	margin: 0px 0px 10px 0px;
	}
	.id_false, .pw_false, #phone_msg {
		color : red;
		font-size: 14px;
		margin : 0px 0px 10px 0px;
	}
	.id_true, .pw_true {
		color : blue;
		font-size: 14px;
		margin : 0px 0px 10px 0px;
	}
</style>
</head>
<body>
	<!-- 회원가입란 -->
	<div class="box">
	<div>
		<h1>회원가입</h1>
	</div>
		<form action="${contextPath}/person/join.form" method="post" id="register_frm">
			<div class="centerplz">
				<div>이름</div>
				<input type="text" name="name" id="name" placeholder="이름">
				<div>아이디</div>
				<input type="text" name="id" id="id" placeholder="아이디">
				<div id="id_msg" class="id_init"></div>
				<div>
					<div>이메일</div>
	        		<input type="text" name="email" id="email">
			        <input type="button" value="인증번호받기" id="btnGetCode">
					<div id="email_msg"></div>
					<input type="text" id="authCode" placeholder="인증코드 입력">
					<input type="button" value="인증하기" id="btnVerifyCode">
					<div id="email_verify_msg"></div>
				</div>
				<div>핸드폰번호</div>
				<input type="text" id="phoneno" name="phoneno" placeholder="하이픈기호(-)를 제외하고 입력해주세요">
				<div id="phone_msg"></div>
				<div>비밀번호</div>
				<input type="password" name="pw" id="pw1" placeholder="비밀번호는 8자이상입니다">
				<div id="pw_msg1" class="pw_init"></div>
				<div>비밀번호 확인</div>
				<input type="password" id="pw2" placeholder="비밀번호는 8자이상어쩌고">
				<!-- 패스워드 일치시, 불일치시 메세지 -->
				<div id="pw_msg2" class="pw_init"></div>
					
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
				<span><input type="text" id="postcode" onclick="daumPostcode()" name = "postAddress" placeholder="우편번호"></span>
				<span><input type="button" onclick="daumPostcode()" value="우편번호 찾기"><br></span>
				<input type="text" id="roadAddress" name="roadAddress" placeholder="도로명주소">
				<input type="text" id="jibunAddress" name="jibunAddress" placeholder="지번주소">
				<span id="guide" style="color:#999;display:none"></span>
				<div>상세주소</div>
				<input type="text" id="detailAddress" name="detailAddress" placeholder="상세주소">
				<input type="text" id="extraAddress" name="extraAddress" placeholder="참고항목">
				<button class="regiBtn">회원가입</button>
				<div onclick="fnBack()" class="fnBack">돌아가기</div>
			</div>
		</form>
	</div>
	
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
		<script>
		    function daumPostcode() {
		        new daum.Postcode({
		            oncomplete: function(data) {
		                var roadAddr = data.roadAddress;
		                var extraRoadAddr = '';
		                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
		                    extraRoadAddr += data.bname;
		                }
		                if(data.buildingName !== '' && data.apartment === 'Y'){
		                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
		                }
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