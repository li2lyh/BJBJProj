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
<title>찜 도서</title>
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

/* 찜 목록 도서 */
.card {
	height: 230px;
}

.card-img-top {
	height: 70%;
}

.card-body {
	height: 30%;
}

.card-text {
	text-align: center;
}

.likeImg{
	width: 25px;
	height: 25px;
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

			<!-- 찜 목록 도서 -->
			<div class="col-8 p-4">
				<div class="row">
					<div class="d-flex justify-content-center p-2">
						<h4>찜한 도서</h4>
					</div>
					<c:if test="${list.size() == 0}">
						<p class="text-center border-top border-bottom p-3">찜한 도서가 없습니다.</p>
					</c:if>
					<c:if test="${list.size() > 0}">							
						<c:forEach items="${list}" var="dto">
							<div class="col-lg-4 col-md-6 col-sm-12 p-2">
								<div class="card">
									<c:choose>								
										<c:when test="${empty dto.img_id}">							
											<img class="card-img-top" src="/resources/images/noImg.png" id="noImg">
										</c:when>
										<c:otherwise>									
											<img class="card-img-top" src="/resources/images/noImg.png" id="bookImg">
									<%-- 		<img src="/profile/${dto.img_id}" id="bookImg"> --%>
										</c:otherwise>								
									</c:choose>
									<div class="card-body border-top">
										<div class="row p-0">										
											<div class="col-10 p-0">										
												<p class="card-text">${dto.book_title} / ${dto.book_author}</p>
											</div>		
												<div class="col-2 p-0">
												<a href="/member/toDeleteLikeBook?book_isbn=${dto.book_isbn}" onclick="return confirm('정말 삭제하시겠습니까?');">
													<img class="likeImg" src="/resources/images/like.png">
												</a>
						 						
											</div>																												
										</div>
									</div>
								</div>
							</div>						
						</c:forEach>
 					</c:if>
				</div>
			</div>
		</div>
	</div>
</body>

</html>