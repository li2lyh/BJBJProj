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
.r1 {
	margin-bottom: 10px;
}

#head {
	border-bottom: 1px solid lightgray;
	text-align: left;
}

h4 {
	text-align: left;
}

.btnBox {
	text-align: right;
	padding: 30px;
	padding-bottom: 0px;
}

.imgBox {
	padding: 30px;
}

.contentBox {
	padding: 20px;
	padding-left: 0;
}

#titleDiv {
	margin-bottom: 30px;
}

#meetDiv {
	margin-bottom: 30px;
}

#detail {
	width: 100%;
	height: 140px;
	border: none;
}

textarea {
	resize: none;
}

#mydesc {
	width: 100%;
	border: none;
}

table, td, th {
	border-collapse: collapse;
	border-bottom: 1px solid lightgray;
}

td, th {
	padding: 10px;
}

#tilde {
	font-size: 25px;
	margin: none;
}

#con {
	padding: 5px;
}

#con2 {
	padding: 8px;
}

#room_title {
	height: 50px;
	font-size: larger;
	font-weight: 700;
}

#open_date {
	margin-left: 0px;
	margin-right: 0px;
}

.modal {
	position: fixed;
	top: 100%;
	left: 50%;
	transform: translate(-50%, -50%);
}

.currentBox {
	text-align: center;
	padding: 0px;
}

.room_current {
	font-size: x-large;
}

#room_people {
	font-size: x-large;
}

#peopleBox {
	text-align: center;
	padding: 0px;
	width: 50px;
}

#slashBox {
	width: 20px;
}
</style>

</head>
<body>
	<form action="/club/modify" id="modifyForm" method="post"
		enctype="multipart/form-data">
		<div class="container">
			<div class="row">
				<div class="col">
					<h3 id="head">BookClub</h3>
				</div>
			</div>

			<div class="row">
				<div class="col">
					<h4>MyClub</h4>
				</div>
			</div>

			<div class="row">
				<div class="col btnBox">
					<button type="button" id="btnBack" class="btn btn-secondary">뒤로가기</button>

					<button type="button" id="btnModify" class="btn btn-primary">수정</button>
					<button type="submit" class="btn btn-primary d-none" id="complete">완료</button>
					<button type="button" class="btn btn-danger" id="delete">삭제</button>

				</div>
			</div>



			<div class="row">
				<div class="col-4 imgBox">
					<c:choose>
						<c:when test="${dto.img_id eq null}">
							<img src="/resources/images/noImg.png" class="card-img-top">
						</c:when>
						<c:otherwise>
							<img src="" class="card-img-top">
						</c:otherwise>
					</c:choose>
				</div>

				<div class="col-8 contentBox">
					<div id="titleDiv" class="row r1">
						<input type="text" class="form-control" id="room_title"
							name="room_title" value="${dto.room_title}" readonly>
					</div>

					<div class="row r1">
						<div class="col-2" id="con">
							<h5>인원 :</h5>
						</div>
						<div class="col-1 currentBox">
							<p class="room_current" id="room_current">${dto.room_current}
						</div>
						<div class="col-1 currentBox" id="slashBox">
							<p class="room_current">/</p>
						</div>
						<div class="col-2" id="selectPeople" style="display: none">

							<select class="form-select" id="room_people" name="room_people"
								style="width: 100px;" aria-label="Default select example"
								value="${dto.room_people}" disabled>
								<option value="3">3</option>
								<option value="4">4</option>
								<option value="5">5</option>
								<option value="6">6</option>
								<option value="7">7</option>
								<option value="8">8</option>
								<option value="9">9</option>
								<option value="10">10</option>
							</select>
						</div>
						<div class="col-2" id="peopleBox">
							<p id="room_people">${dto.room_people}</p>
						</div>

						<div class="col-1" id="con">
							<h5>명</h5>
						</div>
						<div>(수정 시 현재 인원보다 적게 설정하면 alert창 뜨고 return false) -> 구현완료 후
							지울예정</div>

					</div>

					<div class="row r1">
						<div class="col-2" id="con">
							<h5>모임 기간 :</h5>
						</div>
						<div class="col-4">
							<input type="text" id="open_date" class="form-control"
								name="open_date" style="width: 200px;" value="${dto.open_date}"
								readonly />

						</div>
						<div class="col-2" id="tilde" style="width: 60px;">~</div>
						<div class="col-4">
							<input type="text" id="close_date" class="form-control"
								name="close_date" style="width: 200px;"
								value="${dto.close_date}" readonly />
						</div>
					</div>

					<div>1. 최소 모임 기간 설정 2. close_date가 open_date보다 과거일 경우 alert 후
						return false</div>

					<div class="row r1">
						<div class="col-2" id="con">
							<h5>장소 :</h5>
						</div>
						<div class="col-10">
							<select class="form-select" id="place" name="place"
								style="width: 100px;" aria-label="Default select example"
								value="${dto.place}" disabled>
								<option value="서울">서울</option>
								<option value="경기">경기</option>
								<option value="대전">대전</option>
								<option value="부산">부산</option>
								<option value="기타">기타(모집 상세에 기입)</option>
							</select>
						</div>
					</div>

					<div class="row r1">
						<div class="col-2" id="con">
							<h5>참여 방식 :</h5>
						</div>
						<div class="col-10" id="con2">
							<div class="col radioBox" id="tag" value="${dto.tag}">
								<input type="radio" class="tag" name="tag" value="온라인" disabled>온라인
								<input type="radio" class="tag" name="tag" value="오프라인" disabled>오프라인
								<input type="radio" class="tag" name="tag" value="온/오프라인"
									disabled>온/오프라인
							</div>
						</div>
					</div>

					<div class="row r1">
						<div class="col-2" id="con">
							<h5>참여 횟수 :</h5>
						</div>
						<div class="col-10">
							<select class="form-select" id="meet_week" name="meet_week"
								style="width: 100px;" aria-label="Default select example"
								value="${dto.meet_week}" disabled>
								<option value="1">주 1회</option>
								<option value="2">주 2회</option>
								<option value="3">주 3회</option>
								<option value="4">주 4회</option>
								<option value="5">주 5회</option>
							</select>
						</div>

					</div>

					<div class="row r1">
						<div class="col">
							<textarea class="form-control" id="room_detail"
								name="room_detail" rows="5" value="${dto.room_detail}" readonly>${dto.room_detail}</textarea>
						</div>
					</div>

				</div>

			</div>
			<div class="row">
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

			<!-- 소개글 보기 modal -->
			<div class="modal" id="myModal" tabindex="-1">
				<div class="modal-dialog">
					<div class="modal-content">
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

									alert("모든 인원이 모였습니다!");
									location.href = "/club/clubBoard?room_id="+'${dto.room_id}';

									// 해당 방에 신청했던 선택받지 못한 인원들 지원취소처리

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
						'approve' : 'N'
					},
					success : function(data) {

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
			location.href = "/club/toClub";
		})

		// readonly 적용
		$("#tag").not(":selected").attr("disable", "disable");
		$("#meet_week").not(":selected").attr("disable", "disable");
		$("#place").not(":selected").attr("disable", "disable");
		$("#room_people").not(":selected").attr("disable", "disable");

		// 수정 버튼을 클릭했을 때
		$("#modify").on("click", function() {
			$("#modify").addClass("d-none");
			$("#complete").removeClass("d-none");
			$("#room_title").attr("readonly", false);
			$("#tag").not(":selected").attr("disable", "");
			$("#meet_week").not(":selected").attr("disable", "");
			$("#room_people").not(":selected").attr("disable", "");
			$("#place").not(":selected").attr("disable", "");
			$("#open_date").attr("readonly", false);
			$("#close_date").attr("readonly", false);
			$("#room_detail").attr("readonly", false);
		})

		$("#delete").on("click", function() {
			let answer = confirm("정말 삭제하시겠습니까?");
			if (answer) {
				let deleteForm = $("<form>").attr({
					"method" : "post",
					"action" : "/club/delete"
				}).css("display", "none");
			}
		})
	</script>
</body>
</html>