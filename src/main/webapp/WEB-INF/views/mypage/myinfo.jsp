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
<title>MyBook</title>
<style>
/* 메뉴 */
.responsive{
	font-size: 16px;
}
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

/* 참여, 찜 독서 모임 */
.table-container {
  overflow-x: auto;
}
      
div table {
  width: 100%;
  min-width: 550px;
}

div th, td{
	text-align : center;
}

/* 도서 리뷰 */
#noImg {
	width: 100%;
	height: 100%;
}

#reviewImg{
	width: 100%;
	height: 100%;
}

/* 찜한 도서 */
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

.likeImg{
	width: 25px;
	height: 25px;
}

#noImgBook{
	width: 100%;
	height: 70%;
}

#bookImg{
	width: 100%;
	height: 70%;
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
			<div class="row">
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
	
				<!-- 전체 출력 -->
				<div class="allList col-9 p-4">
					<!-- 참여 독서 모임 -->
					<div class="row p-2" id="bookClub">
						<div class="d-flex justify-content-center p-2">
							<h4 class="fw-bolder">참여 독서 모임</h4>
						</div>
						<div class="p-0">최근 참여한 독서모임 순으로 보여드립니다.</div>
						<div class="table-container p-0">
							<table class="table">
								<thead>
									<tr class="table-secondary">
										<th scope="col">No.</th>
										<th scope="col">책</th>
										<th scope="col">모임이름</th>
										<th scope="col">기간</th>
										<th scope="col">진행상황</th>
									</tr>
								</thead>
								<tbody>
									<c:if test="${BookclubList.size() == 0}">
										<tr>
										  <td colspan="5">참여한 독서모임이 없습니다.</td>
										</tr>
									</c:if>
									<c:if test="${BookclubList.size() > 0}">							
			  							<c:forEach items="${BookclubList}" var="dto" begin="0" end="3">
			  								<c:set var="i" value="${i+1}"/>
			  								<tr>
				  								<td>${i}</td>
				  								<!-- 책 제목 열 글자 넘으면 자르기 -->
												<c:choose>
													<c:when test="${fn:length(dto.book_title) > 10}">
														<td>${fn:substring(dto.book_title,0,10)}...</td>
													</c:when>
													<c:otherwise>
														<td>${dto.book_title}</td>
													</c:otherwise>
												</c:choose>	
												<!-- 모임 이름 열 글자 넘으면 자르기 -->
												<c:choose>
													<c:when test="${fn:length(dto.room_title) > 10}">
														<td >${fn:substring(dto.room_title,0,7)}...</td>
													</c:when>
													<c:otherwise>
														<td>${dto.room_title}</td>
													</c:otherwise>
												</c:choose>	
				  								<td>${dto.open_date} ~ ${dto.close_date}</td>
				  								<td>${dto.room_status}</td>
			  								</tr>
			  							</c:forEach>
			  						</c:if>
								</tbody>
							</table>
						</div>
					</div>
	
					<!-- 도서 리뷰-->
					<div class="row p-2" id="bookReview">
						<div class="d-flex justify-content-center p-2">
							<h4 class="fw-bolder">도서 리뷰</h4>
						</div>
						<div class="p-2">최근 작성한 리뷰 순으로 보여드립니다. 제목을 누르면, 상세페이지로 넘어갑니다.</div>
						<c:if test="${ReviewList.size() == 0}">
							<div class="review p-2">
								<div class="row border-top border-bottom p-3">
									<div class="col-12 d-flex justify-content-center">						
										<p class="m-0">작성한 리뷰가 없습니다.</p>
									</div>
								</div>
							</div>
						</c:if>
						<c:if test="${ReviewList.size() > 0}">
							<c:forEach items="${ReviewList}" var="dto" begin="0" end="1">
								<div class="review p-0">
									<div class="row border-top border-bottom p-3">
										<div class="col-md-4 col-lg-4 col-sm-12">
											<c:choose>
												<c:when test="${empty dto.img_no}">
													<img src="/resources/images/noImg.png" id="noImg">
												</c:when>
												<c:otherwise>
													 <img src="${dto.img_no}" id="reviewImg">
												</c:otherwise>
											</c:choose>
										</div>
										<div class="col-md-8 col-lg-8 col-sm-12 p-5">
											<!-- 책 제목 열 글자 넘으면 자르기 -->
											<c:choose>
												<c:when test="${fn:length(dto.book_title) > 10}">
													<p>${fn:substring(dto.book_title,0,10)}...</p>
												</c:when>
												<c:otherwise>
													<p>${dto.book_title}</p>
												</c:otherwise>
											</c:choose>		
											<!-- 리뷰 제목 열 글자 넘으면 자르기 -->
											<c:choose>
												<c:when test="${fn:length(dto.review_title) > 10}">
													<p class="fw-bolder"><a href="/review/detail?review_no=${dto.review_no}">${fn:substring(dto.review_title,0,10)}...</a></p>
												</c:when>
												<c:otherwise>
													<p class="fw-bolder"><a href="/review/detail?review_no=${dto.review_no}">${dto.review_title}</a></p>
												</c:otherwise>
											</c:choose>	
											<span>${dto.nickname}</span> <span>${dto.written_date}</span>
										</div>
									</div>
								</div>
							</c:forEach>
						`</c:if>
					</div>		
	
					<!-- 찜한 도서 -->
					<div class="row p-2" id="likeBook">
						<div class="d-flex justify-content-center p-2">
							<h4 class="fw-bolder">찜한 도서</h4>
						</div>
						<c:if test="${LikeBooklist.size() == 0}">
							<p class="text-center border-top border-bottom p-3">찜한 도서가 없습니다.</p>
						</c:if>
						<c:if test="${LikeBooklist.size() > 0}">							
							<c:forEach items="${LikeBooklist}" var="dto" begin="0" end="2">
								<div class="col-lg-4 col-md-6 col-sm-12 p-2">
									<div class="card">
										<c:choose>								
											<c:when test="${empty dto.book_cover}">							
												<img class="card-img-top" src="/resources/images/noImg.png" id="noImgBook">
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
													<a href="/member/toDeleteLikeBook2?book_isbn=${dto.book_isbn}" onclick="return confirm('정말 삭제하시겠습니까?');">
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
	
					<!-- 찜 독서 모임 -->
					<div class="row p-2" id="likeClub">
						<div class="d-flex justify-content-center p-2">
							<h4 class="fw-bolder">찜 독서 모임</h4>
						</div>
						<div class="p-0">신청을 원하시면 원하시는 모임의 이름을 누르면, 상세페이지로 넘어갑니다.</div>
						<div class="table-container p-0">
							<table class="table">
								<thead>
									<tr class="table-secondary">
										<th scope="col">No.</th>
										<th scope="col">책</th>
										<th scope="col">모임이름</th>
										<th scope="col">모집 기간</th>
										<th scope="col">모임 기간</th>
									</tr>
								</thead>
								<tbody>
									<c:if test="${LikeclubList.size() == 0}">
										<tr>
										  <td colspan="5">찜한 독서 모임이 없습니다.</td>
										</tr>
									</c:if>
									<c:if test="${LikeclubList.size() > 0}">							
			  							<c:forEach items="${LikeclubList}" var="dto" begin="0" end="3">
			  								<c:set var="j" value="${j+1}"/>
			  								<tr>
				  								<td>${j}</td>
				  								<!-- 책 제목 열 글자 넘으면 자르기 -->
												<c:choose>
													<c:when test="${fn:length(dto.book_title) > 10}">
														<td>${fn:substring(dto.book_title,0,10)}...</td>
													</c:when>
													<c:otherwise>
														<td>${dto.book_title}</td>
													</c:otherwise>
												</c:choose>	
												<!-- 모임 이름 열 글자 넘으면 자르기 -->
												<c:choose>
													<c:when test="${fn:length(dto.room_title) > 10}">
														<td class="fw-bolder"><a href="/club/detailView?room_id=${dto.room_id}">${fn:substring(dto.room_title,0,7)}...</a></td>
													</c:when>
													<c:otherwise>
														<td class="fw-bolder"><a href="/club/detailView?room_id=${dto.room_id}">${dto.room_title}</a></td>
													</c:otherwise>
												</c:choose>	
				  								<td>~ ${dto.recruit_end}</td>
				  								<td>${dto.open_date} ~ ${dto.close_date}</td>
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