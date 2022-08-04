<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

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

<%-- fullcalender --%>
<link href='/resources/fullcalendar-5.11.0/lib/main.css' rel='stylesheet' />
<script src='/resources/fullcalendar-5.11.0/lib/main.js'></script>
<script src='/resources/fullcalendar-5.11.0/lib/locales-all.js'></script>

<title>BookClub 모집</title>

<style>
#head {
	border-bottom: 1px solid lightgray;
	text-align: left;
}
.titleA {
	border-bottom: 1px solid lightgray;
	text-align: left;
	margin-bottom: 3px;
	height: 30px;.
	text-align: center;
}
.titleB {
	border-bottom: 1px solid lightgray;
	text-align: left;
	margin-bottom: 10px;
	height: 30px;.
	text-align: center;
}
.titleC {
	border-bottom: 1px solid lightgray;
	text-align: left;
	margin-bottom: 3px;
	height: 30px;.
	text-align: center;
}
h4 {
	text-align: left;
}
.btnBox {
	text-align: right;
	padding-bottom: 30px;
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
	height: 250px;
}
#mydesc {
	width: 100%;
	border: none;
}
#btnCol{
	margin-top:5px;
	text-align:right;
}
/* 모임내 게시글 */	

.boardBox{
	border-bottom: 1px solid lightgray;
	padding-bottom: 10px;
	overflow-x: hidden;
	width:645px; 
	height:250px; 
	padding:10px 
	margin-right: 0px;
	margin-left: 0px;
}
.T1{
	margin-bottom:3px;
}
.T2{
	margin-bottom:3px;
	text-align: center;
}
.boardBox p{
	margin-bottom:0px;
}
.title{
	font-weight:600;
}
.title:hover{
	cursor:pointer;
}
#content{
	display:none;
}
/* 게시글 모달 */
#modalForm{
	width: 600px;
}
#modalWriting{
	text-align: left;
}
.modalTitleBox{
	width: 498px;
	height: 189px;
	margin-top: 20px;
	margin-left: 3px;
	margin-right: 0px;
}
#board_title{
	padding: 0px;
	width: 300px;
	margin-left: 5px;
}
#con1{
	text-align: center;
}
#con2{
	text-align: center;
}
#board_content{
	width: 300px;
    height:150px;
    resize: none;
}
#btnModify{
	display:none;
}
#btnDelete{
	display:none;
}
#btnModifyComplete{
	display:none;
}
<%-- calendar --%>
#calendar-container{
	margin-bottom:100px;
}

/*요일*/
.fc-col-header-cell-cushion {
	text-decoration: none;
	color: #000;
}
.fc-col-header-cell-cushion:hover {
	text-decoration: none;
	color:#000;
}
/*일자*/
.fc-daygrid-day-number{
	color: #000;
	font-size:1em;
	text-decoration: none;
}
.fc-daygrid-day-number:hover {
  	font-weight: 600;
}
a{
	text-decoration: none;
}
.modalTitleBox{
	margin-bottom: 20px;
}
.modal-body{
	padding:0px;
}
.modalWriting{
	text-align:right;
}
/* 신고하기 모달 */
#reportForm{
	width: 600px;
}
#report_con{
    padding-top: 15px;
    padding-left: 30px;
}
#report_con2{
    padding-right: 33px;
}
#report_content{
    width: 300px;
    height:150px;
    resize: none;
}
.modal-footer{
    text-align: right;
    padding-top: 6px;
}
/* 모임원 보여주는 테이블  */
.containerR{
	overflow: auto;
	height:215px
}
table{
	margin: 0px;
}
.td1{
	width: 1000px;
	text-align: center;
	padding-right: 200px;
	margin: 0px;
}
.td2{
	padding-left: 220px;
	margin: 0px;
}
#reportTextarea{
	width: 300px;
	height: 200px;
}
.memberReportBtn{
	width: 75px;
}
#emptyLine{
	border-bottom: 1px solid lightgray;
	text-align: left;
}

.footer{
	border-top: 1px solid lightgray;
}
.contents{
	height: 650px;
}
</style>

</head>
<body>

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

				<div id="titleDiv">
					<h1>${dto.room_title}</h1>
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

		<div class="row">
		
			<div class="col-6 contents">
				<div class="row">
					<div class="col">
						<h5 class="titleB">모임 일정</h5>
					</div>
				</div>
				<div class="row" id='calendar-container'>
				<div id='calendar'></div>
				</div>
				
			</div>
			
			<div class="col-6 contents">
				<div class="row">
					<div class="col-12">
						<h5 class="titleA">게시글</h5>
					</div>
				</div>
				<div class="row boardBox">
		
						<c:choose>
							<c:when test="${board.size() == ''}">
								<div class="col">
								<p>등록된 글이 없습니다.</p>
								</div>
							</c:when>
							<c:otherwise>
									
								<c:forEach items="${board}" var="board">								
									
							<input type="hidden" id="board_seq" name="board_seq" value="${board.board_seq}">
							
									<div class="col-5 T1">
									<p class="title">${board.board_title}</p>
									</div>
									<div class="col-4 T2">
									<p>${board.nickname}</p>
									</div>
									<div class="col-3 T2">
									<p>${board.board_date}</p>
									</div>
									
									<div id="content" class="content">
									<p>${board.board_content}</p>
									</div>
									
								</c:forEach>
							</c:otherwise>
						</c:choose>	
				</div>
				
				<div class="row" id="btnBox">
					<div class="col" id="btnCol">
						 <button type="button" id="btnWrite" class="btn btn-secondary">글쓰기</button>
					</div>
				</div>
				
				
				<div>
					<div class="row">
						<div class="col-12">
							<h5 class="titleC">모임원</h5>						
						</div>
					</div>
				</div>

				<%-- 모임원 부분--%>
				<div class="containerR">
					<table>
 
	                  <tbody>
	                     <c:forEach items = "${nickList}" var = "nick">
	                     <tr>
	                        <td class="td1">${nick.nickname}</td> <!-- 신고당하는 사람 -->
	                      
	                        <td class="td2">
	                           <c:choose>
	                              <c:when test= "${session.nickname ne nick.nickname}">
	                                 <input type="text" class="d-none" id="email" value="${nick.email}"> <!-- 신고당하는 사람 이메일 숨겨놓기-->
	                                 <button type="button" class="btn btn-danger memberReportBtn">신고</button>
	                              </c:when>
	                              <c:otherwise>
	                                 <button type="button" class="btn btn-danger memberReportBtn" disabled="disabled">신고</button>
	                              </c:otherwise>
	                           </c:choose>
	                        </td>
	                     </tr>
	                     </c:forEach>
	                  </tbody>
					</table>
				</div>
			</div>	
        <div class="row">
			<div class="col" id="emptyLine">
				
			</div>
		</div>
	</div>
	  	<%-- *************************** footer *************************** --%>
		<div class=footer>
			<jsp:include page="/WEB-INF/views/frame/footer.jsp"></jsp:include>
		</div>
	
	</div>	      
		<%-- 회원 신고하기 Modal --%>
		<form id="reportForm" action="/club/report" method="post">
			<div class="modal" id="reportModal">
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
								<select class="form-select" name="report_detail">
									<option value="불건전 회원">불건전 회원</option>
									<option value="회원이 이상함">회원이 이상함</option>
								</select>
							</div>
						</div>
						<div class="row">
							<div class="modal-head col-4" id="report_con">
								<h3>상세설명</h3>
							</div>
								<div class="modal-body col-8" id="report_con2">		
									<textarea id="report_content" name="report_content" placeholder="악의적인 신고는 불이익을 발생할 수 있습니다. 상세한 설명 부탁드립니다."></textarea>
								</div>
						</div>
						<input type="text" class="d-none" id="hiddenemail" name="email" value="email">
		                <div class="modal-footer" style="padding-top: 6px;">
			                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal" id="btnReportCancel">신고취소</button>
		                    <button type="button" class="btn btn-primary" id="btnReportComplete">신고완료</button>
		                </div>		
					</div>
				</div>
			</div>
		</form>	
	

	<%-- Modal --%>
	<form id="modalForm" action="/club/insertReport" method="post">	
		<div class="modal" id="boardModal" tabindex="-1">
		 	<div class="modal-dialog">
			    <div class="modal-content" style="height: 402px;">
			      <div class="modal-header">
			        <h2 id="modalHeadTitle">새 글 작성</h2>
			      </div>
			      
			      <div class="row modalTitleBox" style="margin-top: 20px; margin-left: 3px;	margin-right: 0px;">
			      	<div class="col-4 modalWriting" id="con" style="text-align: center;">
			      		<h3>제목</h3>
			      	</div>
			      	<div class="col-8" id="con2" style="text-align: center; padding-left: 0px; padding-right: 15px;">
			      		<input type="text" class="modal-title" id="board_title" name="board_title" placeholder="제목 입력">
			      	</div>
			      </div>
			      
			      <div class="modal-body">
			      	<div class="row modalContentBox">
			      		<div class="col-4 modalWriting" id="con" style="text-align: center;">
			      			<h3>내용</h3>
			      		</div>
			      		<div class="col-8" id="con2" style="text-align: center;">
			      			<textarea placeholder="내용 입력" class="board_content" id="board_content" name="board_content"></textarea>
			      		</div>
			      	</div>
			 
			      </div>
			      <div class="modal-footer" style="padding-top: 0px;">
			        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal" id="btnCancel">닫기</button>
			        <button type="button" class="btn btn-primary" id="btnComplete">완료</button>
			        <button type="button" class="btn btn-warning" id="btnModify"  value="">수정</button>
			        <button type="button" class="btn btn-success" id="btnModifyComplete" value="">수정완료</button>
			        <button type="button" class="btn btn-danger" id="btnDelete"  value="">삭제</button>
			      	<input type="hidden" id="board_no" name="board_seq" value="">
			      </div>
			    </div>
	 		</div>
		</div>
	</form>

<script>
	<%-- --------- 회원 신고하기 Modal ---------- --%>
   $(".memberReportBtn").on("click", function() {
      $("#reportModal").show();
      $("#hiddenemail").val($(this).prev().val());
      console.log(email);
         //취소버튼
         $("#btnReportCancel").on("click", function() {
            $("#reportModal").hide();
         })
         
         //제출버튼
         $("#btnReportComplete").on("click", function() {
            if($("#report_content").val() == ""){
               alert("상세설명을 입력하세요");
               $("#report_content").focus();
               return false;
            }
            
            alert("신고되었습니다.");
            $("#reportForm").submit();
            
         })
   })
	
	
		$("#btnWrite").on("click", function(){
			// 모든 버튼, input 초기화
			$("#board_title").val("");
			$(".board_content").val("");
			$("#btnModify").hide();
			$("#btnDelete").hide();
			$("#btnModifyComplete").hide();
			$("#btnComplete").show();
			
			$("#boardModal").show();
		})
		$("#btnCancel").on("click", function(){
			$("#boardModal").hide();
		})
		
		// 글쓰기 완료 시
		$("#btnComplete").on("click", function(){
			
			if($("#board_title").val() == ""){
				alert("제목을 입력하세요");
				$("#board_title").focus();
				return false;
			}else if($(".board_content").val() == ""){
				alert("내용을 입력하세요");
				$(".board_content").focus();
				return false;
			}
			
			$.ajax({
				url:"/club/writeBoard?room_id="+'${dto.room_id}'
			,	type:"post"		
			,	data:{'board_title':$("#board_title").val(), 'board_content':$(".board_content").val() }
			,	success: function(data){
				
				ajaxReload(data);
				// 비동기통신 후 게시글 제목 클릭 시 (모달)
				$(".title").on("click", function(){
					let board_seq = $(this).parent().prev().val(); // board_seq
					let content = $(this).parent().next().next().next().children().html(); // 내용
					<%-- $("#board_content").html($(this).parents(".boardBox").children().eq(4).html()); 이거 왜 안됨? --%>
					
					$("#board_no").val(board_seq);
					$("#btnDelete").val(board_seq);
					
					console.log("글번호 : " + board_seq);
					console.log("내용 : " + content);
					console.log("모달내용 : " + $(".board_content").val());
					
					let nickname = $(this).parent().next().children().html(); // 닉네임
					let sessionNickname = '${session.nickname}'; // 로그인세션 - 닉네임
					
					$("#modalHeadTitle").html( nickname  +" 님의 글");
					
					$("#board_title").val($(this).html());	
					
					$(".board_content").val(content); 
					
					console.log("모달내용2 : " + $(".board_content").val() );	
					
					$("#board_title").attr({"readonly":true}).css({"border":"none"});
					$("#board_content").attr({"readonly":true}).css({"border":"none"});
					
					// 완료버튼 숨기기
					$("#btnComplete").css({"display":"none"});
				
					// 본인 일 경우 수정, 삭제버튼 활성화
					if(sessionNickname == nickname){
						$("#btnModify").show();
						$("#btnDelete").show();
						
						$("#btnCancel").on("click", function(){
							$("#btnModify").hide();
							$("#btnDelete").hide();
						})
					}
					$("#boardModal").show();
	
					// 취소버튼 눌렀을 때 원상복구 (글쓰기 버튼에 영향 가지 않게)
					
					$("#btnCancel").on("click", function(){
						cancelLogic();
					})
				})
	
			}	
			,	error : function(e){
				console.log(e);
			}		
				
			})
		})
		
		// 게시글 제목 클릭 시 (모달)
		$(".title").on("click", function(){
			let board_seq = $(this).parent().prev().val(); // board_seq
			let content = $(this).parent().next().next().next().children().html(); // 내용 // 내용
			let nickname = $(this).parent().next().children().html(); // 닉네임
			let sessionNickname = '${session.nickname}'; // 로그인세션 - 닉네임
			
			$("#board_no").val(board_seq);
			$("#btnDelete").val(board_seq);
			
			$("#modalHeadTitle").html( nickname  +" 님의 글");
			
			$("#board_title").val( $(this).html() );	
			$(".board_content").val(content); 
			<%-- $("#board_content").html($(this).parents(".boardBox").children().eq(4).html()); 이거 왜 안됨? --%>
						
			$("#board_title").attr({"readonly":true}).css({"border":"none"});
			$(".board_content").attr({"readonly":true}).css({"border":"none"});
			
			// 완료버튼 숨기기
			$("#btnComplete").css({"display":"none"});
			$("#btnModify").hide();
			$("#btnDelete").hide();
			
			// 본인 일 경우 수정, 삭제버튼 활성화
			if(sessionNickname == nickname){
				$("#btnModify").show();
				$("#btnDelete").show();
				
				$("#btnCancel").on("click", function(){
					$("#btnModify").hide();
					$("#btnDelete").hide();
				})
			}
			$("#boardModal").show();
			
			// 취소버튼 눌렀을 때 원상복구 (글쓰기 버튼에 영향 가지 않게)
			$("#btnCancel").on("click", function(){
			
				cancelLogic();			
			})
			
		})
		
		// 게시물 수정 버튼
		$("#btnModify").on("click", function(){	
			console.log("target no : " + $(this).val());
			
			$("#board_title").attr({"readonly":false}).css({"border":""});
			$(".board_content").attr({"readonly":false}).css({"border":""});
			$("#board_title").focus();
			$("#btnModify").hide();
			$("#btnModifyComplete").show();
	
			// 수정 완료 시
			$("#btnModifyComplete").on("click", function(){
						
				if($("#board_title").val() == ""){
					alert("제목을 입력하세요");
					$("#board_title").focus();
					return false;
				}else if($(".board_content").val() == ""){
					alert("내용을 입력하세요");
					$(".board_content").focus();
					return false;
				}
				
					let title = $("#board_title").val();
					let content = $(".board_content").val();		
					
					$("#modalForm").attr({"action":"/club/modify"});
					$("#boardModal").hide();
					$("#modalForm").submit();
				
				$("#btnModifyComplete").hide();
			})
			
			// 취소 버튼
			$("#btnCancel").on("click", function(){
			
				$("#btnModifyComplete").hide();
			})
		
		})
		
	
		// 게시물 삭제 버튼
		$("#btnDelete").on("click", function(){
			console.log($(this).val());
			
			let con = confirm("이 게시글을 삭제하시겠습니까?");
			if(con){
				
				$.ajax({
					url:"/club/delete"
				,	type:"post"		
				,	data:{'board_seq':$(this).val()}
				,	success: function(data){
					ajaxReload(data);
					// 비동기통신 후 게시글 제목 클릭 시 (모달)
					$(".title").on("click", function(){
						let board_seq = $(this).parent().prev().val(); // board_seq
						let content = $(this).parent().next().next().next().children().html(); // 내용
						
						$("#board_no").val(board_seq);
						$("#btnDelete").val(board_seq);
						
						console.log("글번호 : " + board_seq);
						console.log("내용 : " + content);
						console.log("모달내용 : " + $(".board_content").val());
						
						let nickname = $(this).parent().next().children().html(); // 닉네임
						let sessionNickname = '${session.nickname}'; // 로그인세션 - 닉네임
						
						$("#modalHeadTitle").html( nickname  +" 님의 글");
						
						$("#board_title").val($(this).html());	
						
						$(".board_content").val(content); 
						
						console.log("모달내용2 : " + $(".board_content").val() );	
						
						$("#board_title").attr({"readonly":true}).css({"border":"none"});
						$("#board_content").attr({"readonly":true}).css({"border":"none"});
						
						// 완료버튼 숨기기
						$("#btnComplete").css({"display":"none"});
						// 수정, 삭제버튼 default 값으로
						$("#btnModify").hide();
						$("#btnDelete").hide();
						
						// 본인 일 경우 수정, 삭제버튼 활성화
						if(sessionNickname == nickname){
							$("#btnModify").show();
							$("#btnDelete").show();
							
							$("#btnCancel").on("click", function(){
								$("#btnModify").hide();
								$("#btnDelete").hide();
							})
						}
						$("#boardModal").show();
						
						// 취소버튼 눌렀을 때 원상복구 (글쓰기 버튼에 영향 가지 않게)
						$("#btnCancel").on("click", function(){
						
							cancelLogic();		
						})
						
					})
					
					alert("게시물이 삭제되었습니다.");
				}	
				,	error : function(e){
					console.log(e);
				}	
	
				})
				
			}	
			
		})
		
		function ajaxReload(data){
			
			$(".boardBox").empty();
			
			for(let dto of data){
				
				
				let board_seq = $("<input>").attr({"id":"board_seq", "name":"board_seq", "value":dto.board_seq}).css({"display":"none"});
				
				let titleDiv = $("<div>").attr({"class":"col-6 T1"});
				let titleP = $("<p>").attr({"class":"title"}).append(dto.board_title);
				titleDiv.append(titleP);
				
				let nicknameDiv = $("<div>").attr({"class":"col-2 T1"});
				let nicknameP = $("<p>").append(dto.nickname);
				nicknameDiv.append(nicknameP);
				
				let dateDiv = $("<div>").attr({"class":"col-3 T1"});
				let dateP = $("<p>").append(dto.board_date);
				dateDiv.append(dateP);	
				
				let contentDiv = $("<div>").attr({"class":"content","id":"content"}).css({"display":"none"});
				let contentP = $("<p>").append(dto.board_content);
				contentDiv.append(contentP);
				
				$(".boardBox").append(board_seq, titleDiv, nicknameDiv, dateDiv, contentDiv);			
			}
			
			$("#boardModal").hide();
			
		}
		
		function cancelLogic(){
			
				$("#modalHeadTitle").html("새 글 작성");
				
				$("#board_title").val("");	
				$(".board_content").html(""); 				
				$("#board_title").attr({"readonly":false}).css({"border":""});
				$(".board_content").attr({"readonly":false}).css({"border":""});
				
				$("#btnComplete").css({"display":""});
		
		}
		
		// 로그인된 계정이 리더 일 때 (일정 조정 가능)
		
		if('${role}'=='L'){	 
			 document.addEventListener('DOMContentLoaded', function() {
			
				 $(function() {
					var request = $.ajax({
						url: "/calendar/selectAll",
						method:"post",
						dataType:"json"		
					});
					 
					request.done(function (data) {
						console.log(data);
						var calendarEl = document.getElementById('calendar');
				        var calendar = new FullCalendar.Calendar(calendarEl, {
				        	
				        	headerToolbar: {
				                left: 'prev,next today',
				                center: 'title',
				                right: 'dayGridMonth'
				            },
				          locale : "ko",
				          timeZone:'local',
				          navLinks: true, // can click day/week names to navigate views
				          selectable: true,
				          selectMirror: true,   
				
				          select: function(arg) {
	   	  
				        	  var title = prompt('일정 추가');
				              if (title) {
		            
				            	  var insert = $.ajax({
				  					url: "/calendar/insertPlan",
				  					method:"post",
				  					dataType:"json",
				  					data:{"cal_title":title, "start_date": dateFormat(arg.start), "end_date":dateFormat(arg.end),"allday":arg.allDay}
				  			
				            	  });
				            	  insert.done(function(data) { 
				            	  })
				            	  calendar.addEvent({              
				            		  title: title,  
				            		  start: arg.start,
				            		  end: arg.end,
				            		  allDay: arg.allDay 
				            		  })
							
				            		  location.reload();
				              }
							  
				             // calendar.unselect()
				             
				          },
				          eventAdd: function(obj) { // 이벤트가 추가되면 발생하는 이벤트 
				        	  console.log(obj);       
				         	  
				         	alert("일정이 설정되었습니다!");      
				          },
				          // 수정
				          eventDrop: function (info){
	                          console.log(info);
	                          if(confirm("'"+ info.event.title +"' 일정을 수정하시겠습니까 ?")){
	                                
							 
	                          let id = info.event._def.publicId;
	                          let title = info.event._def.title;
	                          let start = info.event._instance.range.start;
	                          let end = info.event._instance.range.end;
	                          
	                          
	                          $(function updatePlan() {
	                              $.ajax({
	                                  url: "/calendar/updatePlan",
	                                  method: "post",
	                                  dataType: "json",
	                                  data: {"cal_id":id, "cal_title":title, "start_date":updateDateFormat(start), "end_date":updateDateFormat(end)}
	                                 
	                              })
	                          })
	                          }
	                        },
				        	//삭제 
				          eventClick: function(info) {
				              if (confirm('해당 일정을 삭제하시겠습니까?')) {
								 
				            	  let cal_id = info.event._def.publicId;
				            	
				            	  console.log("id : " + cal_id);
				            	  console.log("title : " + info.event.title);
				            	  console.log(info.event.start);
				            	  
				            	  
				            	  var deletePlan = $.ajax({
					  					url: "/calendar/deletePlan",
					  					method:"post",
					  					data:{"cal_id":cal_id}
				              });
				              deletePlan.done(function(data) {
				            	  })
				            	  info.event.remove()
				              }             	              
				          },
				          editable: true ,
				          dayMaxEvents: true,
				          events: data	 
				          
				          });
				        calendar.render();
				   	   }); 
						
					})
					
				 })	
			
			}else{
			
				 document.addEventListener('DOMContentLoaded', function() {
						
					 $(function() {
						var request = $.ajax({
							url: "/calendar/selectAll",
							method:"post",
							dataType:"json"		
						});
						 
						request.done(function (data) {
							//console.log(data);
							
							var calendarEl = document.getElementById('calendar');
					        var calendar = new FullCalendar.Calendar(calendarEl, {
					        	headerToolbar: {
					                left: 'prev,next today',
					                center: 'title',
					                right: 'dayGridMonth,timeGridWeek,timeGridDay'
					            },
					          timeZone:'local',
					          locale : "ko",
					          navLinks: true, // can click day/week names to navigate views
					          selectable: true,
					          selectMirror: true,   
					
					          select: function(arg) {
	 							 alert("일정조정은 리더권한입니다.");
					              calendar.unselect()
					          },
					          eventClick: function(arg) {
					        	  alert("일정조정은 리더권한입니다.");
					          },
					          editable: false ,
					          dayMaxEvents: true,
					          events: data
					          
					        	  
					        });
					        calendar.render();
					   	   }); 
							
						})
						
					 })	 
		} 
		
		function dateFormat(date) {
	        let month = date.getMonth() + 1;
	        let day = date.getDate();
	        let hour = date.getHours();
	        let minute = date.getMinutes();
	        let second = date.getSeconds();
	        month = month >= 10 ? month : '0' + month;
	        day = day >= 10 ? day : '0' + day;
	        hour = hour >= 10 ? hour : '0' + hour;
	        minute = minute >= 10 ? minute : '0' + minute;
	        second = second >= 10 ? second : '0' + second;
	        return date.getFullYear() + '-' + month + '-' + day + ' ' + hour + ':' + minute + ':' + second;
		}
		
		// 업데이트 시 default hour값이 달라지므로 조정 필요
		function updateDateFormat(date){
			let month = date.getMonth() + 1;
	        let day = date.getDate();
	        let hour = date.getHours();
	        let minute = date.getMinutes();
	        let second = date.getSeconds();
	        month = month >= 10 ? month : '0' + month;
	        day = day >= 10 ? day : '0' + day;
	        hour =  -9 + hour;
	        minute = minute >= 10 ? minute : '0' + minute;
	        second = second >= 10 ? second : '0' + second;
	        return date.getFullYear() + '-' + month + '-' + day + ' ' + hour + ':' + minute + ':' + second;
		}
	</script>
</body>
</html>