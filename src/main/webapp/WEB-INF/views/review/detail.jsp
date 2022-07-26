<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 <!-- Bootstrap -->
     <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
     <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2" crossorigin="anonymous"></script>
<title>북적북적 - 리뷰페이지</title>
</head>
<style>
div {
	border: 1px solid grey;
}

.titleBox {
	margin-bottom: 10px;
}

.row {
	margin: 5px;
}
</style>
<body>
	<div class="container-fluid container-xl">
		<div class="titleBox">
			<h1>Write Review</h1>
			<span>회원 여러분들의 소중한 리뷰를 남겨주세요!</span>
		</div>
		<div class="reviewWrite">
			<div class="row">
				<div class="col-2 label">책이름</div>
				<div class="col-10">
					${dto.book_title}
				</div>
			</div>
			<div class="row">
				<div class="col-2 label">글제목</div>
				<div class="col-10">
					${dto.review_title}
				</div>
			</div>
			<div class="row">
				<div class="col-2 label">리뷰</div>
				<div class="col-10">
					${dto.content}
				</div>
			</div>
			<div class="row">
				<div class="col">
					<button type="button" class="btn btn-secondary" id="btnBack">뒤로가기</button>
					<button type="button" class="btn btn-secondary" id="btnModify">수정하기</button>
					<button type="button" class="btn btn-secondary" id="btnDelete" value="${dto.review_no}">삭제하기</button>
				</div>
			</div>
		</div>
	</div>
	<script>
	
		// 뒤로가기 버튼
		document.getElementById('btnBack').onclick = function() {
			location.href = "/review/board";
		}
		
		// 수정하기 버튼
		document.getElementById('btnModify').onclick = function() {
			location.href = "";
		}
		
		// 삭제하기 버튼
		document.getElementById('btnDelete').onclick = function() {
			let con = confirm("이 리뷰를 삭제하시겠습니까?")
			if(con) {
				location.href = "/review/deleteProc?review_no="+document.getElementById('btnDelete').value;
			}
		}
	
	</script>
</body>
</html>