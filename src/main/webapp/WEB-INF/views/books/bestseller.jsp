<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>북적북적 - 베스트셀러 검색</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2"
	crossorigin="anonymous"></script>
<!-- jQuery -->
<script src="https://code.jquery.com/jquery-3.6.0.js"
	integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
	crossorigin="anonymous"></script>
<style>
div {
	border: 0px solid grey;
}

.titleBox {
	margin-bottom: 30px;
}

.ranking {
	position: absolute;
	top: 10%;
	left: 20%;
	border-radius: 50%;
	background-color: rgba(255, 122, 255, 0.5);
	width: 40px;
	height: 40px;
	text-align: center;
	padding: 10px 0;
}

.likeBtn {
	position: absolute;
	top: 65%;
	right: 20%;
	width: 30px;
	
}

.genreRow>.col-12 {
	font-size: 40px;
}

.contentBox {
	position: relative;
	float: left;
	width: 18%;
	height: 300px;
	margin: 7px;
}

.contentBox2 {
	width: 80%;
}

.contentBox2 .itemList {
	list-style: none;
	margin: auto;
	padding: 5px;
}

.imgBox {
	height: 200px;
	margin-bottom: 20px;
	overflow: hidden;
	margin: 0 auto;
}

.thumbImg {
	width: 100%;
	height: 100%;
	object-fit: cover;
}

.descBox {
	margin-top: 10px;
}

.bookTitle {
	overflow: hidden;
	text-overflow: ellipsis;
	white-space: nowrap;
}

.bookAuthor {
	overflow: hidden;
	text-overflow: ellipsis;
	white-space: nowrap;
}

@media screen and (max-width: 1200px) {
	.bookList {
		display: none;
	}
}

@media screen and (min-width: 1200px) {
	.bookList2 {
		display: none !important;
	}
}
/* list */
.score {
	margin-right: 2em;
}

.title {
	display: inline-block;
	width: 20em;
}

.carousel-control-next, .carousel-control-prev {
	width: 5% !important;
}

.carousel-item {
	padding-left: 5%;
}
</style>
</head>
<body>
	<div class="container-fluid container-xl">
		<!---------------------------------- header ---------------------------------->
		<div class="header">
			<jsp:include page="/WEB-INF/views/frame/header.jsp"></jsp:include>
		</div>
		<!------------------------------- main content ------------------------------->
		<div class="titleBox">
			<h1>베스트셀러 Bestseller</h1>
			<span>지금 북적북적에서는 이 책들을 읽고 있어요!</span>
		</div>
		<!----------------------------- 종합도서 ------------------------------>
		<div class="row genreRow">
			<div class="col-12">종합도서</div>
		</div>
		<!-- 갤러리 형식으로 보기 -->
		<div id="bookPhotoAll" class="carousel carousel-dark slide bookList"
			data-bs-ride="carousel">
			<div class="carousel-inner">
				<div class="carousel-item active">
					<c:forEach items="${all}" var="item" begin="0" end="4">
						<div class="contentBox d-flex flex-column justify-content-center">
							<c:set var="cnt" value="${cnt+1}" />
							<div class="ranking">${cnt}위</div>
							<div class="imgBox">
								<a href="${item.link}"><img class="thumbImg"
									src="${item.cover}"></a>
							</div>
							<div class="likeBox">
								<img class="likeBtn" src="/resources/images/like-disabled.png">
								<input type="text" class="book_isbn" style="display:none;" value="${item.isbn}">
								<input type="text" class="book_title" style="display:none;" value="${item.title}">
								<input type="text" class="book_author" style="display:none;" value="${item.author}">
							</div>
							<div class="descBox">
								<div class="bookTitle">
									<a href="${item.link}">${item.title}</a>
								</div>
								<div class="bookAuthor">${item.author}</div>
							</div>
						</div>
					</c:forEach>
				</div>
				<c:set var="beginCnt" value="0" />
				<c:set var="endCnt" value="4" />

				<c:forEach begin="0" end="8" var="cnt">
					<div class="carousel-item">
						<c:set var="beginCnt" value="${beginCnt + 5}" />
						<c:set var="endCnt" value="${endCnt + 5}" />
						<c:set var="cnt" value="${beginCnt+1}" />

						<c:forEach items="${all}" var="item" begin="${beginCnt}"
							end="${endCnt}">
							<div class="contentBox d-flex flex-column justify-content-center">
								<c:set var="cnt" value="${beginCnt+1}" />
								<div class="ranking">${cnt}위</div>
								<div class="imgBox">
									<a href="${item.link}"><img class="thumbImg"
										src="${item.cover}"></a>
								</div>
								<img class="likeBtn" src="/resources/images/like-disabled.png">
								<input type="text" class="book_isbn" style="display:none;" value="${item.isbn}">
								<input type="text" class="book_title" style="display:none;" value="${item.title}">
								<input type="text" class="book_author" style="display:none;" value="${item.author}">
								<div class="descBox">
									<div class="bookTitle">
										<a href="${item.link}">${item.title}</a>
									</div>
									<div class="bookAuthor">${item.author}</div>
								</div>
							</div>
						</c:forEach>
					</div>
				</c:forEach>
			</div>
			<button class="carousel-control-prev" type="button"
				data-bs-target="#bookPhotoAll" data-bs-slide="prev">
				<span class="carousel-control-prev-icon" aria-hidden="true"></span>
				<span class="visually-hidden">Previous</span>
			</button>
			<button class="carousel-control-next" type="button"
				data-bs-target="#bookPhotoAll" data-bs-slide="next">
				<span class="carousel-control-next-icon" aria-hidden="true"></span>
				<span class="visually-hidden">Next</span>
			</button>
		</div>

		<!-- 목록 형식으로 보기 -->
		<div id="bookListAll" class="carousel carousel-dark slide bookList2"
			data-bs-ride="carousel">
			<div class="carousel-inner">
				<div class="carousel-item active">
					<table width="95%">
						<tbody>
							<c:forEach items="${all}" var="item" begin="0" end="4">
								<c:set var="cnt" value="${cnt+1}" />
								<tr>
									<td width="50px">${cnt}위</td>
									<td class="bookTitle">${item.title}</td>
									<td class="bookAuthor">${item.author}</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>

				<c:set var="beginCnt" value="0" />
				<c:set var="endCnt" value="4" />
				<c:set var="cnt" value="5" />

				<c:forEach begin="1" end="9" var="pageCnt">
					<div class="carousel-item">
						<c:set var="beginCnt" value="${beginCnt + 5}" />
						<c:set var="endCnt" value="${endCnt + 5}" />
						<table width="95%">
							<tbody>
								<c:forEach items="${all}" var="item" begin="${beginCnt}"
									end="${endCnt}">
									<c:set var="cnt" value="${cnt+1}" />
									<tr>
										<td width="50px">${cnt}위</td>
										<td class="bookTitle">${item.title}</td>
										<td class="bookAuthor">${item.author}</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</c:forEach>
			</div>
			<button class="carousel-control-prev" type="button"
				data-bs-target="#bookListAll" data-bs-slide="prev">
				<span class="carousel-control-prev-icon" aria-hidden="true"></span>
			</button>
			<button class="carousel-control-next" type="button"
				data-bs-target="#bookListAll" data-bs-slide="next">
				<span class="carousel-control-next-icon" aria-hidden="true"></span>
			</button>
		</div>
		<!------------------------------- 경제경영 ----------------------------------->
		<div class="row genreRow">
			<div class="col-12">경제경영</div>
		</div>
		<!-- 갤러리 형식으로 보기 -->
		<div id="bookPhotoBusiness"
			class="carousel carousel-dark slide bookList" data-bs-ride="carousel">
			<div class="carousel-inner">
				<div class="carousel-item active">
					<c:forEach items="${business}" var="item" begin="0" end="4">
						<div class="contentBox d-flex flex-column justify-content-center">
							<div class="imgBox">
								<a href="${item.link}"><img class="thumbImg"
									src="${item.cover}"></a>
							</div>
							<img class="likeBtn" src="/resources/images/like-disabled.png">
							<input type="text" class="book_isbn" style="display:none;" value="${item.isbn}">
							<input type="text" class="book_title" style="display:none;" value="${item.title}">
							<input type="text" class="book_author" style="display:none;" value="${item.author}">
							<div class="descBox">
								<div class="bookTitle">
									<a href="${item.link}">${item.title}</a>
								</div>
								<div class="bookAuthor">${item.author}</div>
							</div>
						</div>
					</c:forEach>
				</div>
				<c:set var="beginCnt" value="0" />
				<c:set var="endCnt" value="4" />

				<c:forEach begin="0" end="8" var="cnt">
					<div class="carousel-item">
						<c:set var="beginCnt" value="${beginCnt + 5}" />
						<c:set var="endCnt" value="${endCnt + 5}" />

						<c:forEach items="${business}" var="item" begin="${beginCnt}"
							end="${endCnt}">
							<div class="contentBox d-flex flex-column justify-content-center">
								<div class="imgBox">
									<a href="${item.link}"><img class="thumbImg"
										src="${item.cover}"></a>
								</div>
								<img class="likeBtn" src="/resources/images/like-disabled.png">
								<input type="text" class="book_isbn" style="display:none;" value="${item.isbn}">
								<input type="text" class="book_title" style="display:none;" value="${item.title}">
								<input type="text" class="book_author" style="display:none;" value="${item.author}">
								<div class="descBox">
									<div class="bookTitle">
										<a href="${item.link}">${item.title}</a>
									</div>
									<div class="bookAuthor">${item.author}</div>
								</div>
							</div>
						</c:forEach>
					</div>
				</c:forEach>
			</div>
			<button class="carousel-control-prev" type="button"
				data-bs-target="#bookPhotoBusiness" data-bs-slide="prev">
				<span class="carousel-control-prev-icon" aria-hidden="true"></span>
				<span class="visually-hidden">Previous</span>
			</button>
			<button class="carousel-control-next" type="button"
				data-bs-target="#bookPhotoBusiness" data-bs-slide="next">
				<span class="carousel-control-next-icon" aria-hidden="true"></span>
				<span class="visually-hidden">Next</span>
			</button>
		</div>

		<!-- 목록 형식으로 보기 -->
		<div id="bookListBusiness"
			class="carousel carousel-dark slide bookList2"
			data-bs-ride="carousel">
			<div class="carousel-inner">
				<div class="carousel-item active">
					<table width="95%">
						<tbody>
							<c:forEach items="${all}" var="item" begin="0" end="4">
								<c:set var="cnt" value="${cnt+1}" />
								<tr>
									<td width="50px">${cnt}위</td>
									<td class="bookTitle">${item.title}</td>
									<td class="bookAuthor">${item.author}</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>

				<c:set var="beginCnt" value="0" />
				<c:set var="endCnt" value="4" />
				<c:set var="cnt" value="5" />

				<c:forEach begin="1" end="9" var="pageCnt">
					<div class="carousel-item">
						<c:set var="beginCnt" value="${beginCnt + 5}" />
						<c:set var="endCnt" value="${endCnt + 5}" />
						<table width="95%">
							<tbody>
								<c:forEach items="${all}" var="item" begin="${beginCnt}"
									end="${endCnt}">
									<c:set var="cnt" value="${cnt+1}" />
									<tr>
										<td width="50px">${cnt}위</td>
										<td class="bookTitle">${item.title}</td>
										<td class="bookAuthor">${item.author}</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</c:forEach>
			</div>
			<button class="carousel-control-prev" type="button"
				data-bs-target="#bookListBusiness" data-bs-slide="prev">
				<span class="carousel-control-prev-icon" aria-hidden="true"></span>
			</button>
			<button class="carousel-control-next" type="button"
				data-bs-target="#bookListBusiness" data-bs-slide="next">
				<span class="carousel-control-next-icon" aria-hidden="true"></span>
			</button>
		</div>

		<!------------------------------ 고전 ---------------------------------->
		<div class="row genreRow">
			<div class="col-12">고전</div>
		</div>

		<!-- 갤러리 형식으로 보기 -->
		<div id="bookPhotoClassic"
			class="carousel carousel-dark slide bookList" data-bs-ride="carousel">
			<div class="carousel-inner">
				<div class="carousel-item active">
					<c:forEach items="${classic}" var="item" begin="0" end="4">
						<div class="contentBox d-flex flex-column justify-content-center">
							<div class="imgBox">
								<a href="${item.link}"><img class="thumbImg"
									src="${item.cover}"></a>
							</div>
							<img class="likeBtn" src="/resources/images/like-disabled.png">
							<input type="text" class="book_isbn" style="display:none;" value="${item.isbn}">
							<input type="text" class="book_title" style="display:none;" value="${item.title}">
							<input type="text" class="book_author" style="display:none;" value="${item.author}">
							<div class="descBox">
								<div class="bookTitle">
									<a href="${item.link}">${item.title}</a>
								</div>
								<div class="bookAuthor">${item.author}</div>
							</div>
						</div>
					</c:forEach>
				</div>
				<c:set var="beginCnt" value="0" />
				<c:set var="endCnt" value="4" />

				<c:forEach begin="0" end="8" var="cnt">
					<div class="carousel-item">
						<c:set var="beginCnt" value="${beginCnt + 5}" />
						<c:set var="endCnt" value="${endCnt + 5}" />

						<c:forEach items="${classic}" var="item" begin="${beginCnt}"
							end="${endCnt}">
							<div class="contentBox d-flex flex-column justify-content-center">
								<div class="imgBox">
									<a href="${item.link}"><img class="thumbImg"
										src="${item.cover}"></a>
								</div>
								<img class="likeBtn" src="/resources/images/like-disabled.png">
								<input type="text" class="book_isbn" style="display:none;" value="${item.isbn}">
								<input type="text" class="book_title" style="display:none;" value="${item.title}">
								<input type="text" class="book_author" style="display:none;" value="${item.author}">
								<div class="descBox">
									<div class="bookTitle">
										<a href="${item.link}">${item.title}</a>
									</div>
									<div class="bookAuthor">${item.author}</div>
								</div>
							</div>
						</c:forEach>
					</div>
				</c:forEach>
			</div>
			<button class="carousel-control-prev" type="button"
				data-bs-target="#bookPhotoClassic" data-bs-slide="prev">
				<span class="carousel-control-prev-icon" aria-hidden="true"></span>
				<span class="visually-hidden">Previous</span>
			</button>
			<button class="carousel-control-next" type="button"
				data-bs-target="#bookPhotoClassic" data-bs-slide="next">
				<span class="carousel-control-next-icon" aria-hidden="true"></span>
				<span class="visually-hidden">Next</span>
			</button>
		</div>

		<!-- 목록 형식으로 보기 -->
		<div id="bookListClassic"
			class="carousel carousel-dark slide bookList2"
			data-bs-ride="carousel">
			<div class="carousel-inner">
				<div class="carousel-item active">
					<table width="95%">
						<tbody>
							<c:forEach items="${classic}" var="item" begin="0" end="4">
								<c:set var="cnt" value="${cnt+1}" />
								<tr>
									<td width="50px">${cnt}위</td>
									<td class="bookTitle">${item.title}</td>
									<td class="bookAuthor">${item.author}</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>

				<c:set var="beginCnt" value="0" />
				<c:set var="endCnt" value="4" />
				<c:set var="cnt" value="5" />

				<c:forEach begin="1" end="9" var="pageCnt">
					<div class="carousel-item">
						<c:set var="beginCnt" value="${beginCnt + 5}" />
						<c:set var="endCnt" value="${endCnt + 5}" />
						<table width="95%">
							<tbody>
								<c:forEach items="${classic}" var="item" begin="${beginCnt}"
									end="${endCnt}">
									<c:set var="cnt" value="${cnt+1}" />
									<tr>
										<td width="50px">${cnt}위</td>
										<td class="bookTitle">${item.title}</td>
										<td class="bookAuthor">${item.author}</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</c:forEach>
			</div>
			<button class="carousel-control-prev" type="button"
				data-bs-target="#bookListClassic" data-bs-slide="prev">
				<span class="carousel-control-prev-icon" aria-hidden="true"></span>
			</button>
			<button class="carousel-control-next" type="button"
				data-bs-target="#bookListClassic" data-bs-slide="next">
				<span class="carousel-control-next-icon" aria-hidden="true"></span>
			</button>
		</div>
		<!----------------------------------- 예술 ------------------------------->
		<div class="row genreRow">
			<div class="col-12">예술/대중문화</div>
		</div>
		<div id="bookPhotoArt" class="carousel carousel-dark slide bookList"
			data-bs-ride="carousel">
			<div class="carousel-inner">
				<div class="carousel-item active">
					<c:forEach items="${art}" var="item" begin="0" end="4">
						<div class="contentBox d-flex flex-column justify-content-center">
							<div class="imgBox">
								<a href="${item.link}"><img class="thumbImg"
									src="${item.cover}"></a>
							</div>
							<img class="likeBtn" src="/resources/images/like-disabled.png">
							<input type="text" class="book_isbn" style="display:none;" value="${item.isbn}">
							<input type="text" class="book_title" style="display:none;" value="${item.title}">
							<input type="text" class="book_author" style="display:none;" value="${item.author}">
							<div class="descBox">
								<div class="bookTitle">
									<a href="${item.link}">${item.title}</a>
								</div>
								<div class="bookAuthor">${item.author}</div>
							</div>
						</div>
					</c:forEach>
				</div>
				<c:set var="beginCnt" value="0" />
				<c:set var="endCnt" value="4" />

				<c:forEach begin="0" end="8" var="cnt">
					<div class="carousel-item">
						<c:set var="beginCnt" value="${beginCnt + 5}" />
						<c:set var="endCnt" value="${endCnt + 5}" />

						<c:forEach items="${art}" var="item" begin="${beginCnt}"
							end="${endCnt}">
							<div class="contentBox d-flex flex-column justify-content-center">
								<div class="imgBox">
									<a href="${item.link}"><img class="thumbImg"
										src="${item.cover}"></a>
								</div>
								<img class="likeBtn" src="/resources/images/like-disabled.png">
								<input type="text" class="book_isbn" style="display:none;" value="${item.isbn}">
								<input type="text" class="book_title" style="display:none;" value="${item.title}">
								<input type="text" class="book_author" style="display:none;" value="${item.author}">
								<div class="descBox">
									<div class="bookTitle">
										<a href="${item.link}">${item.title}</a>
									</div>
									<div class="bookAuthor">${item.author}</div>
								</div>
							</div>
						</c:forEach>
					</div>
				</c:forEach>
			</div>
			<button class="carousel-control-prev" type="button"
				data-bs-target="#bookPhotoArt" data-bs-slide="prev">
				<span class="carousel-control-prev-icon" aria-hidden="true"></span>
				<span class="visually-hidden">Previous</span>
			</button>
			<button class="carousel-control-next" type="button"
				data-bs-target="#bookPhotoArt" data-bs-slide="next">
				<span class="carousel-control-next-icon" aria-hidden="true"></span>
				<span class="visually-hidden">Next</span>
			</button>
		</div>

		<!-- 목록 형식으로 보기 -->
		<div id="bookListArt" class="carousel carousel-dark slide bookList2"
			data-bs-ride="carousel">
			<div class="carousel-inner">
				<div class="carousel-item active">
					<table width="95%">
						<tbody>
							<c:forEach items="${art}" var="item" begin="0" end="4">
								<c:set var="cnt" value="${cnt+1}" />
								<tr>
									<td width="50px">${cnt}위</td>
									<td class="bookTitle">${item.title}</td>
									<td class="bookAuthor">${item.author}</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>

				<c:set var="beginCnt" value="0" />
				<c:set var="endCnt" value="4" />
				<c:set var="cnt" value="5" />

				<c:forEach begin="1" end="9" var="pageCnt">
					<div class="carousel-item">
						<c:set var="beginCnt" value="${beginCnt + 5}" />
						<c:set var="endCnt" value="${endCnt + 5}" />
						<table width="95%">
							<tbody>
								<c:forEach items="${art}" var="item" begin="${beginCnt}"
									end="${endCnt}">
									<c:set var="cnt" value="${cnt+1}" />
									<tr>
										<td width="50px">${cnt}위</td>
										<td class="bookTitle">${item.title}</td>
										<td class="bookAuthor">${item.author}</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</c:forEach>
			</div>
			<button class="carousel-control-prev" type="button"
				data-bs-target="#bookListClassic" data-bs-slide="prev">
				<span class="carousel-control-prev-icon" aria-hidden="true"></span>
			</button>
			<button class="carousel-control-next" type="button"
				data-bs-target="#bookListClassic" data-bs-slide="next">
				<span class="carousel-control-next-icon" aria-hidden="true"></span>
			</button>
		</div>
		<!------------------------------------- 문학 ------------------------------>
		<div class="row genreRow">
			<div class="col-12">문학</div>
		</div>
		
		<div id="bookPhotoLiterature"
			class="carousel carousel-dark slide bookList" data-bs-ride="carousel">
			<div class="carousel-inner">
				<div class="carousel-item active">
					<c:forEach items="${literature}" var="item" begin="0" end="4">
						<div class="contentBox d-flex flex-column justify-content-center">
							<div class="imgBox">
								<a href="${item.link}"><img class="thumbImg"
									src="${item.cover}"></a>
							</div>
							<img class="likeBtn" src="/resources/images/like-disabled.png">
							<input type="text" class="book_isbn" style="display:none;" value="${item.isbn}">
							<input type="text" class="book_title" style="display:none;" value="${item.title}">
							<input type="text" class="book_author" style="display:none;" value="${item.author}">
							<div class="descBox">
								<div class="bookTitle">
									<a href="${item.link}">${item.title}</a>
								</div>
								<div class="bookAuthor">${item.author}</div>
							</div>
						</div>
					</c:forEach>
				</div>
				<c:set var="beginCnt" value="0" />
				<c:set var="endCnt" value="4" />

				<c:forEach begin="0" end="8" var="cnt">
					<div class="carousel-item">
						<c:set var="beginCnt" value="${beginCnt + 5}" />
						<c:set var="endCnt" value="${endCnt + 5}" />

						<c:forEach items="${literature}" var="item" begin="${beginCnt}"
							end="${endCnt}">
							<div class="contentBox d-flex flex-column justify-content-center">
								<div class="imgBox">
									<a href="${item.link}"><img class="thumbImg"
										src="${item.cover}"></a>
								</div>
								<img class="likeBtn" src="/resources/images/like-disabled.png">
								<input type="text" class="book_isbn" style="display:none;" value="${item.isbn}">
								<input type="text" class="book_title" style="display:none;" value="${item.title}">
								<input type="text" class="book_author" style="display:none;" value="${item.author}">
								<div class="descBox">
									<div class="bookTitle">
										<a href="${item.link}">${item.title}</a>
									</div>
									<div class="bookAuthor">${item.author}</div>
								</div>
							</div>
						</c:forEach>
					</div>
				</c:forEach>
			</div>
			<button class="carousel-control-prev" type="button"
				data-bs-target="#bookPhotoLiterature" data-bs-slide="prev">
				<span class="carousel-control-prev-icon" aria-hidden="true"></span>
				<span class="visually-hidden">Previous</span>
			</button>
			<button class="carousel-control-next" type="button"
				data-bs-target="#bookPhotoLiterature" data-bs-slide="next">
				<span class="carousel-control-next-icon" aria-hidden="true"></span>
				<span class="visually-hidden">Next</span>
			</button>
		</div>

		<!-- 목록 형식으로 보기 -->
		<div id="bookListLiterature"
			class="carousel carousel-dark slide bookList2"
			data-bs-ride="carousel">
			<div class="carousel-inner">
				<div class="carousel-item active">
					<table width="95%">
						<tbody>
							<c:forEach items="${literature}" var="item" begin="0" end="4">
								<c:set var="cnt" value="${cnt+1}" />
								<tr>
									<td width="50px">${cnt}위</td>
									<td class="bookTitle">${item.title}</td>
									<td class="bookAuthor">${item.author}</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>

				<c:set var="beginCnt" value="0" />
				<c:set var="endCnt" value="4" />
				<c:set var="cnt" value="5" />

				<c:forEach begin="1" end="9" var="pageCnt">
					<div class="carousel-item">
						<c:set var="beginCnt" value="${beginCnt + 5}" />
						<c:set var="endCnt" value="${endCnt + 5}" />
						<table width="95%">
							<tbody>
								<c:forEach items="${art}" var="item" begin="${beginCnt}"
									end="${endCnt}">
									<c:set var="cnt" value="${cnt+1}" />
									<tr>
										<td width="50px">${cnt}위</td>
										<td class="bookTitle">${item.title}</td>
										<td class="bookAuthor">${item.author}</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</c:forEach>
			</div>
			<button class="carousel-control-prev" type="button"
				data-bs-target="#bookListLiterature" data-bs-slide="prev">
				<span class="carousel-control-prev-icon" aria-hidden="true"></span>
			</button>
			<button class="carousel-control-next" type="button"
				data-bs-target="#bookListLiterature" data-bs-slide="next">
				<span class="carousel-control-next-icon" aria-hidden="true"></span>
			</button>
		</div>

		<!------------------------------------- 에세이 ------------------------------>
		<div class="row genreRow">
			<div class="col-12">에세이</div>
		</div>

		<div id="bookPhotoEssay" class="carousel carousel-dark slide bookList"
			data-bs-ride="carousel">
			<div class="carousel-inner">
				<div class="carousel-item active">
					<c:forEach items="${essay}" var="item" begin="0" end="4">
						<div class="contentBox d-flex flex-column justify-content-center">
							<div class="imgBox">
								<a href="${item.link}"><img class="thumbImg"
									src="${item.cover}"></a>
							</div>
							<img class="likeBtn" src="/resources/images/like-disabled.png">
							<input type="text" class="book_isbn" style="display:none;" value="${item.isbn}">
							<input type="text" class="book_title" style="display:none;" value="${item.title}">
							<input type="text" class="book_author" style="display:none;" value="${item.author}">
							<div class="descBox">
								<div class="bookTitle">
									<a href="${item.link}">${item.title}</a>
								</div>
								<div class="bookAuthor">${item.author}</div>
							</div>
						</div>
					</c:forEach>
				</div>
				<c:set var="beginCnt" value="0" />
				<c:set var="endCnt" value="4" />

				<c:forEach begin="0" end="8" var="cnt">
					<div class="carousel-item">
						<c:set var="beginCnt" value="${beginCnt + 5}" />
						<c:set var="endCnt" value="${endCnt + 5}" />

						<c:forEach items="${essay}" var="item" begin="${beginCnt}"
							end="${endCnt}">
							<div class="contentBox d-flex flex-column justify-content-center">
								<div class="imgBox">
									<a href="${item.link}"><img class="thumbImg"
										src="${item.cover}"></a>
								</div>
								<img class="likeBtn" src="/resources/images/like-disabled.png">
								<input type="text" class="book_isbn" style="display:none;" value="${item.isbn}">
								<input type="text" class="book_title" style="display:none;" value="${item.title}">
								<input type="text" class="book_author" style="display:none;" value="${item.author}">
								<div class="descBox">
									<div class="bookTitle">
										<a href="${item.link}">${item.title}</a>
									</div>
									<div class="bookAuthor">${item.author}</div>
								</div>
							</div>
						</c:forEach>
					</div>
				</c:forEach>
			</div>
			<button class="carousel-control-prev" type="button"
				data-bs-target="#bookPhotoEssay" data-bs-slide="prev">
				<span class="carousel-control-prev-icon" aria-hidden="true"></span>
				<span class="visually-hidden">Previous</span>
			</button>
			<button class="carousel-control-next" type="button"
				data-bs-target="#bookPhotoEssay" data-bs-slide="next">
				<span class="carousel-control-next-icon" aria-hidden="true"></span>
				<span class="visually-hidden">Next</span>
			</button>
		</div>

		<!-- 목록 형식으로 보기 -->
		<div id="bookListLiterature"
			class="carousel carousel-dark slide bookList2"
			data-bs-ride="carousel">
			<div class="carousel-inner">
				<div class="carousel-item active">
					<table width="95%">
						<tbody>
							<c:forEach items="${literature}" var="item" begin="0" end="4">
								<c:set var="cnt" value="${cnt+1}" />
								<tr>
									<td width="50px">${cnt}위</td>
									<td class="bookTitle">${item.title}</td>
									<td class="bookAuthor">${item.author}</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>

				<c:set var="beginCnt" value="0" />
				<c:set var="endCnt" value="4" />
				<c:set var="cnt" value="5" />

				<c:forEach begin="1" end="9" var="pageCnt">
					<div class="carousel-item">
						<c:set var="beginCnt" value="${beginCnt + 5}" />
						<c:set var="endCnt" value="${endCnt + 5}" />
						<table width="95%">
							<tbody>
								<c:forEach items="${art}" var="item" begin="${beginCnt}"
									end="${endCnt}">
									<c:set var="cnt" value="${cnt+1}" />
									<tr>
										<td width="50px">${cnt}위</td>
										<td class="bookTitle">${item.title}</td>
										<td class="bookAuthor">${item.author}</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</c:forEach>
			</div>
			<button class="carousel-control-prev" type="button"
				data-bs-target="#bookListLiterature" data-bs-slide="prev">
				<span class="carousel-control-prev-icon" aria-hidden="true"></span>
			</button>
			<button class="carousel-control-next" type="button"
				data-bs-target="#bookListLiterature" data-bs-slide="next">
				<span class="carousel-control-next-icon" aria-hidden="true"></span>
			</button>
		</div>

		<!---------------------------------- footer ---------------------------------->
		<div class="footer">
			<jsp:include page="/WEB-INF/views/frame/footer.jsp"></jsp:include>
		</div>
	</div>
	<script>
		$(".likeBtn").on("click", function(){
			let con = confirm("선택한 책을 찜할까요?");
			if(con){
				console.log($(".book_isbn").val());
				$.ajax({
					url: "/books/likes"
					, type: "post"
					, data: {
						book_isbn: $(".book_isbn").val()
						, book_title: $(".book_title").val()
						, book_author: $(".book_author").val()
						, email: "a"
					}
					, success: function(data){
						if(data === "success"){
							alert("선택한 책을 찜했습니다.")
						} else {
							alert("에러가 발생하여 요청이 처리되지 않았습니다.")
						}
					}, error: function(e){
						console.log(e)
					}
				})
			}
			
		})
	</script>
</body>
</html>
