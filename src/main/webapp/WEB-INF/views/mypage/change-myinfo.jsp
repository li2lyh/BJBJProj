<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
/* Contents */
/* 메뉴 */
a {
	color: black;
	text-decoration: none;
}

a:hover {
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

.dropdown-menu {
	border: none;
}

.dropdown-item:hover {
	background-color: white;
}

/* 정보 수정 */
textarea {
    resize: none;
}

#deleteBtn{
	width: 50%;
}
</style>
</head>

<body>
	<!-- Contents -->
	<div class="container m-auto">
		<div class="row border-bottom border-dark">
			<h2>MyBook</h2>
		</div>
		<div class="row d-flex">
			<!-- 메뉴 -->
			<div class="col-4 p-4">
				<div class="row p-2">
					<a href="/member/toChange">
						<div>내 정보 수정</div>
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
						<a class="list nav-link dropdown-toggle p-0" id="navbarDarkDropdownMenuLink" role="button" data-bs-toggle="dropdown" aria-expanded="false"> 찜 목록 </a>
						<div class="dropdown-menu" aria-labelledby="navbarDarkDropdownMenuLink">
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
			<div class="col-8 p-4">
				<form id="" action="" method="post">
					<div class="row p-2">
						<div class="col-4">
							<label>아이디</label>
						</div>
						<div class="col-8">
							<input type="text" class="form-control" id="email" name="email" value="${loginSession.email}" readonly>
						</div>
					</div>
					<div class="row p-2">
						<div class="col-4">
							<label>이름</label>
						</div>
						<div class="col-8">
							<input type="text" class="form-control" id="name" name="name" value="${loginSession.name}" readonly>
						</div>
					</div>
					<div class="row p-2">
						<div class="col-4">
							<label>닉네임</label>
						</div>
						<div class="col-8">
							<input type="text" class="form-control" id="nickname" name="nickname" value="${loginSession.nickname}" readonly>
						</div>
					</div>
					<div class="row p-2">
						<div class="col-4">
							<label>비밀번호</label>
						</div>
						<div class="col-8">
							<input type="password" class="form-control" id="pw" name="pw" value="${loginSession.pw}" readonly>
						</div>
					</div>
					<div class="row p-2">
						<div class="col-4">
							<label>비밀번호확인</label>
						</div>
						<div class="col-8">
							<input type="password" class="form-control" id="pwCheck" name="pwCheck" value="${loginSession.pw}" readonly>
						</div>
					</div>
					<div class="row p-2">
						<div class="col-4">
							<label>휴대폰번호</label>
						</div>
						<div class="col-8">
							<input type="text" class="form-control" id="phone" name="phone" value="${loginSession.phone}" readonly>
						</div>
					</div>
					<div class="row p-2">
						<div class="col-4">
							<label>자기소개</label>
						</div>
						<div class="col-8">
							<textarea class="form-control" id="mydesc" name="mydesc" rows="5" readonly>${loginSession.mydesc}</textarea>
						</div>
					</div>
					<div class="row p-2">
						<div class="col-8 col-sm-6">
							<button type="button" class="btn btn-secondary" id="deleteBtn">회원탈퇴</button>
						</div>
						<div class="col-2 col-sm-3 d-flex justify-content-end">
							<button type="button" class="btn btn-secondary w-100 d-none" id="cancelBtn">취소</button>
						</div>
						<div class="col-2 col-sm-3 d-flex justify-content-start">
							<button type="button" class="btn btn-secondary w-100" id="modifyBtn">수정</button>
							<button type="button" class="btn btn-secondary w-100 d-none" id="completeBtn">완료</button>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
	
	<script>
		// 탈퇴
		$("#deleteBtn").click(function(){
			location.href = "/member/toDelete";
		})
		
		// 취소 버튼 클릭시
		$("#cancelBtn").click(function(){
			$("#nickname").attr("readonly", true);
			$("#pw").attr("readonly", true);
			$("#pwCheck").attr("readonly", true);
			$("#mydesc").attr("readonly", true);
			$("#modifyBtn").removeClass("d-none");
			$("#completeBtn").addClass("d-none");
			$("#cancelBtn").addClass("d-none");
		})
		
		// 수정 버튼 클릭시
		$("#modifyBtn").click(function(){
			$("#nickname").attr("readonly", false);
			$("#pw").attr("readonly", false);
			$("#pwCheck").attr("readonly", false);
			$("#mydesc").attr("readonly", false);
			$("#modifyBtn").addClass("d-none");
			$("#completeBtn").removeClass("d-none");
			$("#cancelBtn").removeClass("d-none");
		})
		
		// 완료 버튼 클릭시
		$("#completeBtn").click(function(){
			location.href = "/member/toModify";
		})
	</script>
</body>

</html>