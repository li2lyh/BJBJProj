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
<script src="https://code.jquery.com/jquery-3.6.0.js"
	integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2"
	crossorigin="anonymous"></script>
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>

</head>
<style>
/* ******** 기준 ******** */

.head-containe {
	font-size: 20px;
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

/* drop down */
.dropbtn {
	background-color: #ffffff;
	color: black;
	width: auto;
	margin-left: 2rem;
	padding: 0;
	font-size: 2.3rem;
	width: 8.5rem;
	border: none;
	text-align: center;
}

.dropdown {
	position: relative;
	display: inline-block;
}

.dropdown-content {
	display: none;
	position: absolute;
	min-width: auto;
	z-index: 1;
	font-size: 0.5rem;
	text-align: end;
}

.dropdown-content a {
	color: black;
	width: inherit;
	padding-top: 1rem;
	margin-left: 2rem;
	text-decoration: none;
	display: block;
}

.dropdown-content a:hover {
	background-color: #ddd;
}

.dropdown:hover .dropdown-content {
	display: block;
}

.dropdown:hover .dropbtn {
	background-color: #ffffff;
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
	<div class="head-container">
		<!-- ************ 로그인 영역 ************ -->
		<div class="loginBox">
			<div class="row d-flex justify-content-end">
				<div class="col-1 d-flex justify-content-start p-0">
					<!-- Button trigger modal -->
					<c:choose>
						<c:when test="${not empty loginSession}">
							${loginSession.nickname}<span>님 환영합니다!</span>
						</c:when>
						<c:otherwise>
							<a href="#login" data-bs-toggle="modal" data-bs-target="#login">
								로그인 </a>
						</c:otherwise>
					</c:choose>

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
											<input type="text" class="form-control" name="email"
												id="loginId" placeholder="아이디를 입력해주세요"> <input
												type="password" class="form-control" name="password"
												id="loginPw" placeholder="비밀번호를 입력해주세요">
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
										<button type="button" class="btn btn-outline-secondary"
											id="loginBtn">로그인</button>
										<a href="javascript:kakaoLogin();"> <img
											src="//k.kakaocdn.net/14/dn/btroDszwNrM/I6efHub1SN5KCJqLm1Ovx1/o.jpg"
											alt="카카오 로그인 버튼" />
										</a>
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
					<c:choose>
						<c:when test="${not empty loginSession}">
							<a href="/member/logout" id="logout">로그아웃</a>
						</c:when>
						<c:otherwise>
							<a href="/member/toSignUp" id="signUp">회원가입</a>
						</c:otherwise>
					</c:choose>
				</div>
				<div class="col-2 d-flex justify-content-between p-0">
					<input type="text" class="underlineSearch"> <img
						src="https://s3.ap-northeast-2.amazonaws.com/cdn.wecode.co.kr/icon/search.png"
						id="searchIcon" onclick="javascript:location.href='';">
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
				<ul class="nav justify-content-end menuBox">
					<li class="nav-item">
						<button class="dropbtn">Intro</button>
					</li>
					<li class="nav-item dropdown">
						<button class="dropbtn" id="">&nbspBook&nbsp</button>
						<div class="dropdown-content">
							<a href="/books/arrivals">신간도서</a>
							<a href="/books/bestseller">베스트셀러</a>
							<a href="/review/board">도서리뷰</a>
						</div>
					</li>
					<li class="nav-item dropdown">
						<button class="dropbtn">BookClub</button>
						<div class="dropdown-content">
							<a href="/">BookClub</a>
							<a href="#">클럽만들기</a>
							<a href="#">MyBook</a>
						</div>
					</li>
					<li class="nav-item">
						<a href="/library/map"><button class="dropbtn">Library</button></a>
					</li>
				</ul>
			</div>
		</div>

	</div>

	<script>
		/* 검색 버튼 */

		/* 로그인 */
		$("#loginBtn").on("click", function() {

			$.ajax({
				url : "/member/login",
				type : "post",
				data : {
					email : $("#loginId").val(),
					password : $("#loginPw").val()
				},
				success : function(data) {
					console.log(data);
					if (data == "success") {
						location.href = "/"
					} else if (data == "fail") {
						alert("아이디 혹은 비밀번호가 일치하지 않습니다.");
					}
				},
				error : function(e) {
					console.log(e);
				}
			})

		});
		
	/* 카카오 로그인 */
	window.Kakao.init('e2d6408118d8e73e46ae000a50439ccb'); // 발급받은 키 중 javascript키를 사용해준다.
	console.log(Kakao.isInitialized()); // sdk초기화여부판단

	function kakaoLogin() {
		window.Kakao.Auth.login({
			scope:'account_email'
			, success: function(authObj){
				console.log(authObj);
				window.Kakao.API.request({
					url : '/v2/user/me'
					, success : res => {
						const kakao_account = res.kakao_account;
						const email = kakao_account.email;
						
						console.log(kakao_account);
						console.log(email)
						
						$.ajax({
	                        	type: "post",
	                       		url: '/member/kakaoLogin', // 로그인
	                      		data: { "email" : email },
	                      		dataType: "text",
	                        	success: function (data) {
	                            		console.log(data);
	                            		if (data === "fail") {// 회원가입
		                               		console.log("성공!");
		                              		location.href = '/member/toKakaoSignUp?email=' + email;
	                          			} else if (data === "success") {
											console.log("success");
											location.href="/"
										}
	                        }, error: function (request, status, error) {
	                            console.log("code: " + request.status + "\n" + "message: " + request.responseText + "\n" + "error: " + error);
	                        }
	                    })
	                    // ajax끝
	                }
					, fail: function (error) {
						alert(error);
					}
	            })
	        }
	    })
	};
	</script>
</body>

</html>