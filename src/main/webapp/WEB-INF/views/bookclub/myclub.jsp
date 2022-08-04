<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<title>BookClub 모집</title>

<style>
#head {
	border-bottom: 1px solid lightgray;
	text-align: left;
}
h4 {
	text-align: left;
}
/* 버튼 */
.btnBox {
	text-align: right;
}
#btnBack{
	margin: 0px;
	width: 120px;
}
#delete{
	margin: 0px;
	width: 120px;
}
/* 책 이미지 */
.imgBox {
	padding: 0px;
}
.imgBox img{
	width:80%;
	height:80%;
}
/* 콘텐츠 */
.contentBox {
	padding: 0px;
}
#titleDiv {
	margin-bottom: 20px;
}
#meetDiv {
	margin-bottom: 10px;
}
#detail {
	width: 100%;
	height: 140px;
	resize: none;
	font-size: 20px;
}
textarea {
	resize: none;
}
#mydesc {
	width: 100%;
	border: none;
}
/* 콘텐츠 - 모임명 */
#room_title {
	height: 50px;
	font-size: larger;
	font-weight: 700;
}
/* 콘텐츠 - 모집인원 */
#recruit{
	height: 32px;
}
#room_current{
	padding-right: 0px;
	margin-top: -3px;
	width: 30px;
}
#slashBox{
	width: 30px;
	margin-top: -3px;
	margin-left: -10px;
}
#peopleBox{
	width: 30px;
	margin-top: -3px;
	margin-left: -10px;
}
#num{
	width: 30px;
	margin-top: 1px;
	margin-left: -10px;
}
/* 모임기간 */
#open_date {
	margin-left: 0px;
	margin-right: 0px;
}
/* 참여 횟수 */
#part{
	height: 40px;
}
/* 신청인원 테이블 */
#app{
	border-bottom: 1px solid lightgray;
}
table, td, th {
	border-collapse: collapse;
	border-bottom: 1px solid lightgray;
}
td, th {
	padding: 10px;
}
/* 책 이미지 */
.imgBox img{
	width:80%;
	height:80%;
}
/* 소개글 보기 모달 */
.modal {
	position: fixed;
	top: 100%;
	left: 50%;
	transform: translate(-50%, -50%);
}
</style>

</head>
<body>
	<form action="/club/modify" id="modifyForm" method="post"
		enctype="multipart/form-data">
		<div class="container">
	<%-- *************************** header *************************** --%>
		<div class="header">
			<jsp:include page="/WEB-INF/views/frame/header.jsp"></jsp:include>
		</div>
		
		
			<div class="row">
				<div class="col">
					<h3 id="head">BookClub</h3>
				</div>
			</div>

			<div class="row">
				<div class="col">
					<h4>MyClub</h4>
				</div>
				<div class="col btnBox">
					<button type="button" id="btnBack" class="btn btn-secondary">뒤로가기</button>
				
				<c:if test="${dto.room_status == '모집중'}">	
					<button type="button" class="btn btn-danger" id="delete">삭제</button>
				</c:if>
				</div>
			</div>
			<div class="row">
				<div class="col-4 imgBox">
					<c:choose>
						<c:when test="${dto.book_cover eq null}">
							<center><img src="/resources/images/noImg.png" class="card-img-top"></center>
						</c:when>
						<c:otherwise>
							<center><img src="${dto.book_cover}" class="card-img-top"></center>
						</c:otherwise>
					</c:choose>
				</div>

				<div class="col-8 contentBox">
					<div id="titleDiv" class="row r1">
						<h1>${dto.room_title}</h1>
					</div>
					
					<div class="row">
						<div class="col-2" id="con">
							<h5>도서명 :</h5>
						</div>
						<div class="col-10" id="con">
							<h5>${dto.book_title}</h5>
						</div>
					</div>
					<div class="row" id="recruit">
						<div class="col-2" id="con">
							<h5>모집인원 :</h5>
						</div>
						<div class="col-1 currentBox"  id="room_current">
							<p class="room_current">${dto.room_current}
						</div>
						<div class="col-1 currentBox" id="slashBox">
							<p class="room_current">/</p>
						</div>
						<div class="col-2" id="peopleBox">
							<p id="room_people">${dto.room_people}</p>
						</div>
						<div class="col-1" id="num">
							<h5>명</h5>
						</div>
					</div>
					
					<div class="row">
						<div class="col-2" id="con">
							<h5>모임 기간 :</h5>
						</div>
						<div class="col-10 dateBox" id="con">
							<h5>${dto.open_date} ~ ${dto.close_date}</h5>
	
						</div>
					</div>
					<div class="row">
						<div class="col-2" id="con">
							<h5>장소 :</h5>
						</div>
						<div class="col-10" id="con">
							<h5>${dto.place} 지역</h5>
						</div>
					</div>

					<div class="row">
						<div class="col-2" id="con">
							<h5>참여 방식 :</h5>
						</div>
						<div class="col-10" id="con">
							<h5>${dto.tag}</h5>
						</div>
					</div>

					<div class="row">
						<div class="col-2" id="part">
							<h5>참여 횟수 :</h5>
						</div>
						<div class="col-10" id="con">
							<h5>주 ${dto.meet_week}회</h5>
						</div>

					</div>

					<div class="row">
						<textarea readonly id="detail">${dto.room_detail}</textarea>
					</div>
				</div>
			</div>	
			
			
			<div class="row" id="app">
				<h4>신청 인원</h4>
			</div>
			<div class="row">
				<table style="text-align: center;">
					<thead>
						<tr>
							<th scope="col" class="thTitle">이메일</th>
							<th scope="col" class="thTitle">닉네임</th>
							<th scope="col" class="thTitle">소개글</th>
							<th scope="col" class="thTitle">승인/거절</th>
						</tr>
					</thead>
					<tbody>
						
						
						<c:choose>
							<c:when test="${list.size() == 0}">
								<tr>
									<td colspan="6">신청한 회원이 없습니다.</td>
								</tr>
							</c:when>
							<c:otherwise>
								<c:forEach items="${list}" var="member">
									<tr>
										<td>${member.email}</td>
										<td>${member.nickname}</td>
										<td>
											<button type="button" class="btn btn-success btn-modal"
												data-toggle="modal" data-target="#myModal"
												data-id="${member.mydesc}" id="introduce">보기</button>

										</td>
										<td>
											<div class="col btnBox2">
												<button type="button" class="btn btn-success approve"
													id="approve" value="${member.email}">승인</button>
												<input type="hidden" value="${member.nickname}">
												<button type="button" class="btn btn-danger refuse"
													id="refuse" value="${member.email}">거절</button>
											</div>
										</td>
									</tr>

								</c:forEach>
							</c:otherwise>
						</c:choose>
					
					
					</tbody>
				</table>
			</div>
	<%-- *************************** footer *************************** --%>
	<div class=footer>
		<jsp:include page="/WEB-INF/views/frame/footer.jsp"></jsp:include>
	</div>
	
	
	
			<!-- 소개글 보기 modal -->
			<div class="modal" id="myModal" tabindex="-1">
				<div class="modal-dialog">
					<div class="modal-content" style="height: 402px;">
						<div class="modal-header">
							<h5 class="modal-title">소개글</h5>
						</div>
						<div class="modal-body">
							<p class="body-contents" id="text-contents"></p>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-secondary"
								data-bs-dismiss="modal" id="modalCancel">닫기</button>
						</div>
					</div>
				</div>
			</div>

		</div>
	</form>





	<script>
		

	
	
	<%-- $("input:radio[name:'tag'][value='${dto.tag}']").prop("checked",true);--%>
		
	<%-- 신청목록 시작 --%>
		//소개글 버튼 (Modal)
		$(".btn-modal").on("click", function() {
			$("#myModal").show();

			var data = $(this).data('id');
			$("#text-contents").html(data);

			$("#modalCancel").on("click", function() {
				$("#myModal").hide();
			})
		})

		// 승인, 거절 버튼
		//승인
		$(".approve").on(
				"click",
				function() {
					var email = $(this).val();
					var nickname = $(this).next().val();

					var con = confirm(nickname + " 님을 모임원으로 등록하시겠습니까?");
					if (con) {
						$.ajax({
							type : "post",
							url : "/club/approve",
							data : {
								'email' : email,
								'approve' : 'Y',
								'room_id' : '${dto.room_id}'
							},
							success : function(data) {

								console.log(data);

								if (data == "true") {
									alert(nickname + " 님을 수락하였습니다.");
									location.href="/club/myclub?room_id="+'${dto.room_id}';

								} else if (data == "false") {
									alert("오류발생");
								} else { // 인원 다 모았을 때
									
							// 해당 방에 신청했던 선택받지 못한 인원들 지원취소처리
							// 선택받지 못한 인원들에게 알림 (쪽지)
									
									alert("모든 인원이 모였습니다!");
									location.href = "/club/clubBoard?room_id="+'${dto.room_id}';
					
								}

							},
							error : function(e) {
								console.log(e);
							}
						})
					}

				})

		//거절
		$(".refuse").on("click", function() {
			var email = $(this).val();
			var nickname = $(this).prev().val();

			var con = confirm(nickname + " 님의 지원을 거절하시겠습니까?");
			if (con) {
				$.ajax({
					type : "post",
					url : "/club/approve",
					data : {
						'email' : email,
						'approve' : 'N',
						'room_id' : '${dto.room_id}'
					},
					success : function(data) {
						alert(nickname + " 님을 거절하였습니다.");
						location.href="/club/myclub?room_id="+'${dto.room_id}';
					},
					error : function(e) {
						console.log(e);
					}
				})
			}

		})
	<%-- 신청목록 끝 --%>
		// 뒤로가기
		$("#btnBack").on("click", function() {
			location.href = "/club/toClubList";
		})

		// 게시글 삭제
		$("#delete").on("click", function() {
			let con = confirm("이 클럽을 삭제하시겠습니까?");
			if (con) {

				$.ajax({
					type:"post",
					url : "/club/deleteBookroom",
					data:{"room_id":'${dto.room_id}'},
					success: function(data){
							alert("삭제가 완료되었습니다.");
							location.href = "/club/toClubList";
					},
					error: function(e){
						console.log(e);
					}
					
				})

			}
		})
		
		
		
		
		
	</script>
</body>
</html>