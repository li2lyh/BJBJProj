<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>북적북적 - 신간 도서 검색</title>
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
.contentBox {
	padding-left: 40px;
}


.itemBox {
	float: left;
	width: 18%;
	height: 300px;
	margin: 7px;
}

.imgBox {
	height: 200px;
	margin-bottom: 20px;
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
			<h1>신간도서 New Arrivals</h1>
			<span>새로 나온 책들을 읽어보세요!</span>
		</div>
		<div class="contentBox">
			<c:forEach items="${newBooks}" var="item">
				<div class="itemBox d-flex flex-column justify-content-center">
					<a href="${item.link}"><img class="imgBox" src="${item.cover}"></a>
					<div class="descBox">
						<div class="bookTitle">
							<a href="${item.link}">${item.title}</a>
						</div>
						<div class="bookAuthor">${item.author }</div>
					</div>
				</div>
			</c:forEach>
		</div>
		<!---------------------------------- footer ---------------------------------->
		<div class="footer">
			<jsp:include page="/WEB-INF/views/frame/footer.jsp"></jsp:include>
		</div>
	</div>
</body>
</html>