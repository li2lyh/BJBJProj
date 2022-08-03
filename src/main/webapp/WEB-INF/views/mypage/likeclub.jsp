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
<title>찜 독서 모임</title>
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

/* 찜 독서 모임 */
th, td{
	text-align : center;
}

#deleteBtn{
	width : 100px;
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

			<!-- 찜 독서 모임 -->
			<div class="col-8 p-4">
				<div class="row">
					<div class="d-flex justify-content-center p-2">
						<h4>찜 독서 모임</h4>
					</div>
					<div class="p-0">신청을 원하시면 원하시는 모임의 이름을 누르면, 상세페이지로 넘어갑니다.</div>
					<table class="table">
						<thead>
							<tr class="table-secondary">
								<th scope="col"><input type="checkbox" id="all"></th>
								<th scope="col">책</th>
								<th scope="col">모임이름</th>
								<th scope="col">모집 기간</th>
								<th scope="col">모임 기간</th>
							</tr>
						</thead>
						<tbody>
							<c:if test="${list.size() == 0}">
								<tr>
									<td colspan="5">
										찜한 독서 모임이 없습니다.
									</td>
								</tr>
							</c:if>
							<c:if test="${list.size() > 0}">							
	  							<c:forEach items="${list}" var="dto">
	  								<tr>
		  								<td><input type="checkbox" class="deleteNo" id="deleteNo" name="room_id" value="${dto.room_id}"></td>
		  								<td>${dto.book_title}</td>
		  								<td class="fw-bolder"><a href="/club/detailView?room_id=${dto.room_id}">${dto.room_title}</a></td>
		  								<td>~ ${dto.recruit_end}</td>
		  								<td>${dto.open_date} ~ ${dto.close_date}</td>
	  								</tr>
	  							</c:forEach>
	  						</c:if>
						</tbody>
					</table>
					<div class="row p-0 m-0">
						<div class="col d-flex justify-content-end p-0 m-0">
							<button type="button" class="btn btn-danger" id="deleteBtn">삭제</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<script>
	// 체크박스 전체 체크/ 해제
	$("#all").on("click", function(){
		if(this.checked){
			$(".deleteNo").prop("checked", true);
			$(".deleteNo").click(function(e){
				e.preventDefault();				
			});
		}else{ 
			$(".deleteNo").prop("checked", false);
			$(".deleteNo").unbind();
		}
	})
	
	// 찜 모임 삭제
	$("#deleteBtn").on("click",function(){
		let deleteArr = []; 
		
		let noArr = $(".deleteNo:checked"); 
		for(let no of noArr){ 
			deleteArr.push(no.value);
		}
		console.log(deleteArr);
		
		if (confirm("정말 삭제하시겠습니까?") == true) { // 삭제 확인
			if(deleteArr.length > 0) {
				$.ajax({
					url : "/member/toDeleteLikeClub"
					,type : "post"
					, data : {"no[]" : deleteArr}
					, success : function(){
						location.href = "/member/toLikeclub";
					}, error : function(e){
						console.log(e);
					}
				})	
			} else {
				alert("선택된 모임이 없습니다.");
			}
		} else { // 삭제 취소
			$("input:checkbox[id='deleteNo']").prop("checked", false);
			return false;
		}
		
	})
	</script>
</body>

</html>