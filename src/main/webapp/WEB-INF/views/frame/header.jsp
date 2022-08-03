<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html lang="en">

<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Header</title>


<%-- ----------------------- CDN ----------------------- --%>
<script src="https://code.jquery.com/jquery-3.6.0.js"
	integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
	crossorigin="anonymous"></script>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa"
	crossorigin="anonymous"></script>
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>


</head>
<style>
/* ******** 기준 ******** */
.head-container {
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

/* ******** 로그인 모달 ******** */
#login .modal-dialog {
	margin-top: 7rem;
	margin-bottom: 7rem;
	height: auto;
	
}

#login .modal-content {
	height: 100%;
	width : 70%;
	
	
}

#login .modal-content .modal-body {
	margin-top: 1rem;
	margin-bottom: 2rem;
	font-size: 1rem;
	color: #424242;
}

/* 로그인 버튼 */
.head-container .btnBox {
	height: 2.5rem;
	margin-top: 1.7rem;
}

.head-container .btnBox button {
	margin-left: 0.8rem;
	margin-right: 0.8rem;
	width: 12rem;
}
/* Search 창 */
input.underlineSearch {
	width: 11rem;
	height: 1.3rem;
	padding-left: 0.5rem;
	padding-right:0.5rem;
	border: 0;
	border-bottom: 1px solid #2e2e2e;
}
input.underlineSearch:focus {
	outline: none;
}
#searchIcon {
	margin-bottom: 0.3rem;
	width: 1.3rem;
	height: 1.3rem;
}
/* ********비반응형 Nav 박스 ******** */
/* navBox */
.navBox-nonType {
	width: 100%;
}
/* drop down */
.navBox-nonType .nav {
	width: auto;
}
.navBox-nonType .nav-item {
	width: auto;
	margin-left: 2rem;
}
.navBox-nonType .dropbtn {
	background-color: #ffffff;
	color: black;
	padding: 0;
	font-size: 2.3rem;
	width: 8.5rem;
	border: none;
	text-align: center;
}
.navBox-nonType .dropdown {
	position: relative;
	display: inline-block;
}
.navBox-nonType .dropbtn+.dropdown-content {
	display: none;
	position: absolute;
	width: 8.5rem;
	height: 5rem;
	min-width: auto;
	z-index: 1;
	font-size: 1rem;
	text-align: center;
	align-item: center;
}
.navBox-nonType .dropdown-content a {
	color: black;
	width: inherit;
	margin-top: 0.2rem;
	margin-bottom: 0.2rem;
	text-decoration: none;
	display: block;
}
.navBox-nonType .dropdown-content a:hover {
	background-color: #ddd;
}
.navBox-nonType .dropdown:hover .dropdown-content {
	display: block;
}
.navBox-nonType .dropdown:hover .dropbtn {
	background-color: #ffffff;
}

#btnClubBoard:hover {
	cursor: pointer;
}
/* menuBox */
.navBox-nonType .menuBox div {
	height: 50%;
}
/* 
.navBox-nonType .menuBox a {
	font: 1.8em sans-serif;
	color: black;
	text-decoration: none;
} */

/* 쪽지함 */

.letterImg {
	width: 2rem;
	height: 2rem;
	padding: 2px;
	margin-right: 0.2rem;
}


.letterImg:hover {
	cursor: pointer;
}

/*empty*/
.empty{
	height:80px;
}

</style>

<body>
	<div class="head-container">
		<!-- -------------- 최상단 영역 -------------- -->
		<div class="loginBox">
			<div class="row d-flex justify-content-end">
			
				<%-- <div class="res-1">
				<!-- -------------- 반응형 -------------- -->
					<!-- -------- 반응형 상단 Nav바 -------- -->
					<div class="col-3 d-md-none justify-content-start"></div>
					<!-- -------- 반응형 상단 Logo -------- -->
					<div class="col-6 d-md-none justify-content-center">logo</div>
	
					<!-- -------- 반응형 상단 Content(login/mypage/search -------- -->
					<!-- -------- 반응형 상단 회원 : 쪽지함/ 비회원 : Login -------- -->
					<div class="col-1 d-md-none d-flex justify-content-start p-0">
						<c:choose>
							<c:when test="${not empty loginSession}">
								<!-- 로그인 : 쪽지함 -->
								쪽지함
							</c:when>
							<c:otherwise>
								<!-- 비로그인 : login -->
								<a href="#login" data-bs-toggle="modal" data-bs-target="#login">
									로그인 </a>
							</c:otherwise>
						</c:choose>
					</div>
					<!-- -------- 반응형 상단 myBook(마이페이지) -------- -->
					<div class="col-1 d-md-none d-flex justify-content-start p-0">
						<c:choose>
							<c:when test="${not empty loginSession}">
								<!-- 로그인 : 마이페이지 -->
								<a href="/member/toMyinfo" id="myBookBtn">MyBook</a>
							</c:when>
							<c:otherwise>
								<!-- 비로그인 : mypage -->
								<a href="#login" id="myBookBtn" data-bs-toggle="modal"
									data-bs-target="#login">MyBook</a>
							</c:otherwise>
						</c:choose>
					</div>
					<!-- -------- 반응형 상단 회원 : 로그아웃/ 비회원 : 회원가입 -------- -->
					<div class="col-1 d-md-none d-flex justify-content-start p-0">
						<c:choose>
							<c:when test="${not empty loginSession}">
								<!-- 로그인 : 로그아웃 -->
								<a href="/member/logout" id="logout">로그아웃</a>
							</c:when>
							<c:otherwise>
								<!-- 비로그인 : 회원가입 -->
								<a href="/member/toSignUp" id="signUp">회원가입</a>
							</c:otherwise>
						</c:choose>
					</div>
					<!-- ------------------------------ 반응형 끝 ------------------------------ -->
				</div> --%>

				<!-- ------------------------------ 비반응형 ------------------------------ -->
				<!-- -------------- Login -------------- -->
				<div class="d-none d-md-block col-3 d-flex justify-content-start p-0" style="margin-right: 1.9rem;">
					<!-- Button trigger modal -->
					<c:choose>
						<c:when test="${not empty loginSession}">
							<div class="welcomeBox" style="text-align:right;">
								<img class="letterImg" src="/resources/images/letter.png">
								${loginSession.nickname}<span>님 환영합니다!</span>
							</div>
						</c:when>
						<c:otherwise>
							<div class="login-Part" style="text-align:right;">
								<a href="#login" data-bs-toggle="modal" data-bs-target="#login" >
									로그인 </a>
							</div>	
						</c:otherwise>
					</c:choose>

					<!-- Modal -->
					<div class="modal fade" id="login" tabindex="-1"
						aria-labelledby="exampleModalLabel" aria-hidden="true">
						<div class="modal-dialog modal-lg modal-dialog-center">
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
												<input class="form-check-input" type="checkbox"
													id="rememberId">&nbsp아이디 기억하기
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
										<form action="/member/toKakaoSignUp" method="post">
											<input type="hidden" id="emailForKakao" value="" name="email">
										</form>
									</div>

								</div>

							</div>
						</div>
					</div>
				</div>
				<!-- -------------- myBook -------------- -->
				<div
					class="d-none d-md-block col-1 d-flex justify-content-start p-0">
					<c:choose>
						<c:when test="${not empty loginSession}">
							<a href="/member/toMyinfo" id="myBookBtn">MyBook</a>
						</c:when>
						<c:otherwise>
							<a href="#login" id="myBookBtn" data-bs-toggle="modal"
								data-bs-target="#login">MyBook</a>
						</c:otherwise>
					</c:choose>
				</div>
				<!-- -------------- SignUp/LogOut -------------- -->
				<div
					class="d-none d-md-block col-1 d-flex justify-content-start p-0">
					<c:choose>
						<c:when test="${not empty loginSession}">
							<a href="/member/logout" id="logout">로그아웃</a>
						</c:when>
						<c:otherwise>
							<a href="/member/toSignUp" id="signUp">회원가입</a>
						</c:otherwise>
					</c:choose>
				</div>
				<!-- -------------- Search -------------- -->
				<form action="/search" method="get" id="searchForm">
				<div
					class="d-none d-md-block col-2 d-flex justify-content-between p-0">
					<input type="text" class="underlineSearch" name="text"> <img
						src="https://s3.ap-northeast-2.amazonaws.com/cdn.wecode.co.kr/icon/search.png"
						id="searchIcon">
				</div>
				</form>
			</div>
		</div>

		<!-- -------------- Logo, nav 영역 -------------- -->

		<div class="navBox-nonType row d-none d-md-inline-flex justify-content-between align-items-end">
			<!-- ***** 비반응형 : Logo ***** -->
			<div class="col-4 p-0 d-flex justify-content-center">
				<div class="logo 	">
					<img src="/resources/images/like.png" style="width: 7rem;">
				</div>
			</div>

			<!-- -------------- 비반응형 : Blank -------------- -->
			<div class="col-8 p-0 ">
				<div class="row justify-content-end">
					<ul class="nav menuBox justify-content-end p-0">
						<!--  ---------- 관리자 아이디로 로그인 시 Admin 드롭버튼 보이기 -------- -->
						<c:choose>
							<c:when test="${loginSession.admin eq 'Y'}">
								<li class="nav-item dropdown">
									<button class="dropbtn">Admin</button>
									<div class="dropdown-content">
										<a href="/manager/toAllmember">전체회원</a>
										<a href="manager/toblacklist">블랙리스트</a>
										<a href="/manager/toAllclub">전체모임</a>
										<a href="/manager/toReview">리뷰관리</a>
										<a href="/manager/toReport">신고</a>
								   </div>
								</li>
							</c:when>
						</c:choose>
						<!-- 관리자 로그인 시 끝  -->
						<li class="nav-item">
							<a href="/toIntroduce">
								<button	class="dropbtn">Intro</button>
							</a>
						</li>
						<li class="nav-item dropdown">
							<button class="dropbtn" id="">&nbspBook&nbsp</button>
							<div class="dropdown-content">
								<a href="/books/arrivals">신간도서</a> <a href="/books/bestseller">베스트셀러</a>
								<a href="/review/board">도서리뷰</a>
							</div>
						</li>
						<li class="nav-item dropdown">
							<button class="dropbtn">Club</button> 
							<div class="dropdown-content">
								<c:if test="${empty loginSession}">
										<a href="/club/toClub">모집 중인 클럽</a>
								</c:if> 
								<c:if test="${not empty loginSession}">
										<a href="/club/toClubList">모집 중인 클럽</a>
								</c:if> 
								<c:choose>
									<c:when test="${not empty loginSession}">
										<c:if test="${not empty roleSession}">
											<a href="/club/clubBoard" id="btnClubBoard">내 클럽</a>
										</c:if>
										<c:if test="${empty roleSession}">
											<a id="btnClubBoard" id="btnClubBoard"
												onclick="alert('아직 클럽에 속해있지 않아요.')">내 클럽</a>
										</c:if>
									</c:when>
									<c:otherwise>
										<a href="#login" id="btnClubBoard" data-bs-toggle="modal"
											data-bs-target="#login">내 클럽</a>
									</c:otherwise>
								</c:choose> 
								<c:choose>
									<c:when test="${not empty loginSession}">
	
										<!-- 리더이면서 클럽이 모집중일 때 -->
										<c:if
											test="${roleSession.role == 'L' && clubSession.room_status == '모집중'}">
											<a href="/club/myclub?room_id=${roleSession.room_id}"
												id="btnMyclub">모집중인 클럽 관리</a>
										</c:if>
	
										<!-- 리더이면서 클럽이 진행중일 때 -->
										<c:if
											test="${roleSession.role == 'L' && clubSession.room_status == '진행중'}">
											<a href="/club/clubBoard" id="btnMyclub">진행 중인 클럽 관리</a>
										</c:if>
	
									</c:when>
									<c:otherwise>
										<!-- 게스트 상태일 때 -->
										<a href="#login" id="btnMyclub" data-bs-toggle="modal"
											data-bs-target="#login">클럽 관리</a>
									</c:otherwise>
								</c:choose>
							</div>
						</li>
						<li class="nav-item">
							<a href="/library/map">
								<button	class="dropbtn">Library</button>
							</a>
						</li>
					</ul>

		</div>
	</div>
	<div class="empty"></div>
			<script>
	
		/****************************************** 쪽지함 *****************************************/
		// 주기적인 수신 쪽지 확인
		$(document).ready(function(){
				
			console.log("로그인세션 : " + "${loginSession.email}");
			let loginSession = "${loginSession.email}";	
			
				setInterval(function(){
				if(loginSession != ""){
					
					$.ajax({
						url:"/member/readYn",
						type:"post",
						data:{"email":"${loginSession.email}"},
						success: function(data){
							
							if(data == 'Y'){// 쪽지를 다 읽은 상태 혹은 쪽지가 없을 때
								$(".letterImg").attr("src","/resources/images/letter.png");
							}else if(data == 'N'){//안읽은 쪽지가 있을 때
								console.log(data);
								$(".letterImg").attr("src","/resources/images/letter3.png");
							}
						},
						error: function(e){
							console.log(e);
						}	
					})
				}			
				},5000); // 5000 : 5초
			});

	/* 쪽지함 */
	$(".letterImg").on("click", function() {
		let url = "/member//toLetter";
		let name = "쪽지함";
		let option = "width=700, height=600, left=600, top=100";
		window.open(url, name, option);
	})

		/****************************************** 검색 버튼 *****************************************/
		$("#searchIcon").on("click", function(){
			
			if($("#underlineSearch").val() == ""){
				alert("검색어를 입력해주세요");
				$("#underlineSearch").focus;
				return false;
			}
			
			$("#searchForm").submit();
		})

		/****************************************** 아이디 기억하기 ************************************/
		// 아이디, 체크박스 영역 //
		$(document).ready(function() {
		
	         let key = getCookie("key");
	         $("#loginId").val(key);
	         
	         if($("#loginId").val() != "") { // 그 전에 ID를 저장해서 처음 페이지 로딩 시, 입력 칸에 저장된 ID가 표시된 상태라면,
	            $("#rememberId").attr("checked",true); //ID 저장하기를 체크상태로 두기
	         }
	         
	         $("#rememberId").change(function(){ //체크박스에 변화가 있다면
	            if($("#rememberId").is(":checked")){ //id저장하기 체크했을때
	               setCookie("key",$("#loginId").val(),30); //30일동안 쿠키 저장
	            }else{
	               deleteCookie("key");
	            }
	
	         })
	         
	         // ID 저장하기를 체크한 상태에서 id를 입력하는 경우 , 이럴때도 쿠키 저장.
	         $("#loginId").keyup(function(){ //ID 입력칸에 ID를 입력할 때
	            if($("#rememberId").is(":checked")){ //ID 저장하기를 체크한 상태라면
	               setCookie("key", $("#loginId").val(),30); //30일동안 쿠기 보관
	            }
	         })
		});
		
		// 쿠키 영영 //
		// 쿠키 저장하기
		// setCookie => saveid함수에서 넘겨준 시간이 현재시간과 비교해서 쿠키를 생성하고 지워주는 역할
		function setCookie(cookieName, value, exdays){
		    var exdate = new Date();
		    exdate.setDate(exdate.getDate() + exdays);
		    var cookieValue = escape(value) + ((exdays==null) ? "" : "; expires=" + exdate.toGMTString());
		    document.cookie = cookieName + "=" + cookieValue;
		}
		// 쿠키 삭제
		function deleteCookie(cookieName){
		    var expireDate = new Date();
		    expireDate.setDate(expireDate.getDate() - 1);
		    document.cookie = cookieName + "= " + "; expires=" + expireDate.toGMTString();
		}
		// 쿠키 가져오기
		function getCookie(cookieName) {
		    cookieName = cookieName + '=';
		    var cookieData = document.cookie;
		    var start = cookieData.indexOf(cookieName);
		    var cookieValue = '';
		    if(start != -1){ // 쿠키가 존재한다면
		        start += cookieName.length;
		        var end = cookieData.indexOf(';', start);
		        if(end == -1)end = cookieData.length; // if(end == -1) -> 쿠키 값의 마지막 위치 인덱스 번호 설정
		        cookieValue = cookieData.substring(start, end);
		    }
		    return unescape(cookieValue);
		}
		/****************************************** 로그인 ******************************************/
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
					if (data == "blackList"){
						alert("블랙리스트 회원입니다. 관리자에게 문의해주세요.");
					} else if (data == "success") {
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
		
		/****************************************** 카카오 로그인 ******************************************/
		window.Kakao.init('e2d6408118d8e73e46ae000a50439ccb'); // 발급받은 키 중 javascript키를 사용해준다.
		console.log(Kakao.isInitialized()); // sdk초기화여부판단

		function kakaoLogin() {
			window.Kakao.Auth.login({
				 success: function(authObj){
					console.log(authObj);
					window.Kakao.API.request({
						url : '/v2/user/me'
						, success : res => {

							const kakao_token = res.id;
							
 							$.ajax({
		                        	type: "post",
		                       		url: '/member/kakaoLogin', // 로그인
		                      		data: { "email" : "kakao" + kakao_token },
		                      		dataType: "text",
		                        	success: function (data) {
		                            		if (data === "blackList"){ // 블랙리스트 체킹
		                            			alert("블랙리스트 회원입니다. 관리자에게 문의해주세요");	
		                            		}else if (data === "fail") { // 회원가입
			                               		console.log("성공!");
			                               		createHiddenSignupForm(kakao_token);
		                          			} else if (data === "success") { // 로그인
												console.log("success");
												location.href="/";
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
		
		// post로 개인정보 안보이게 HiddenForm으로 넘기기
		function createHiddenSignupForm(kakao_token) {
	        var frm = document.createElement('form');
	        frm.setAttribute('method', 'post');
	        frm.setAttribute('action', '/member/toKakaoSignUp');
	        var token = document.createElement('input');
	        token.setAttribute('type', 'hidden');
	        token.setAttribute('name', 'email');
	        token.setAttribute('value', "kakao" + kakao_token);
	        var phone = document.createElement('input');
	        phone.setAttribute('type', 'hidden');
	        phone.setAttribute('name', 'phone');
	        phone.setAttribute('value', kakao_token);
	        frm.append(token, phone);
	        document.body.append(frm);
	        frm.submit();
	    }
		
		
	</script>
</body>

</html>