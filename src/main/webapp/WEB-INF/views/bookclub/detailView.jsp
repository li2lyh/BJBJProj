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

.imgBox img{
	width:80%;
	height:80%;
}

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

#report_con{
    padding-top: 15px;
    padding-left: 30px;
}

#report_con2{
    padding-right: 33px;
}

#report_detail{
    width: 300px;
    height: 200px;
}

/* 빈 하트 */
#emptyLike{
	width: 30px;
	height: 25px;
}

/* 빨간 하트 */
#likeImg{
	width: 30px;
	height: 25px;
}

/* 하트 버튼 */
.heartBtn {
	border: none;
	background-color: white;
}

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
				
				<div class="row">
					<div class="col-6">
						<div id="titleDiv">
							<h3>${dto.room_title}</h3>
						</div>
					</div>
					<div class="col-6">
						<!-- checkLike : 해당 모임을 찜한건지 아닌거지 여부를 담아줄 변수 -->
						<c:set var="checkLike" value="false" />
						<!-- 찜 리스트를 반복문 돌리며 해당 모임이 찜한건지 아닌지 여부만 checkLike변수에 저장 -->
						<c:forEach items="${likeList}" var="like">
							<!-- 만약 찜한 모임이라면 checkLike에 true 값을 담아 줌.-->
							<c:if test="${like.room_id eq dto.room_id}">
								<c:set var="checkLike" value="true" />
							</c:if>
						</c:forEach>
						<div class="likeClub">
							<!-- 로그인 한 상태 -->
							<c:if test="${not empty loginSession}">
								<!-- 만약 checkLike가 트루라면 찜한 모임이니 빨간 하트 띄워주고 -->
								<c:if test="${checkLike}">
									<button type="button" class="heartBtn redHeartBtn" id="redHeartBtn">
										<input type="text" class="d-none" value="${dto.room_id}"> 
										<img id="likeImg" src="/resources/images/likee.png">
									</button>
								</c:if>
								<!-- 만약 checkLike가 펄스라면 찜한 모임이 아니니 빈 하트 띄워주고 -->
								<c:if test="${not checkLike}">
									<button type="button" class="heartBtn emptyHeartBtn" id="emptyHeartBtn">
										<input type="text" class="d-none" value="${dto.room_id}"> 
										<img id="emptyLike" src="/resources/images/emptyLike.png">
									</button>
								</c:if>
							</c:if>
						</div>
					</div>
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
		// 모임 찜 하기
	    $(".emptyHeartBtn").on("click",function(e) {
			let yn = confirm("선택한 모임을 찜 하시겠습니까?");
			console.log($(e.target).prev().val());
			if (yn) {
				console.log();
				 $.ajax({
					url : "/club/insertLike?room_id="+ $(e.target).prev().val()
					,type : "get"
					, success : function(data){
						if(data === "success"){
							if (confirm("해당 모임을 찜하셨습니다. 마이페이지로 이동하시겠습니까?")) {
		                        // 승낙하면 마이페이지의 찜하기 리스트로 이동
		                        location.href = "/member/toLikeclub";
	                        } else {
		                        // 거부하면 해당 페이지 새로고침하여 찜 반영
		                        location.reload();
	                        }
						} else {
							alert("에러가 발생하여 찜할 수 없습니다.")
						}
					}, error : function(e){
						console.log(e);
					}
				})
			}
		})
		
		// 찜한 모임 삭제하기
		$(".redHeartBtn").on("click",function(e) {
			let yn = confirm("찜한 모임을 삭제 하시겠습니까?");
			console.log($(e.target).prev().val());
			$.ajax({
				url : "/club/deleteLike?room_id="+ $(e.target).prev().val()
				,type : "get"
				, success : function(data){
					if(data === "success"){
						// 해당 페이지 새로고침하여 찜 반영
						location.reload();
					} else {
						alert("에러가 발생하여 삭제 할 수 없습니다.")
					}
				}, error : function(e){
					console.log(e);
				}
			})
		})
	
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