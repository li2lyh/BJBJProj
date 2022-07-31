<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet"	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<title>BookClub 모집</title>

<style>
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
}
.imgBox {
	padding: 30px;
}
.contentBox {
	padding: 30px;
	padding-left: 0;
}
#titleDiv {
	margin-bottom: 50px;
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
<<<<<<< HEAD
=======

>>>>>>> 6978c39d30bf637f86b6c6ad5f0d814c6c959b6f
.imgBox img{
	width:80%;
	height:80%;
}
<<<<<<< HEAD
#book_titleDiv{
margin-bottom: 20px;
}
#book_title_h{
font-weight:bold;
}
#reportForm{
	width: 600px;
}
.modal-footer{
    text-align: right;
}
=======

#book_titleDiv{
margin-bottom: 20px;
}

#book_title_h{
font-weight:bold;
}

#reportForm{
	width: 600px;
}

.modal-footer{
    text-align: right;
}

>>>>>>> 6978c39d30bf637f86b6c6ad5f0d814c6c959b6f
#report_con{
    padding-top: 15px;
    padding-left: 30px;
}
<<<<<<< HEAD
#report_con2{
    padding-right: 33px;
}
=======

#report_con2{
    padding-right: 33px;
}

>>>>>>> 6978c39d30bf637f86b6c6ad5f0d814c6c959b6f
#report_detail{
    width: 300px;
    height: 200px;
}
<<<<<<< HEAD
=======

>>>>>>> 6978c39d30bf637f86b6c6ad5f0d814c6c959b6f
</style>

</head>
<body>

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
			<div class="col-4 imgBox">
				<c:choose>
					<c:when test="${dto.book_cover eq null}">
						<img src="/resources/images/noImg.png" class="card-img-top">
					</c:when>
					<c:otherwise>
						<img src="${dto.book_cover}" class="card-img-top">
						
					</c:otherwise>
				</c:choose>
			</div>

			<div class="col-8 contentBox">

				<div id="titleDiv">
					<h3>${dto.room_title}</h3>
				</div>
	
			
				<div id="book_titleDiv">
					<h5 id="book_title_h">${dto.book_title}</h5>
				</div>
			
			
				<div>
					<h5>모집 인원 : ${dto.room_people} 명</h5>
				</div>

				<div>
					<h5>모임 기간 : ${dto.open_date} ~ ${dto.close_date}</h5>
				</div>

				<div>
					<h5>장소 : ${dto.place}</h5>
				</div>

				<div>
					<h5>참여 방식 : ${dto.tag}</h5>
				</div>

				<div id="meetDiv">
					<h5>참여 횟수 : 주 ${dto.meet_week} 회</h5>
				</div>

				<div>
					<textarea id="detail">${dto.room_detail}</textarea>

				</div>

			</div>

		</div>

		<div class="row">
			<div class="col btnBox">
				<button type="button" id="btnBack" class="btn btn-secondary">뒤로가기</button>

				<c:choose>
					<c:when test="${role.role == 'L' && role.room_id == dto.room_id}">
						<%-- 리더일 경우 --%>
						<button type="button" id="btnStatus" class="btn btn-primary">모집현황
							보기</button>
					</c:when>
					<c:when test="${role.role == 'C' && role.room_id == dto.room_id}">
						<button type="button" id="btnRecruit" class="btn btn-warning">지원하기</button>
						<button type="button" id="btnReport" class="btn btn-danger">신고</button>
					</c:when>
					<c:otherwise>
						<button type="button" id="btnlogin" class="btn btn-warning">지원하기</button>
					</c:otherwise>

				</c:choose>

			</div>
		</div>

	</div>
	
	<%-- 모임 신고하기 Modal --%>
	<form id="reportBookroomForm" action="/club/reportBookroom" method="post">
		<div class="modal" id="reportBookroomModal">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<h2 class="modal-title">신고하기</h2>
	                </div>
					<div class="row">
						<div class="modal-head col-4" id="report_con">
							<h3>신고사유</h3>
						</div>
						<div class="modal-body col-8" id="report_con2">
							<select class="form-select" name="report_content">
								<option value="불건전 모임">불건전 모임</option>
								<option value="모임장이 이상함">모임장이 이상함</option>
							</select>
						</div>
					</div>
					<div class="row">
						<div class="modal-head col-4" id="report_con">
							<h3>상세설명</h3>
						</div>
							<div class="modal-body col-8" id="report_con2">		
								<textarea id="report_detail" name="report_detail" placeholder="악의적인 신고는 불이익을 발생할 수 있습니다. 상세한 설명 부탁드립니다."></textarea>
							</div>
					</div>
	                <div class="modal-footer">
		                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal" id="btnReportBookroomCancel">신고취소</button>
	                    <button type="button" class="btn btn-primary" id="btnReportBookroomComplete">신고완료</button>
	                    <input type="hidden" id="room_id" name="room_id" value="${dto.room_id}">
	                    <input type="hidden" id="room_title" name="room_title" value="${dto.room_title}">
	                </div>		
				</div>
			</div>
		</div>
	</form>
	
	<%-- Modal --%>
	<form id="mydescForm" action="/club/recruit" method="post">
		<div class="modal" tabindex="-1">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title">
							리더에게 보낼 간단한 지원동기를 작성해주세요<br>( 10자 이상, XX자 이하 )
						</h5>
						<button type="button" class="btn-close" data-bs-dismiss="modal"
							aria-label="Close"></button>
					</div>
					<div class="modal-body">
						<textarea id="mydesc" name="mydesc"></textarea>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary"
							data-bs-dismiss="modal" id="btnCancel">취소</button>
						<button type="button" class="btn btn-primary" id="btnComplete">지원완료</button>
						<input type="hidden" id="room_id" name="room_id"
							value="${dto.room_id}">
					</div>
				</div>
			</div>
		</div>
	</form>

	<script>
		<%-- --------- 모임 신고하기 Modal ---------- --%>
		$("#btnReport").on("click", function() {
			$("#reportBookroomModal").show();
				//취소버튼
				$("#btnReportBookroomCancel").on("click", function() {
					$("#reportBookroomModal").hide();
				})
				//제출버튼
				$("#btnReportBookroomComplete").on("click", function() {
					alert("신고되었습니다.");
					$("#reportBookroomForm").submit();
				})
		})
		
		// 비로그인 상황에서 지원하기 로그인 하라는 알람뜨기
		$("#btnlogin").on("click", function(){
			alert("로그인을 해주세요");
		})
		
		//뒤로가기
		$("#btnBack").on("click", function() {
			location.href = "/club/toClub";
		})
		//신청하기
		$("#btnRecruit").on("click", function() {
			var con = confirm("해당 모임을 지원하시겠습니까?");
			if (con) {
	<%-- --------- Modal ---------- --%>
		$(".modal").show();
				$("#mydesc").focus();
				//취소버튼
				$("#btnCancel").on("click", function() {
					$(".modal").hide();
				})
				//제출버튼
				$("#btnComplete").on("click", function() {
					// 글자 크기 제한 정규식 (10자 이상 XX자 이하)
					//자기소개 제출
					alert("해당 모임에 지원했습니다. 리더가 승인 할 때까지 기다려주세요!");
					$("#mydescForm").submit();
				})
			}
		})
		// 리더가 모집현황 보기 버튼 클릭 시
		$("#btnStatus").on("click", function() {
			location.href = "/club/myclub?room_id="+${dto.room_id};
		})
	</script>

</body>
</html>