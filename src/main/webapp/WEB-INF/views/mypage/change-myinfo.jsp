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

.modalBtn{
	width: 150px;
}

#modifyBtn{
	width: 150px;
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
			<div class="row">
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
						<div class="col-md-8">
							<input type="text" class="form-control" id="nickname" name="nickname" value="${dto.nickname}" readonly>
							<div class="invalid-feedback">닉네임은 2~6자 이내로 입력해주세요. <br>(영어 대소문자, 한글, 숫자만 입력)</div>
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
							<textarea class="form-control" id="mydesc" name="mydesc" rows="5" readonly>${dto.mydesc}</textarea>
						</div>
					</div>
					<div class="row p-2">
						<div class="col-9 col-sm-7">
							<!-- Button trigger modal -->
							<button type="button" class="btn btn-danger modalBtn" data-bs-toggle="modal" data-bs-target="#exampleModal"> 회원탈퇴</button>
	
							<!-- Modal -->
							<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
								<div class="modal-dialog">
									<div class="modal-content">
										<div class="modal-header">
											<div class="col-11 d-flex justify-content-center">
												<h4 class="modal-title fw-semibold" id="exampleModalLabel">***회원탈퇴***</h4>
											</div>
											<div class="col-1 d-flex justify-content-center">
												<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
											</div>
										</div>
										<div class="modal-body">
											<div class="row text-center">
												<c:choose>
													<c:when test="${loginSession.user_kakao eq 'Y'}">
														<%-- 카카오 회원이라면 문구로 탈퇴 --%>
														<p>
															탈퇴 시 계정 복구는 불가능합니다.<br> 
															또한 모든 데이터는 삭제됩니다.<br> 
															정말 탈퇴 하시려면 아래 문구를 입력해주세요.
														</p>
													</c:when>
													<c:otherwise>
														<%-- 일반 회원이라면 비밀번호로 탈퇴 --%>
														<p>
															탈퇴 시 계정 복구는 불가능합니다.<br> 
															또한 모든 데이터는 삭제됩니다.<br> 
															정말 탈퇴 하시려면 비밀번호를 입력해주세요.
														</p>
													</c:otherwise>
												</c:choose>													
											</div>
											<div class="row p-2">
												<c:choose>
													<c:when test="${loginSession.user_kakao eq 'Y'}">
														<%-- 카카오 회원이라면 문구로 탈퇴 --%>
														<div class="col-12">
															<p class="text-center">내용을 모두 확인했으며, 회원탈퇴에 동의합니다.</p>
														</div>
														<div class="col-12">
															<input type="text" class="form-control" id="inputKakao">
														</div>
													</c:when>
													<c:otherwise>
														<%-- 일반 회원이라면 비밀번호로 탈퇴 --%>
														<div class="col-4">
															<label>비밀번호</label>
														</div>
														<div class="col-8">
															<input type="password" class="form-control" id="deletePW">
														</div>
													</c:otherwise>
												</c:choose>															
											</div>
										</div>
										<div class="modal-footer">
											<button type="button" class="btn btn-secondary" data-bs-dismiss="modal" id="noBtn">취소</button>
											<c:choose>
												<c:when test="${loginSession.user_kakao eq 'Y'}">
													<%-- 카카오 회원이라면 문구로 탈퇴 --%>
													<button type="button" class="btn btn-danger" id="deleteKakaoBtn">탈퇴</button>
												</c:when>
												<c:otherwise>
													<%-- 일반 회원이라면 비밀번호로 탈퇴 --%>
													<button type="button" class="btn btn-danger" id="deleteBtn">탈퇴</button>
												</c:otherwise>
											</c:choose>					
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="col-3 col-sm-5 d-flex justify-content-end">
							<button type="button" class="btn btn-secondary" id="modifyBtn">수정</button>
						</div>
					</div>
				</div>
			</div>
		</div>
		
		<!-- footer -->
		<div class="footer">
			<jsp:include page="/WEB-INF/views/frame/footer.jsp"></jsp:include>
		</div>
	</div>

	<script>
		// 카카오 탈퇴 버튼 클릭시
		$("#deleteKakaoBtn").click(function() {
			let kakao = $("#inputKakao").val();
			if(kakao == "내용을 모두 확인했으며, 회원탈퇴에 동의합니다."){
				$.ajax({
					url : "/member/toDelete",
					type : "post",
					data : {
						email : $("#email").val(),
						password : $("#password").val()
					},
					success : function(data) {
						if (data == "success") {
							location.href = "/";
						}
					},
					error : function(e) {
						console.log(e);
					}
				})
			} else{
				alert("문구가 일치하지 않습니다.");
			}
		})
	
		// 일반 탈퇴 버튼 클릭시
		$("#deleteBtn").click(function() {
			$.ajax({
				url : "/member/toDelete",
				type : "post",
				data : {
					email : $("#email").val(),
					password : $("#deletePW").val()
				},
				success : function(data) {
					if (data == "success") {
						location.href = "/";
					} else if (data == "fail") {
						alert("비밀번호가 일치하지 않습니다.");
						$("#deletePW").val("");
					}
				},
				error : function(e) {
					console.log(e);
				}
			})
		})

		// 모달 취소 버튼 클릭시
		$("#noBtn").click(function() {
			$("#deletePW").val("");
		})

		// 수정 버튼 클릭시
		$("#modifyBtn").click(function() {
			location.href = "/member/toModify";
		})
	</script>
</body>

</html>