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
				<h1>
					쪽지함
					</h2>
			</div>
			<div class="col-3 col-lg-1 justify-content-end p-2">
				<button type="button" class="btn btn-secondary w-100" id="deleteBtn">삭제</button>
			</div>
		</div>
		<div class="row">
			<table class="table">
				<thead class="table-secondary">
					<tr>
						<th class="col-2"></th>
						<th class="col-2">No.</th>
						<th class="col-5">제목</th>
						<th class="col-3">날짜</th>
					</tr>
				</thead>
				<tbody>
					<c:if test="${list.size() == 0}">
						<tr>
							<td colspan="4">받은 쪽지가 없습니다.</td>
						</tr>
					</c:if>
					<c:if test="${list.size() > 0}">
						<c:forEach items="${list}" var="dto">
							<tr>
								<td><input type="checkbox" class="deleteNo" name="no"
									value="${dto.no}"></td>
								<td>${dto.no}</td>
								<td>${dto.title}</td>
								<td>${dto.written_date}</td>
							</tr>
						</c:forEach>
					</c:if>
				</tbody>
			</table>
			<nav>
				<ul class="pagination justify-content-center">
					<c:choose>
						<c:when test="${startPageNum ne 1}">
							<li class="page-item"><a class="page-link"
								href="${pageContext.request.contextPath}/member/toLetter?pageNum=${startPageNum - 1}"><<</a>
							</li>
						</c:when>
						<c:otherwise>
							<li class="page-item d-none"><a class="page-link"
								href="javascript:"></a></li>
						</c:otherwise>
					</c:choose>
					<c:forEach var="i" begin="${startPageNum}" end="${endPageNum}">
						<c:choose>
							<c:when test="${i eq pageNum }">
								<li class="page-item active"><a class="page-link"
									href="${pageContext.request.contextPath}/member/toLetter?pageNum=${i}">${i}</a>
								</li>
							</c:when>
							<c:otherwise>
								<li class="page-item"><a class="page-link"
									href="${pageContext.request.contextPath}/member/toLetter?pageNum=${i}">${i}</a>
								</li>
							</c:otherwise>
						</c:choose>
					</c:forEach>
					<c:choose>
						<c:when test="${endPageNum lt totalPageCount}">
							<li class="page-item"><a class="page-link"
								href="${pageContext.request.contextPath}/member/toLetter?pageNum=${endPageNum + 1}">>></a>
							</li>
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
	// 쪽지 삭제
	$("#deleteBtn"). on("click",function(){
		let deleteArr = []; 
		
		let noArr = $(".deleteNo:checked"); 
		for(let no of noArr){ 
			deleteArr.push(no.value);
		}
		console.log(deleteArr);
		
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
	})
	</script>
</body>
</html>