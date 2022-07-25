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
/*공백*/
.empty {
	height: 30px;
}
/*버튼*/
.searchBtn {
	margin: 2px;
	width: 50px;
	height: 30px;
}
/*leftBox*/
h6 {
	margin: 10px;
	padding: 2px;
}

a {
	text-decoration: none;
	color: black;
}
/*rightBox*/
.selectBox {
	margin: 1px;
}

.inputContent {
	margin: 1px;
}
/*모달창*/
textarea {
	width: 300px;
	height: 250px;
	resize: none;
}

.sendTo {
	width: 300px;
}
.titleBox{
	width:300px;
}
</style>
</head>
<body>
	 <div class="empty"></div>
	<div class="container">
		<h2>관리자</h2>
		<hr text-align:center>
		<div class="row">
			<div class="col-3 p-4 leftPage">
				<div class="row">
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
					<div class="row">
						<div class="col-5">
							<h3>전체 모임</h3>
						</div>
						<div class="col-7 p-3 d-flex justify-content-end">
							<select name="member" class="selectBox">
								<option value="모임명">모임명</option>
								<option value="모임장">모임장</option>
							</select> <input type="text" placeholder="내용을 입력해주세요" class="inputContent">
							<button type="button" class="searchBtn">검색</button>
						</div>
					</div>
					<table class="table table-hover">
						<thead class="table-secondary">
							<tr>
								
								<th>모임명</th>
								<th>모임장</th>
								<th></th>
								<th>인원수</th>
								<th>모임기간</th>
								<th>모임상태</th>
								<th>경고</th>
								<th></th>
							</tr>
						</thead>
						<tbody>
							<c:if test="${list.size() == 0}">
								<tr>
									<td colspan="8">등록된 모임이 없습니다.</td>
								</tr>
							</c:if>
							<c:if test ="${list.size() > 0 }">
								<c:forEach items="${list}" var="dto">
									<tr>
										
										<td>${dto.room_title}</td>
										<td>모임장</td>
										<td><button type="button" class="messageBtn">쪽지</button></td>
										<td>${dto.room_people}</td>
										<td>${dto.open_date}~${dto.close_date}</td>
										<td>${dto.room_status}</td>
										<td>경고</td>
										<td><button type="button" class="deleteBtn" value="${dto.room_id}">삭제</button></td>
									</tr>
								</c:forEach>
							</c:if>

						</tbody>
					</table>

				</div>
			</div>
		</div>

		<!-- 쪽지 모달 -->
		<form id="roomMessageForm" action="#" method="get">
			<div class="modal" tabindex="-1">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title">쪽지 보내기</h5>
						</div>
						<div class="modal-body">
							<div class="row p-2">
								<div class="col-3">받는이</div>
								<div class="col-9">
									<input type="text" class="sendTo" placeholder="받는 모임장">
								</div>
							</div>
							<div class="row p-2">
								<div class="col-3">제목</div>
								<div class="col-9">
									<input type="text" class="titleBox">
								</div>
							</div>
							<div class="row p-2">
								<div class="col-3">내용</div>
								<div class="col-9 contentBox">
									<textarea></textarea>
								</div>
							</div>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-secondary" id="closeBtn"
								data-bs-dismiss="modal">닫기</button>
							<button type="button" class="btn btn-primary" id="submitBtn">전송</button>
						</div>
					</div>
				</div>
			</div>
		</form>
	</div>
		<script>
			//쪽지 모달
			$(".messageBtn").on("click", function() {
				$(".modal").show();
			});
			//쪽지 모달 닫기
			document.getElementById("closeBtn").onclick = function() {
				$(".modal").hide();
			}
			//쪽지 form 전송 
			$("#submitBtn").on("click", function() {
				$("#roomMessageForm").submit();
			})
			
			
			//모임 삭제
			$(".deleteBtn").on("click", function(){
				location.href="/manager/deleteBookroom?room_id="+this.value;
			})
			
			
		</script>
</body>
</html>