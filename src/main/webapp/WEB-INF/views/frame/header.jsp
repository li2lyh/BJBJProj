<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html lang="en">

<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Header</title>
<!-- CDN -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor"
	crossorigin="anonymous">
	<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
</head>
<style>
/* ******** 기준 ******** */
body {
	font-size: 15px;
}

/* ******** 로그인 영역 ******** */
.loginBox {
	margin-top: 1rem;
}

.loginBox a {
	color: black;
	text-decoration: none;
}

/* 로그인 모달 */
.modal-content {
	width: 43rem;
	height: 25rem;
}

/* 모달 body */
.modal-body {
	padding-top: 2rem;
	padding-left: 4.3rem;
	padding-right: 4.3rem;
}

.modal-body .logintitle {
	padding-bottom: 0.9rem;
}

.modal-body .inputBox input {
	margin-bottom: 0.5rem;
}

/* 로그인 버튼 */
.btnBox {
	height: 2.5rem;
	margin-top: 1.7rem;
}

.btnBox button {
	margin-left: 0.8rem;
	margin-right: 0.8rem;
	width: 12rem;
}

/* Search 창 */
input.underlineSearch {
	width: 11rem;
	border: 0;
	border-bottom: 1px solid #2e2e2e;
}

input.underlineSearch:focus {
	outline: none;
}

#searchIcon {
	width: 2rem;
	height: 2rem;
}

/* ******** Nav 박스 ******** */
/* navBox */
.navBox {
	height: 100px;
}

/* blankBox */
.blankBox {
	height: 50%;
}

/* menuBox */
.menuBox div {
	height: 50%;
}

.menuBox a {
	font: 1.8em sans-serif;
	color: black;
	text-decoration: none;
}
</style>

<body>
	<div class="container">
		<!-- ************ 로그인 영역 ************ -->
		<div class="loginBox">
			<div class="row d-flex justify-content-end">
				<div class="col-1 d-flex justify-content-start p-0">
					<!-- Button trigger modal -->
					<a href="#login" data-bs-toggle="modal" data-bs-target="#login">
						로그인 </a>
					<!-- Modal -->
					<div class="modal fade" id="login" tabindex="-1"
						aria-labelledby="exampleModalLabel" aria-hidden="true">
						<div class="modal-dialog">
							<div class="modal-content">
								<!-- 모달 타이틀 -->
								<div class="modal-header">
									<div class="col d-flex justify-content-center">
										<h3 class="modal-title">북적북적</h3>
									</div>
									<button type="button" class="btn-close" data-bs-dismiss="modal"
										aria-label="Close"></button>
								</div>
								<!-- 모달 컨텐츠 -->
								<div class="modal-body">
									<div class="logintitle">
										<h4 class="m-0">로그인</h4>
									</div>
									<!-- login input -->
									<div class="inputBox">
										<form method="post" id="loginForm">
											<input type="text" class="form-control" name="email" id="email"
												placeholder="아이디를 입력해주세요"> 
											<input type="password" class="form-control" name="password" id="password"
												placeholder="비밀번호를 입력해주세요">
										</form>
									</div>
									<!-- 기타 등등(기억하기, 찾기, 회원가입)-->
									<div class="etcBox">
										<div class="row d-flex align-middle">
											<div class="col-6 d-flex justify-content-start">
												<input class="form-check-input" type="checkbox" value="">&nbsp아이디
												기억하기
											</div>
											<div class="col-4 d-flex justify-content-end p-0">
												<a href="/member/toFindInfo">아이디/비밀번호 찾기</a>
											</div>
											<div class="col-2 d-flex justify-content-end">
												<a href="/member/toSignUp" id="signUp">회원가입</a>
											</div>
										</div>
									</div>
									<div class="btnBox d-flex justify-content-center">
										<button type="button" class="btn btn-outline-secondary" id="loginBtn">로그인</button>
										<button type="button" class="btn btn-outline-secondary" id="kakaoBtn">카카오로그인</button>
									</div>
								</div>

							</div>
						</div>
					</div>
				</div>
				<div class="col-1 d-flex justify-content-start p-0">
					<a href="" id="myBookBtn">MyBook</a>
				</div>
				<div class="col-1 d-flex justify-content-start p-0">
					<a href="/member/toSignUp">회원가입</a>
				</div>
				<div class="col-2 d-flex justify-content-between p-0">
					<input type="text" class="underlineSearch"> 
					<img src="https://s3.ap-northeast-2.amazonaws.com/cdn.wecode.co.kr/icon/search.png" id="searchIcon" onclick="javascript:location.href='';">
				</div>
			</div>
		</div>

		<!-- ************ Logo, nav 영역 ************ -->

		<div class="navBox row">
			<!-- ***** Logo ***** -->
			<div class="col-4 p-0">
				<div class="logoBox">
					<div class="logo">Logo</div>
				</div>
			</div>

			<!-- ***** Blank ***** -->
			<div class="col-8">
				<div class="blankBox row">
					<div class=" col-12"></div>
				</div>
				<div class="menuBox row">
					<div class="col-3 d-flex"></div>
					<div class="col-2 d-flex justify-content-end align-items-end p-0">
						<a href="">Intro</a>
					</div>
					<div class="col-2 d-flex justify-content-end align-items-end p-0">
						<a href="/books/bestseller">Book</a>
					</div>
					<div class="col-3 d-flex justify-content-end align-items-end p-0">
						<a href="/club/toClub">BookClub</a>
					</div>
					<div class="col-2 d-flex justify-content-end align-items-end p-0">
						<a href="/library/map">Library</a>
					</div>

				</div>
			</div>
		</div>

	</div>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2"
		crossorigin="anonymous"></script>
	<script>
		/* 검색 버튼 */
		
		/* 로그인 */
		$("#loginBtn").on("click", function(){
			
			
			$.ajax({
				url : "/member/login"
				, type : "post"
				, data : {email : $("#email").val(), password : $("#password").val()}
				, success : function(data){
					console.log(data);
					if(data == "success"){
						location.href = "/"
					}else if (data == "fail"){
						alert("아이디 혹은 비밀번호가 일치하지 않습니다.");
					}
				}
				, error : function(e){
					console.log(e);
				}
			})
			
		});
		


	</script>
</body>

</html>