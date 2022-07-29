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
<title>도서 리뷰</title>
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

/* 도서 리뷰 */
#noImg {
	width: 100%;
	height: 100%;
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

#reviewImg{
	width: 200px;
	height: 200px;
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

			<!-- 도서 리뷰 -->
			<div class="col-8 p-4">
				<div class="row">
					<div class="d-flex justify-content-center p-2">
						<h4>도서 리뷰</h4>
					</div>
					<div class="p-2">최근 작성한 리뷰 순으로 보여드립니다.</div>
				</div>
				<c:if test="${list.size() == 0}">
					<div class="review p-2">
						<div class="row border-top p-3">
							<div class="col-12 d-flex justify-content-center">						
								<p class="m-0">작성한 리뷰가 없습니다.</p>
							</div>
						</div>
					</div>
				</c:if>
				<c:if test="${list.size() > 0}">
					<c:forEach items="${list}" var="dto">
						<div class="review p-0">
							<div class="row border-top p-3">
								<div class="col-12 col-md-4 col-lg-4">
									<c:choose>
										<c:when test="${empty dto.img_id}">
											<img src="/resources/images/noImg.png" id="noImg">
										</c:when>
										<c:otherwise>
											<img class="card-img-top" src="/resources/images/noImg.png" id="reviewImg">
											<%-- <img src="/profile/${dto.img_id}" id="reviewImg"> --%>
										</c:otherwise>
									</c:choose>
								</div>
								<div class="col-12 col-md-8 col-lg-8 p-5">
									<p>${dto.book_title}</p>
									<p class="fw-bolder"><a href="/review/detail?review_no=${dto.review_no}">${dto.review_title}</a></p>
									<span>${dto.nickname}</span> <span>${dto.written_date}</span>
								</div>
							</div>
						</div>
					</c:forEach>
				</c:if>
				<div class="row border-top p-2">
					
				</div>
				<div class="row p-0">
					<div class="col d-flex justify-content-end p-0">
						<button type="button" class="btn btn-secondary" id="writeBtn">작성하기</button>
					</div>
				</div>
				<nav>
					<ul class="pagination justify-content-center">
						<c:choose>
							<c:when test="${pagination.startPage ne 1}">
								<li class="page-item">
									<a class="page-link" href="/member/toMyreview?page=${pagination.startPage - 1}"><<</a>
								</li>
							</c:when>
							<c:otherwise>
								<li class="page-item d-none">
									<a class="page-link" href="javascript_:"></a>
								</li>
							</c:otherwise>
						</c:choose>
						<c:forEach var="page" begin="${pagination.startPage}" end="${pagination.endPage}" step="1">
							<li class="page-item">
								<a class="page-link" href="/member/toMyreview?page=${page}" <c:if test="${pagination.page eq page}">style="background-color: black; color: white; font-weight: bolder;"</c:if> >${page}</a>
							</li>
						</c:forEach>
						<c:choose>
							<c:when test="${pagination.endPage lt pagination.totalPageCnt}">
								<li class="page-item"><a class="page-link" href="/member/toMyreview?page=${pagination.endPage + 1}">>></a></li>
							</c:when>
							<c:otherwise>
								<li class="page-item d-none">
									<a class="page-link" href="javascript_:"></a>
								</li>
							</c:otherwise>
						</c:choose>
					</ul>
				</nav>
			</div>
		</div>
	</div>
	
	<script>
		// 작성하기 버튼 클릭시
		$("#writeBtn").on("click",function(){
			location.href = "/review/toWrite";
		})
	</script>
</body>

</html>