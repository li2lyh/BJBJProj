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
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<title>쪽지</title>
<style>
#cancelBtn{
	width : 90px;
}

textarea {
	resize: none;
	height: 300px;
}
</style>
</head>
<body>
	<div class="container">
		<div class="row p-2 border-bottom">
			<h3> 쪽지 </h3>
		</div>
		<div class="body p-4">
			<div class="row p-2">
				<div class="col-3">
					<label>제목</label>
				</div>
				<div class="col-9 p-0">
					<input type="text" class="form-control" id="title" name="title" value="${dto.title}" readonly>
				</div>
			</div>
			<div class="row p-2">
				<div class="col-3">
					<label>날짜</label>
				</div>
				<div class="col-9 p-0">
					<input type="text" class="form-control" id="written_date" name="written_date" value="${dto.written_date}" readonly>
				</div>
			</div>
			<div class="row p-2">
				<div class="col-3">
					<label>내용</label>
				</div>
				<div class="col-9 p-0">
					<textarea class="form-control" id="content" name="content" readonly>${dto.content}</textarea>
				</div>
			</div>
			<div class="row p-2">
				<div class="col d-flex justify-content-end p-0">
						<button type="button" class="btn btn-secondary" id="cancelBtn">닫기</button>
				</div>
			</div>
		</div>
	</div>
	
	<script>
		// 닫기 버튼 클릭시
		$("#cancelBtn").on("click",function(){
			location.href = "/member/toLetter";
		})
	</script>
</body>
</html>