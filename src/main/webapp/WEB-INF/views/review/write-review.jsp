<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- Bootstrap -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2"
	crossorigin="anonymous"></script>
<title>북적북적 - 리뷰 작성하기</title>
</head>
<body>
	<div class="container-fluid container-xl">
		<!------------------------------------- header ----------------------------------------->
		<div class="header">
			<jsp:include page="/WEB-INF/views/frame/header.jsp"></jsp:include>
		</div>
		<!------------------------------------- main content ----------------------------------->
		<div class="titleBox">
			<h1>Write Review</h1>
			<span>회원 여러분들의 소중한 리뷰를 남겨주세요!</span>
		</div>
		<form id="reviewForm" action="/review/writeProc" method="post" encType="multipart/form-data">
			<div class="reviewWrite">
				<div class="row">
					<div class="col-2 label">책이름</div>
					<div class="col-10">
						<input type="text" class="form-control" id="book_title" name="book_title"
							placeholder="제목을 입력해주세요">
					</div>
				</div>
				<div class="row">
					<div class="col-2 label">글제목</div>
					<div class="col-10">
						<input type="text" class="form-control" id="review_title" name="review_title">
					</div>
				</div>
				<div class="row">
					<div class="col-2 label">이미지</div>
					<div class="col-10">
						<input type="file" class="form-control" id="file" name="file">
					</div>
				</div>
				<div class="row">
					<div class="col-2 label">리뷰</div>
					<div class="col-10">
						<textarea class="form-control" id="content" name="content"></textarea>
					</div>
				</div>
				<div class="row">
					<div class="col">
						<button type="button" class="btn btn-secondary" id="btnBack">뒤로가기</button>
						<button type="button" class="btn btn-secondary" id="btnWrite">작성하기</button>
					</div>
				</div>
			</div>
		</form>
		<!------------------------------------- footer ----------------------------------------->
		<div class="footer">
			<jsp:include page="/WEB-INF/views/frame/footer.jsp"></jsp:include>
		</div>
	</div>
	<script>
	
		// 뒤로가기 버튼 
		document.getElementById('btnBack').onclick = function() {
			location.href = "/review/board";
		}
		
		// 리뷰작성하기 버튼
		document.getElementById('btnWrite').onclick = function() {
			let con = confirm('리뷰를 작성할까요?');
			if(con) {
				document.getElementById('reviewForm').submit();
			}
		}
	
	</script>
</body>
</html>