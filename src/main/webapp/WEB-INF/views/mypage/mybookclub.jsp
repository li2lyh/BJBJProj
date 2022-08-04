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
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
	crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<title>참여 독서 모임</title>
<style>
/* content 길이 */
.content{
	height: 1500px;
}

/* 메뉴 */
div a {
	color: black;
	text-decoration: none;
}

div a:hover {
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

div > .dropdown-menu {
	border: none;
}

div > .dropdown-item:hover {
	background-color: white;
}

/* 참여 독서 모임 */
.table-container {
  overflow-x: auto;
}
      
div table {
  width: 100%;
  min-width: 550px;
}
      
div th, td {
	text-align: center;
}

li > .page-link {
	border: none;
	color: black;
}

li > .page-link:hover {
	background-color: white;
	color: black;
	font-weight: bolder;
}
</style>
</head>

<body>
	<div class="container m-auto">
		<!-- header -->
		<div class="header">
			<jsp:include page="/WEB-INF/views/frame/header.jsp"></jsp:include>
		</div>
		
		<!-- content -->
		<div class="content p-0">
			<div class="row border-bottom border-dark">
				<h2>MyBook</h2>
			</div>
			<div class="row d-flex">
				<!-- 메뉴 -->
				<div class="col-3 p-4">
					<div class="row p-2">
						<a href="/member/toChange">
							<div>내 정보 수정</div>
						</a>
					</div>
					<div class="row p-2">
						<a href="/member/toMybookclub">
							<div class="fw-bolder">참여 독서 모임</div>
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
				
				<!-- 참여 독서 모임 -->
				<div class="col-9 p-4">
					<div class="row">
						<div class="d-flex justify-content-center p-2">
							<h4>참여 독서 모임</h4>
						</div>
						<div class="p-0">최근 참여한 독서모임 순으로 보여드립니다.</div>
						<div class="table-container p-0">
							<table class="table">
								<thead class="table-secondary">
									<tr>
										<th scope="col">No.</th>
										<th scope="col">책</th>
										<th scope="col">모임이름</th>
										<th scope="col">기간</th>
										<th scope="col">진행상황</th>
									</tr>
								</thead>
								<tbody>
									<c:if test="${list.size() == 0}">
										<tr>
											<td colspan="5">
												참여한 독서모임이 없습니다.
											</td>
										</tr>
									</c:if>							
									<c:if test="${list.size() > 0}">				
										<c:forEach items="${list}" var="dto">
											<tr>
												<td>${dto.rank}</td>
												<td>${dto.book_title}</td>
												<td>${dto.room_title}</td>
												<td>${dto.open_date} ~ ${dto.close_date}</td>
												<td>${dto.room_status}</td>
											</tr>							
										</c:forEach>
									</c:if>
								</tbody>
							</table>
						</div>
						<nav>
							<ul class="pagination justify-content-center">
								<c:choose>
									<c:when test="${pagination.startPage ne 1}">
										<li class="page-item">
											<a class="page-link" href="/member/toMybookclub?page=${pagination.startPage - 1}"><<</a>
										</li>
									</c:when>
									<c:otherwise>
										<li class="page-item d-none">
											<a class="page-link" href="javascript:"></a>
										</li>
									</c:otherwise>
								</c:choose>
								<c:forEach var="page" begin="${pagination.startPage}" end="${pagination.endPage}" step="1">
									<li class="page-item">
										<a class="page-link" href="/member/toMybookclub?page=${page}" <c:if test="${pagination.page eq page}">style="background-color: black; color: white; font-weight: bolder;"</c:if> >${page}</a>
									</li>
								</c:forEach>
								<c:choose>
									<c:when test="${pagination.endPage lt pagination.totalPageCnt}">
										<li class="page-item">
											<a class="page-link" href="/member/toMybookclub?page=${pagination.endPage + 1}">>></a>
										</li>
									</c:when>
									<c:otherwise>
										<li class="page-item d-none">
											<a class="page-link" href="javascript:"></a>
										</li>
									</c:otherwise>
								</c:choose>
							</ul>
						</nav>
						
						<!-- 종료된 독서 모임 -->
						<div class="d-flex justify-content-center p-2">
							<h4>종료된 독서 모임</h4>
						</div>
						<div class="table-container p-0">
							<table class="table">
								<thead class="table-secondary">
									<tr>
										
										<th scope="col">책</th>
										<th scope="col">모임이름</th>
										<th scope="col">기간</th>
										<th scope="col">진행상황</th>
									</tr>
								</thead>
								<tbody>
									<c:if test="${eList.size() == 0}">
										<tr>
											<td colspan="5">
												종료된 독서모임이 없습니다.
											</td>
										</tr>
									</c:if>							
									<c:if test="${eList.size() > 0}">				
										<c:forEach items="${eList}" var="dto">
											<tr>
												
												<td>${dto.book_title}</td>
												<td>${dto.room_title}</td>
												<td>${dto.open_date} ~ ${dto.close_date}</td>
												<td>종료</td>
											</tr>							
										</c:forEach>
									</c:if>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
		
		<!-- footer -->
		<div class="footer">
			<jsp:include page="/WEB-INF/views/frame/footer.jsp"></jsp:include>
		</div>
	</div>

</body>

</html>