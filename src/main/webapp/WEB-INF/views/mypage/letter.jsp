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
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<title>쪽지함</title>
<style>
th, td {
	text-align: center;
}

a {
	color: black;
	text-decoration: none;
}

a:hover {
	color: black;
	font-weight: bolder;
}

.page-link {
	border: none;
	color: black;
}

.page-link:hover {
	background-color: white;
	color: black;
	font-weight: bolder;
}
</style>
</head>
<body>
	<div class="container">
		<div class="row">
			<div class="col-9 col-lg-11 p-2">
				<h2>쪽지함</h2>
			</div>
			<div class="col-3 col-lg-1 justify-content-end p-2">
				<button type="button" class="btn btn-danger w-100" id="deleteBtn">삭제</button>
			</div>
		</div>
		<div class="row">
			<table class="table">
				<thead class="table-secondary">
					<tr>
						<th class="col-3"><input type="checkbox" id="all"></th>
						<th class="col-5">제목</th>
						<th class="col-4">날짜</th>
					</tr>
				</thead>
				<tbody>
					<c:if test="${list.size() == 0}">
						<tr>
							<td colspan="3">받은 쪽지가 없습니다.</td>
						</tr>
					</c:if>
					<c:if test="${list.size() > 0}">
						<c:forEach items="${list}" var="dto">
							<tr>
								<td><input type="checkbox" class="deleteNo" id="deleteNo"
									name="no" value="${dto.no}"></td>
								<!-- 읽은 쪽지 제목 font-weight 조정 -->
								<c:choose>
									<c:when test="${dto.read == 'Y'}">
										<td class="title"><a
											href="/member/toDetailLetter?no=${dto.no}">${dto.title}</a></td>
									</c:when>
									<c:otherwise>
								<td class="fw-bold title"><a
											href="/member/toDetailLetter?no=${dto.no}">${dto.title}</a></td>
									</c:otherwise>
								</c:choose>
								<!-- 읽은 쪽지 제목 font-weight 조정 끝 -->

								<td>${dto.written_date}</td>
							</tr>
						</c:forEach>
					</c:if>
				</tbody>
			</table>
			<nav>
				<ul class="pagination justify-content-center">
					<c:choose>
						<c:when test="${pagination.startPage ne 1}">
							<li class="page-item"><a class="page-link"
								href="/member/toLetter?page=${pagination.startPage - 1}"><<</a>
							</li>
						</c:when>
						<c:otherwise>
							<li class="page-item d-none"><a class="page-link"
								href="javascript:"></a></li>
						</c:otherwise>
					</c:choose>
					<c:forEach var="page" begin="${pagination.startPage}"
						end="${pagination.endPage}" step="1">
						<li class="page-item"><a class="page-link"
							href="/member/toLetter?page=${page}"
							<c:if test="${pagination.page eq page}">style="background-color: black; color: white; font-weight: bolder;"</c:if>>${page}</a>
						</li>
					</c:forEach>
					<c:choose>
						<c:when test="${pagination.endPage lt pagination.totalPageCnt}">
							<li class="page-item"><a class="page-link"
								href="/member/toLetter?page=${pagination.endPage + 1}">>></a></li>
						</c:when>
						<c:otherwise>
							<li class="page-item d-none"><a class="page-link"
								href="javascript:"></a></li>
						</c:otherwise>
					</c:choose>
				</ul>
			</nav>
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
	
	// 쪽지 삭제
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
					url : "/member/toDeleteLetter"
					,type : "post"
					, data : {"no[]" : deleteArr}
					, success : function(){
						location.href = "/member/toLetter";
					}, error : function(e){
						console.log(e);
					}
				})	
			} else {
				alert("선택된 쪽지가 없습니다.");
			}
		} else { // 삭제 취소
			$("input:checkbox[id='deleteNo']").prop("checked", false);
			return false;
		}
	})
	</script>
</body>
</html>