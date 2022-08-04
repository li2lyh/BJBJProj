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
/* 버튼 */
.boxSize{
	height: 50px;
}
.btnBox {
	text-align: right;
	padding-left: 0px;
	padding-right: 0px;
	
}
#btnBack{
	margin: 0px;
	width: 120px;
}
#btnMyclub{
	margin: 0px;
	width: 134px;
}
#btnReport{
	margin: 0px;
	width: 120px;
}
#btnRecruit{
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
#book_titleDiv{
margin-bottom: 0px;
}
#book_title_h{
font-weight:bold;
}
/* 모달 */
#reportForm{
	width: 600px;
}
.modal-footer{
	padding-top: 6px;
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
    height: 150px;
    resize: none;
}
/* 빈 하트 */
#emptyLike{
	width: 50px;
	height: 40px;
	margin-left: 300px;
}

/* 빨간 하트 */
#likeImg{
	width: 50px;
	height: 40px;
	margin-left: 300px;
}

/* 하트 버튼 */
.heartBtn {
	border: none;
	background-color: white;
}
.likeClub{
	padding-top: 11px;
}

.footer{
	border-top: 1px solid lightgray;
}
</style>

</head>
<body>

	<div class="container">
	
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
				
				<div class="row">
					<div class="col-6">
						<div id="titleDiv">
							<h1>${dto.room_title}</h1>
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
					<textarea readonly id="detail">${dto.room_detail}</textarea>

				</div>

			</div>

		</div>

		<div class="row boxSize">
			<div class="col btnBox">
				<button type="button" id="btnBack" class="btn btn-secondary">뒤로가기</button>
		
		<!-- 유저 상태에 따른 버튼 로직  
		 1. 리더일 경우 : 모집 현황 보기
		 2. 해당 모임의 모임원일 경우 : 내 클럽 보기
		 3. 현재 모임에 신청했을 경우 : 지원취소
		 4. 이미 다른 모임에 지원했을 경우(waiting) : 지원하기 -> alert 이미 다른 모임에 지원중입니다. 
		 5. 다른 모임의 모임원일 경우(role) : 버튼X
		 6. default : 지원하기 -> no waiting, no role
		 -->
			
						<%-- 해당 모임 리더 --%>
						<c:if test="${role.role == 'L' && role.room_id == dto.room_id}">
						<button type="button" id="btnStatus" class="btn btn-primary">모집현황 보기</button>
						</c:if>
						<%-- 해당 모임의 모집원일 경우 --%>
						<c:if test="${role.role == 'C' && role.room_id == dto.room_id}">
						<button type="button" id="btnMyclub" class="btn btn-primary">내 클럽 게시판</button>
						<button type="button" id="btnReport" class="btn btn-danger">신고</button>
						</c:if>
						<%-- 해당 모임에 신청대기인 상태 --%>
						<c:if test="${waiting.room_id == dto.room_id}">
						<button type="button" id="btnClubCancel" class="btn btn-secondary">지원 취소</button>
						<button type="button" id="btnReport" class="btn btn-danger">신고</button>
						</c:if>
						<%--  다른 모임의 모임원일 경우 --%>
						<c:if test="${role.room_id != dto.room_id && not empty role}">
						<%-- <button type="button" id=btnMyclub class="btn btn-primary">내 클럽 게시판</button> --%>
						<button type="button" id="btnReport" class="btn btn-danger">신고</button> 
						</c:if> 
						<%-- 다른 모임에 지원한 상태일 경우 --%>
						<c:if test="${waiting.room_id != dto.room_id && empty role && not empty waiting}">
						<button type="button" id="btnMyDetail" class="btn btn-primary"> 지원한 모임으로 </button>
						<button type="button" id="btnReport" class="btn btn-danger">신고</button>
						</c:if>
						<%-- Default --%>
						<c:if test="${empty waiting && empty role}">
						<button type="button" id="btnRecruit" class="btn btn-warning">지원하기</button>
						<button type="button" id="btnReport" class="btn btn-danger">신고</button>
						</c:if>
			</div>
		</div>

<div class=footer>
		<jsp:include page="/WEB-INF/views/frame/footer.jsp"></jsp:include>
	</div>


	</div>
	
	<%-- 모임 신고하기 Modal --%>
	<form id="reportBookroomForm" action="/club/reportBookroom" method="post">
		<div class="modal" id="reportBookroomModal">
			<div class="modal-dialog">
				<div class="modal-content" style="height: 402px;">
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
	                <div class="modal-footer" style="padding-top: 6px;">
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
		<div class="modal" tabindex="-1" id="recruitModal">
			<div class="modal-dialog">
				<div class="modal-content" style="height: 402px;">
					<div class="modal-header">
						<h5 class="modal-title">
							리더에게 보낼 간단한 지원동기를 작성해주세요<br>( 10자 이상, 300자 이하 )
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
			location.href = "/club/toClubList";
		})
		//신청하기
		$("#btnRecruit").on("click", function() {
			var con = confirm("해당 모임을 지원하시겠습니까?");
			if (con) {
	<%-- --------- Modal ---------- --%>
		$("#recruitModal").show();
				$("#mydesc").focus();
				//취소버튼
				$("#btnCancel").on("click", function() {
					$(".modal").hide();
				})
				//제출버튼
				$("#btnComplete").on("click", function() {

					// 글자 크기 제한 정규식
					var word = /^.{10,300}$/ //모든 글자 10글자이상 300글자 이하
					if(!word.test($("#mydesc").val())){
						alert("글자 수를 확인해주세요.");
						$("#mydesc").focus();
						return false;
					}
					//자기소개 제출
					alert("해당 모임에 지원했습니다. 리더가 승인 할 때까지 기다려주세요!");
					$("#mydescForm").submit();
				})
			}
		})

		// 리더가 모집현황 보기 버튼 클릭
		$("#btnStatus").on("click", function() {
			location.href = "/club/myclub?room_id="+'${dto.room_id}';
		})
		
		// 내 클럽 게시판 버튼
		$("#btnMyclub").on("click", function(){
			console.log(12345);
			location.href = "/club/clubBoard";
		})
		
		// 지원 취소 버튼
		$("#btnClubCancel").on("click", function(){
			let con = confirm("해당 모임의 지원을 취소하시겠습니까?");
			if(con){
				alert("지원 취소 되었습니다.");
				location.href = "/club/cancelRecruit";
			}
		})
		// 지원한 모임 detailView로
		$("#btnMyDetail").on("click", function(){
			location.href = "/club/detailView?room_id="+'${waiting.room_id}';
		})
		
		
		
		
		
	</script>

</body>
</html>