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
<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
<title>북적북적 - 리뷰 작성하기</title>
<style>
/* ---------------- main content ---------------- */
.mainContent {
	margin-top: 6rem;
	margin-bottom: 6rem;
	padding-left: 3rem;
	padding-right: 3rem;
}

/* ---------------- main content ---------------- */
/* -------------- titleBox -------------- */
.titleBox {
	padding-bottom : 0.3rem;
	border-bottom : 1px solid black;
}

.titleBox h1 {
	margin : 0;
}

/* -------------- formBox -------------- */
.formBox {
	margin-top: 2.3rem;
	padding-left: 2rem;
	padding-right: 2rem;
}

/* -------------- write --------------- */
.reviewWrite .row {
	margin-bottom: 1.5rem;
	align-items: center;
}

.reviewWrite .row:nth-of-type(4) {
	margin-bottom: 1.5rem;
	align-items: baseline;
}

/* -------- label -------- */
.reviewWrite .label {
	font-size: 1.3rem;
	text-align: center;

}

/* -------- textarea ----- */
.reviewWrite #content {
	height: 28rem;
}

</style>
</head>
<body>
	<div class="container-fluid container-xl">
		<!------------------------------------- header ----------------------------------------->
		<div class="header">
			<jsp:include page="/WEB-INF/views/frame/header.jsp"></jsp:include>
		</div>
		<!------------------------------------- main content ----------------------------------->
		<div class="mainContent">
		<!------------------------------------- title ------------------------------------------>
			<div class="titleBox">
				<h1>Write Review</h1>
				<span>회원 여러분들의 소중한 리뷰를 남겨주세요!</span>
			</div>
		<!------------------------------------- form ------------------------------------------->	
			<div class="formBox">
				<form id="reviewForm" action="/review/writeProc" method="post" encType="multipart/form-data">
		<!------------------------------------- Write ------------------------------------------>			
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
						<div class="row d-flex justify-content-end">
							<div class="col-4 col-md-2 d-flex justify-content-end">
								<button type="button" class="btn btn-outline-secondary" id="btnBack" style="width: 100%;">뒤로가기</button>
							</div>
							<div class="col-4 col-md-2 d-flex justify-content-end">
								<button type="button" class="btn btn-outline-secondary" id="btnWrite" style="width: 100%">작성하기</button>
							</div>
						</div>
					</div>
				</form>
			</div>
		</div>
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
			
			if($("#book_title").val() == "") {
				alert("책 제목을 입력해주세요")
				return;
			} else if($("#review_title").val() == "") {
				alert("리뷰 제목을 입력해주세요")
				return;
			} else if($("#content").val() == "") {
				alert("내용을 입력해주세요")
				return;
			}
			let con = confirm('리뷰를 작성할까요?');
			if(con) {
				document.getElementById('reviewForm').submit();
			}
		}
	
	</script>
</body>
</html>