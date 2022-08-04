<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
	crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<title>내 정보 수정</title>
<style>
/* content 길이 */
.content{
	height: 1000px;
}

/* 메뉴 */
div a {
	color: black;
	text-decoration: none;
}

div a:hover {
	color: black;
	font-weight: bolder;
}

.list {
	color: black;
	text-decoration: none;
}

.list:hover {
	color: black;
	font-weight: bolder;
}

div > .dropdown-menu {
	border: none;
}

div > .dropdown-item:hover {
	background-color: white;
}

/* 정보 수정 */
div textarea {
	resize: none;
}
</style>
</head>

<body>
	<div class="container m-auto">
		<!-- header -->
		<div class="header">
			<jsp:include page="/WEB-INF/views/frame/header.jsp"></jsp:include>
		</div>
		
		<!-- content -->
		<div class="content p-0">
			<div class="row border-bottom border-dark">
				<h2>MyBook</h2>
			</div>
			<div class="row d-flex">
				<!-- 메뉴 -->
				<div class="col-3 p-4">
					<div class="row p-2">
						<a href="/member/toChange">
							<div class="fw-bolder">내 정보 수정</div>
						</a>
					</div>
					<div class="row p-2">
						<a href="/member/toMybookclub">
							<div>참여 독서 모임</div>
						</a>
					</div>
					<div class="row p-2">
						<a href="/member/toMyreview">
							<div>도서 리뷰</div>
						</a>
					</div>
					<div class="row p-2">
						<div class="nav-item dropdown">
							<a class="list nav-link dropdown-toggle p-0"
								id="navbarDarkDropdownMenuLink" role="button"
								data-bs-toggle="dropdown" aria-expanded="false"> 찜 목록 </a>
							<div class="dropdown-menu"
								aria-labelledby="navbarDarkDropdownMenuLink">
								<div>
									<a class="dropdown-item" href="/member/toLikebook">도서</a>
								</div>
								<div>
									<a class="dropdown-item" href="/member/toLikeclub">독서모임</a>
								</div>
							</div>
						</div>
					</div>
				</div>
	
				<!-- 정보 수정 -->
				<div class="col-9 p-4">
					<form id="modifyForm" action="/member/toModifyInfo" method="post">
						<div class="row p-2">
							<div class="col-md-4">
								<label>아이디</label>
							</div>
							<div class="col-md-8">
								<input type="text" class="form-control" id="email" name="email"
									value="${dto.email}" readonly>
							</div>
						</div>
						<div class="row p-2">
							<div class="col-md-4">
								<label>이름</label>
							</div>
							<div class="col-md-8">
								<input type="text" class="form-control" id="name" name="name" value="${dto.name}" readonly>
							</div>
						</div>
						<div class="row p-2">
							<div class="col-md-4">
								<label>닉네임</label>
							</div>
							<div class="col-md-5 col-sm-7">
								<input type="text" class="form-control" id="nickname" name="nickname" value="${dto.nickname}" readonly>
								<div class="invalid-feedback">사용 불가능한 닉네임입니다.<br>2~10자 이내로 영문, 한글, 숫자만 입력</div>
							</div>
							<div class="col-md-3 col-sm-5">
								<button type="button" class="btn btn-secondary w-100" id="changeBtn">변경하기</button>
								<button type="button" class="btn btn-secondary w-100 d-none" id="checkBtn">중복확인</button>						
							</div>
						</div>
						<c:choose>
							<c:when test="${loginSession.user_kakao eq 'Y'}">
								<%-- 카카오 회원이라면 비밀번호, 전화번호 감추기 --%>
								<div class="row p-2 d-none">
									<div class="col-md-3">
										<label>비밀번호</label>
									</div>
									<div class="col-md-9">
										<input type="password" class="form-control" id="password" name="password" value="${dto.password}" readonly>
										<div class="invalid-feedback">비밀번호는 6~12자 이내로 입력해주세요. <br>(영어 대소문자, 숫자, ~!@#$만 입력)</div>								
									</div>						
								</div>
								<div class="row p-2 d-none">
									<div class="col-3">
										<label>비밀번호확인</label>
									</div>
									<div class="col-9">
										<input type="password" class="form-control" id="pwCheck" name="pwCheck" value="${dto.password}" readonly>
									</div>
								</div>
								<div class="row p-2 d-none">
									<div class="col-3">
										<label>휴대폰번호</label>
									</div>
									<div class="col-9">
										<input type="text" class="form-control" id="phone" name="phone" value="${dto.phone}" readonly>
										<div class="form-text d-none" id="phonetxt">휴대폰번호 변경은 관리자에게 문의해주세요.</div>
									</div>
								</div>
							</c:when>
							<c:otherwise>
								<%-- 일반 회원이라면 비밀번호, 전화번호 보이기 --%>
								<div class="row p-2">
									<div class="col-md-4">
										<label>비밀번호</label>
									</div>
									<div class="col-md-8">
										<input type="password" class="form-control" id="password" name="password" value="${dto.password}" readonly>
										<div class="invalid-feedback">비밀번호는 6~12자 이내로 입력해주세요. <br>(영어 대소문자, 숫자, ~!@#$만 입력)</div>								
									</div>						
								</div>
								<div class="row p-2">
									<div class="col-md-4">
										<label>비밀번호확인</label>
									</div>
									<div class="col-md-8">
										<input type="password" class="form-control" id="pwCheck" name="pwCheck" value="${dto.password}" readonly>
									</div>
								</div>
								<div class="row p-2">
									<div class="col-md-4">
										<label>휴대폰번호</label>
									</div>
									<div class="col-md-8">
										<input type="text" class="form-control" id="phone" name="phone" value="${dto.phone}" readonly>
										<div class="form-text d-none" id="phonetxt">휴대폰번호 변경은 관리자에게 문의해주세요.</div>
									</div>
								</div>
							</c:otherwise>
						</c:choose>							
						<div class="row p-2">
							<div class="col-md-4">
								<label>자기소개</label>
							</div>
							<div class="col-md-8">
								<textarea class="form-control" id="mydesc" name="mydesc" rows="5">${dto.mydesc}</textarea>
							</div>
						</div>
						<div class="row p-2 d-flex justify-content-end">						
							<div class="col-4 col-lg-2">
								<button type="button" class="btn btn-secondary w-100" id="cancelBtn">취소</button>
							</div>
							<div class="col-4 col-lg-2">
								<button type="button" class="btn btn-secondary w-100" id="completeBtn">완료</button>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
		
		<!-- footer -->
		<div class="footer">
			<jsp:include page="/WEB-INF/views/frame/footer.jsp"></jsp:include>
		</div>
	</div>

	<script>
		// 취소 버튼 클릭시
		$("#cancelBtn").click(function() {
			location.href = "/member/toChange"
		})
		
		// 비밀번호 체크
		let isPwdValid = false;
		//비밀 번호를 확인 하는 함수 
		function checkPwd() {
			document.querySelector("#password").classList.remove("is-valid");
			document.querySelector("#password").classList.remove("is-invalid");

			const password = document.querySelector("#password").value;
			const pwCheck = document.querySelector("#pwCheck").value;

			let regexPw = /^[a-zA-Z0-9~!@#$]{6,12}$/; // 비밀번호 정규식
			if (!regexPw.test(password)) {
				isPwdValid = false;
				document.querySelector("#password").classList.add("is-invalid");
				return; //함수를 여기서 종료
			}

			if (password != pwCheck) {//비밀번호와 비밀번호 확인란이 다르면
				//비밀번호를 잘못 입력한것이다.
				isPwdValid = false;
				document.querySelector("#password").classList.add("is-invalid");
			} else {
				isPwdValid = true;
				document.querySelector("#password").classList.add("is-valid");
			}
		}

		//비밀번호 입력란에 input 이벤트가 일어 났을때 실행할 함수 등록
		document.querySelector("#password").addEventListener("input", checkPwd);
		document.querySelector("#pwCheck").addEventListener("input", checkPwd);
		
		
		// 닉네임 변경하기 버튼 
		$("#changeBtn").on("click", function(){
			$("#changeBtn").addClass("d-none");
			$("#checkBtn").removeClass("d-none");
			$("#cancleNic").removeClass("d-none");
			$("#nickname").attr("readonly", false);
			$("#nickname").val("");
		})

		
		// 중복 닉네임 체크
		let isNicknameValid = true;
		//닉네임을 입력했을때 실행할 함수 등록
		document.querySelector("#nickname").addEventListener("input", function(){
			document.querySelector("#nickname").classList.remove("is-valid");
			document.querySelector("#nickname").classList.remove("is-invalid");
		      
	        //1. 입력한 닉네임을 읽어와서
	        const inputNickname = this.value;
	        //2. 닉네임을 검증할 정규 표현식 객체를 만들어서
	        let regexNickname = /^[a-zA-Z0-9ㄱ-힣]{2,10}$/; // 닉네임 정규식
	        //3. 정규표현식 매칭 여부에 따라 분기하기
			if(!regexNickname.test(inputNickname)){//만일 매칭된다면
				isNicknameValid = false;
				document.querySelector("#nickname").classList.add("is-invalid"); 
				return; //함수를 여기서 끝낸다 (ajax 전송 되지 않도록)
			}  
	        
	        //2. ajax 전송
	 		$("#checkBtn").on("click", function(){ 
				$.ajax({
					url: "/member/confirmNickname"
					, type : "get"
					, data : {nickname : $("#nickname").val()}
					, success : function(data){
						if(data == "available"){
							isNicknameValid = true;
							document.querySelector("#nickname").classList.add("is-valid");
						} else if(data == "unavailable"){
							isNicknameValid = false;
							document.querySelector("#nickname").classList.add("is-invalid");
						}
					}
					, error : function(e){
						console.log(e);
					}
				})
			}) 	    
		});
		

		// 완료 버튼 클릭시
		$("#completeBtn").click(function() {
			let regexNickname = /^[a-zA-Z0-9ㄱ-힣]{2,10}$/; // 닉네임 정규식
			let regexPw = /^[a-zA-Z0-9~!@#$]{6,12}$/; // 비밀번호 정규식
			let isFormValid = isNicknameValid; // 닉네임 중복
			
			if ($("#nickname").val() === "") {
				alert("닉네임을 입력해주세요.");
				$("#nickname").focus();
				return;
			} else if (!regexNickname.test($("#nickname").val())) {
				alert("형식에 맞지않는 닉네임입니다.");
				$('#nickname').focus();
				return;
			}  else if(!isFormValid) {
				alert("닉네임 중복확인을 해주세요.");
				$('#nickname').focus();
				return;
			} else if ($("#password").val() === "" || $("#pwCheck").val() === "") {
				alert("비밀번호를 입력해주세요.");
				$("#password").focus();
				return;
			} else if ($("#password").val() !== $( "#pwCheck").val()) {
				alert("비밀번호가 일치하지 않습니다.");
				$('#pwCheck').focus();
				return;
			} else if (!regexPw.test($("#password").val())) {
				alert("형식에 맞지않는 비밀번호입니다.");
				$('#password').focus();
				return;
			} 
			
			$("#modifyForm").submit();
		})

	</script>
</body>

</html>