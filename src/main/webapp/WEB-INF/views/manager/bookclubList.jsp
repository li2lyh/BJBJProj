<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<meta charset="UTF-8">
<title>전체 모임</title>
<style>

/*폰트*/
@font-face {
    font-family: 'MapoGoldenPier';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/MapoGoldenPierA.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}

@import url(//fonts.googleapis.com/earlyaccess/nanumgothiccoding.css);

.nanumgothiccoding * {
 font-family: 'Nanum Gothic Coding', monospace;
}

*{
	font-family : 'MapoGoldenPier';
}
/*버튼*/
.searchBtn {
	margin: 2px;
	width: 50px;
	height: 30px;
	color:white;
	background-color:black;
}
.messageBtn{
	margin: 2px;
	width: 50px;
	height: 30px;
	color:black;
	background-color:white;
	border-color:gray;
}

.deleteBtn{
	margin: 2px;
	width: 50px;
	height: 30px;
	color:black;
	background-color:white;
	border-color:gray;
}
/*leftBox*/
.leftPageBox h5{
	margin: 5px;
}
.leftPageBox h6{
	margin: 8px;
}

.leftPageBox a {
	text-decoration: none;
	color: black;
}

/*rightBox*/
.rightPage th{
	font-family : 'Nanum Gothic Coding' ;
	text-align:center;
}

.rightPage td{
	font-family : 'Nanum Gothic Coding';
	text-align:center;
}

.selectBox {
	margin: 1px;
}

.inputContent {
	margin: 1px;
}
/*모달창*/
.bookclubModal{
	width: 500px;
	height: 600px;
}

.contentBox textarea {
	width: 300px;
	height: 200px;
	resize: none;
}

.bookclubModal .modal-content{
	height:500px;
}

.sendTo {
	margin: 2px;
	width: 300px;
	height: 30px;
	color:black;
	background-color:white;	
	border-color:gray;
}
/*modal input title*/
.titleBox{
	margin: 2px;
	width: 300px;
	height: 30px;
	color:black;
	background-color:white;	
	border-color:gray;
}
</style>
</head>
<body>
	<div class="container">
		<!-- header -->
		<div class="header">
			<jsp:include page="/WEB-INF/views/frame/header.jsp"></jsp:include>
		</div>

		<h2>관리자</h2>
		<hr text-align:center>
		<div class="row">
			<div class="col-3 p-4 leftPage">
				<div class="row leftPageBox">
					<h5>회원관리</h5>
					<h6><a href="/manager/toAllmember">전체 회원</a></h6>
					<h6><a href="/manager/toblacklist">블랙리스트</a></h6>
					<h5>모임관리</h5>
					<h6><a href="/manager/toAllclub">전체모임</a></h6>
					<h5>게시글 관리</h5>
					<h6><a href="/manager/toReview">리뷰관리</a></h6>
					<h5><a href="/manager/toReport">신고</a></h5>
				</div>
			</div>
			<div class="col-9 rightPage">
				<div class="reportContainer">
					<form id="searchclubForm">
					<div class="row">
						<div class="col-5">
							<h3>전체 모임</h3>
						</div>
						<div class="col-7 p-3 d-flex justify-content-end">
							<select name="category" class="selectBox">
								<option name="room_title" value="room_title">모임명</option>
								<option name="email" value="email">모임장</option>
							</select> 
							<input type="text" placeholder="내용을 입력해주세요" class="inputContent" name="keyword">
							<button type="button" class="searchBtn">검색</button>
						</div>
					</div>
					</form>
					<div style="width:100%; height:500px; overflow:auto">
					<table class="table table-hover">
						<thead class="table">
							<tr>
								<th>모임명</th>
								<th>모임장</th>
								<th></th>
								<th>모임인원</th>
								<th>모임기간</th>
								<th>모임상태</th>
								<th></th>
							</tr>
						</thead>
						<tbody class="bookclubBody">
							<c:if test="${list.size() == 0}">
								<tr>
									<td colspan="7">등록된 모임이 없습니다.</td>
								</tr>
							</c:if>
							<c:if test ="${list.size() > 0 }">
								<c:forEach items="${list}" var="dto">
									<tr>
										<td>${dto.room_title}</td>
										<td class="email">${dto.email}</td>
										<td><button type="button" class="messageBtn">쪽지</button></td>
										<td>${dto.room_people}</td>
										<td>${dto.open_date}~${dto.close_date}</td>
										<td>${dto.room_status}</td>
										<td><button type="button" class="deleteBtn" value="${dto.room_id}">삭제</button></td>
									</tr>
								</c:forEach>
							</c:if>
						</tbody>
					</table>
					</div>
				</div>
			</div>
		</div>

		<!-- 쪽지 모달 -->
		<form id="roomMessageForm" action="/manager/insertRoomLetter" method="post">
			<div class="modal bookclubModal" tabindex="-1">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title">쪽지 보내기</h5>
						</div>
						<div class="modal-body">
							<div class="row p-2">
								<div class="col-3">받는이</div>
								<div class="col-9">
									<input type="text" class="sendTo" name="email" id="letter_email">
								</div>
							</div>
							<div class="row p-2">
								<div class="col-3">제목</div>
								<div class="col-9">
									<input type="text" class="titleBox" name="title">
								</div>
							</div>
							<div class="row p-2">
								<div class="col-3">내용</div>
								<div class="col-9 contentBox">
									<textarea name="content"></textarea>
								</div>
							</div>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-secondary" id="closeBtn" data-bs-dismiss="modal">닫기</button>
							<button type="button" class="btn btn-primary" id="submitBtn">전송</button>
						</div>
					</div>
				</div>
			</div>
		</form>
		<!-- footer -->
		<div class=footer>
		<jsp:include page="/WEB-INF/views/frame/footer.jsp"></jsp:include>
		</div>
	</div>
		<script>
			//모임 검색
			$(".searchBtn").on("click", function(){
				let data = $("#searchclubForm").serialize();
				console.log(data);
				
				$.ajax({
					url:"/manager/toSearchBookclub"
					, type : "get"
					, data : data
					, success : function(data){
						console.log(data)
						makeDynamicEl(data);
					}, error : function(e){
						console.log(e);
					}
				});
			})
			
			function makeDynamicEl(data){
				$("tbody").empty();
				if(data.length == 0){
					let tr = $("<tr>");
					let td = $("<td colspan=8>").append("검색결과가 없습니다.");
					tr.append(td);
					tr.appendTo("tbody")
				}else{
					for(let dto of data){
						let tr = $("<tr>");
						let td1 = $("<td>").append(dto.room_title);
						let td2 = $("<td>").append(dto.email);
						let messageBtn = $("<button>").attr({
							type : "button"
							, class : "messageBtn"
							, value : dto.room_id
						}).append("쪽지");
						let td3 = $("<td>").append(messageBtn);
						let td4 = $("<td>").append(dto.room_people);
						let td5 = $("<td>").append(dto.open_date + '~' + dto.close_date );
						let td6 = $("<td>").append(dto.room_status);
						let deleteBtn = $("<button>").attr({
							type : "button"
							, class : "deleteBtn"
							, value : dto.room_id
						}).append("삭제");
						let td7 = $("<td>").append(deleteBtn);
						
						tr.append(td1, td2, td3, td4, td5, td6, td7);
						tr.appendTo("tbody");
						
					}
					
				}
		
			}

			
			//쪽지 모달
			$(".bookclubBody").on("click",".messageBtn",function() {
				let letter_email = $(this).parent("td").prev(".email").html();
				$("#letter_email").val(letter_email);
				$(".bookclubModal").show();
				console.log(letter_email);
			});
			//쪽지 모달 닫기
			$("#closeBtn").on("click", function(){
				$(".bookclubModal").hide();
			})

			//쪽지 form 전송 
			$("#submitBtn").on("click", function() {
				$("#roomMessageForm").submit();
			})
			
			
			//모임 삭제
			$(".bookclubBody").on("click",".deleteBtn", function(e){
				let yn = confirm("정말 삭제하시겠습니까?");
				if(yn){
					location.href="/manager/deleteBookroom?room_id="+this.value;
				}
			})
			
			
		</script>
</body>
</html>