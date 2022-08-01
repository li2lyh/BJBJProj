<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 비밀번호 찾기</title>

<%-- ----------------------- CDN ----------------------- --%>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor"
	crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.6.0.js"
	integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2"
	crossorigin="anonymous"></script>

<style>
/* ******** 기준 ******** */
body {
	font-size: 20px;
}

/* ******** 공통 ******** */
.layOutBox {
	margin: auto;
	margin-top: 4rem;
	margin-bottom: 10rem;
	width: 50rem;
}

.inputIdBox {
	padding-top: 2rem;
	padding-bottom: 2rem;
	padding-left: 4rem;
	padding-right: 4rem;
}

.inputIdBox input {
	width: 28rem;
}

.submitBtn button {
	width: 8rem;
}
/* ******** 아이디 찾기 Part ******** */
.idBox {
	margin-bottom: 5rem;
}

/* ******** 아이디 폰트 ******** */
.subHead {
	font-size: 1.3rem;
}

/* ******** 비밀번호 폰트 ******** */
#subTitle1 {
	font-size: 1.3rem;
}

#subTitle2 {
	font-size: 1rem;
}

#pw {
	letter-spacing: 0.1rem;
}
</style>
</head>
<body>
	<div class="container">
		<%-- *************************** header *************************** --%>
		<div class=header>
			<jsp:include page="/WEB-INF/views/frame/header.jsp"></jsp:include>
		</div>


		<!-- layoutBox -->
		<div class="layOutBox">
			<div class="idBox">
				<!-- 아이디 찾기 -->
				<div class="title row">
					<div class="col">
						<h2>아이디 찾기</h2>
					</div>
				</div>
				<!-- 아이디 기입창 -->
				<div class="inputIdBox border border-secondary mb-2">
					<form action="" id="searchEmailForm" method="post">
						<div class="row">
							<div class="col subHead p-0">
								<p class="mb-1">성함을 입력해주세요.</p>
							</div>
						</div>
						<div class="row mb-2">
							<input type="text" name="name" id="name" class="form-control">
						</div>
						<div class="row">
							<div class="col subHead p-0">
								<p class="mb-1">가입하신 휴대전화를 입력해주세요.</p>
							</div>
						</div>
						<div class="row mb-3">
							<input type="text" name="phone" id="phone" class="form-control">
						</div>
						<div class="submitBtn row d-flex justify-content-end">
							<button type="button" id="searchEmailBtn"
								class="btn btn-outline-secondary">아이디 찾기</button>
						</div>
					</form>

				</div>
			</div>

			<!-- 비밀번호 찾기 -->
			<div class="title row">
				<div class="col">
					<h2>비밀번호 찾기</h2>
				</div>
			</div>
			<!-- 비밀번호 기입창 -->
			<div class="inputIdBox border border-secondary mb-2">
				<form action="/member/noticeMail" id="formSearchId" method="post">
					<div class="row">
						<div class="col subHead p-0">
							<p class="mb-0" id="subTitle1">ID를 입력해주세요</p>
							<p class="mb-1" id="subTitle2">(E-Mail로 임시 비밀번호가 전송됩니다.)</p>
						</div>
					</div>
					<div class="row mb-3">
						<input type="text" name="email" id="searchPw" class="form-control"
							placeholder="(aaa@gmail.com)">
					</div>
					<div class="submitBtn row d-flex justify-content-end">
						<button type="button" class="btn btn-outline-secondary"
							id="searchPwBtn">비밀번호 찾기</button>
					</div>
				</form>

			</div>
		</div>
		<%-- *************************** footer *************************** --%>
		<div class=footer>
			<jsp:include page="/WEB-INF/views/frame/footer.jsp"></jsp:include>
		</div>
	</div>


	<script>

	/* *********** Email(id) 찾기 ************** */
	$("#searchEmailBtn").on("click",function(){
		
		let regexName = /^[a-zA-Z가-힣]{2,6}$/;
		let regexPhone = /^[0-9]{11}$/;
		
		let name = $("#name").val();
		let phone = $("#phone").val();
		
		if(!regexName.test(name) || name === ""){
			alert("성함을 정확히 입력해주세요.");
			return false;
		} else if(!regexPhone.test(phone) || phone === ""){
			alert("휴대폰번호를 정확히 입력해주세요")
			return false;
		}
		
		// 회원정보와 일치하는 이메일 검사
		$.ajax({
			url : "/member/searchEmail",
			type : "get",
			data : {
				name : $("#name").val(),
				phone : $("#phone").val()
			}, success : function(data){
				console.log(data);
				console.log(data.email);
				if(data == ""){
					alert("회원정보와 일치하는 아이디를 찾지 못하였습니다");
				} else {
					alert("회원님의 이메일은 " + data.email + " 입니다");
				}
								
			}, error : function(e){
				console.log(e);
			}
		});
			
	})
	
	
		/* *********** 비밀번호 찾기 ************** */
		
		$("#searchPwBtn").on("click", function(){
			
			
		
			let regexEmail = /^[a-zA-Z0-9][\w]+@[a-zA-z]+\.(com|net|co\.kr|or\.kr)$/;
			let searchPw = $("#searchPw").val();
			let dataEmail = "";
			
			if(!regexEmail.test(searchPw) || searchPw === ""){
				alert("정확한 아이디를 입력해주세요");
				return false;
			}
			
 			$.ajax({
				url : "/member/searchPw" ,
				type : "get",
				async : false,
				data : { email : $("#searchPw").val() },
				success: function(data){
					if(data == ""){
						alert("등록되지 않은 회원입니다");
					} else {
						/* return dataEmail = data.email; */
						alert("임시비밀번호를 발송하였습니다.");
						$("#formSearchId").submit();
						
					}
				}, error : function(e){
					console.log(e);
				}
				
			})
			
		})
	</script>
</body>
</html>
