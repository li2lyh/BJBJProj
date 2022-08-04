<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
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

/* 찜 목록 도서 */
div > .card {
	height: 300px;
}

div > . card-img-top {
	height: 60%;
}

div > .card-body {
	height: 40%;
}

div > .card-text {
	text-align: center;
}

#noImg{
	width: 100%;
	height: 70%;
}

#bookImg{
	width: 100%;
	height: 70%;
} 

.likeImg{
	width: 25px;
	height: 25px;
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
							<a class="list nav-link dropdown-toggle p-0 fw-bolder" id="navbarDarkDropdownMenuLink" role="button" data-bs-toggle="dropdown" aria-expanded="false"> 찜 목록 </a>
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
				<div class="col-9 p-4">
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
											<c:when test="${empty dto.book_cover}">							
												<img class="card-img-top" src="/resources/images/noImg.png" id="noImg">
											</c:when>
											<c:otherwise>		
												<img src="${dto.book_cover}" id="bookImg">
											</c:otherwise>								
										</c:choose>
										<div class="card-body border-top">
											<div class="row p-0">										
												<div class="col-12 p-0">		
													<!-- 책 제목 열 글자 넘으면 자르기 -->
													<c:choose>
														<c:when test="${fn:length(dto.book_title) > 10}">
															<p class="card-text">${fn:substring(dto.book_title,0,7)}...</p>
														</c:when>
														<c:otherwise>
															<p class="card-text">${dto.book_title}</p>
														</c:otherwise>
													</c:choose>								
												</div>		
												<div class="col-10 p-0">						
													<!-- 작가 열 글자 넘으면 자르기 -->
													<c:choose>
														<c:when test="${fn:length(dto.book_author) > 10}">
															<p class="card-text">${fn:substring(dto.book_author,0,10)}...</p>
														</c:when>
														<c:otherwise>
															<p class="card-text">${dto.book_author}</p>
														</c:otherwise>
													</c:choose>					
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
		
		<!-- footer -->
		<div class="footer">
			<jsp:include page="/WEB-INF/views/frame/footer.jsp"></jsp:include>
		</div>
	</div>
</body>

</html>