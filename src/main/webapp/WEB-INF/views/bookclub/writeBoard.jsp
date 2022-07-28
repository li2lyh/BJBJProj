<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet">

<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<title>글남기기</title>
<style>
#room_people {
	width: 25%;
}

#meet_week {
	width: 25%;
}

#place {
	width: 25%;
}

#open_date {
	
}

#close_date {
	
}

.writing {
	text-align: right;
	width:50%;
}

h3 {
	margin-bottom: 50px;
}

.row:not(#head) {
	margin-bottom: 20px;
}

.radioBox {
	margin: auto;
}

#content {
	height: 200px;
	resize: none;
}

#head {
	border-bottom: 1px solid lightgray;
	text-align: left;
	margin: 0;
}

#p1 {
	margin-top: 15px;
}
#room_detail{
resize:none;
}


</style>
</head>
<body>
	<form action="/club/write" id="submitForm" method="post"
		enctype="multipart/form-data">
		<div class="container">

			<div class="row">
				<div class="col">
					<h3 id="head">BookClub</h3>
				</div>
			</div>

			<div class="row">
				<div class="col d-flex justify-content-left">
					<h4>MY CLUB</h4>
				</div>
			</div>

			<div class="row">
				<div class="col-3 writing">
					<label for="title" class="form-label"> 제목</label>
				</div>
				<div class="col">
					<input type="text" class="form-control" id="room_title"
						name="room_title" placeholder="제목을 입력하세요.">
				</div>
			</div>
			

			<div class="row">
				<div class="col-3 writing">
					<label for="content" class="form-label">내용</label>
				</div>
				<div class="col">
					<textarea class="form-control" id="room_detail" name="room_detail"
						rows="5" placeholder="내용을 입력해주세요."></textarea>
				</div>
			</div>
			<div class="row">
				<div class="col d-flex justify-content-end btnBox">
					<button type="button" class="btn btn-secondary m-1 btn-lg"
						id="toCancle">취소</button>
					<button type="button" class="btn btn-primary m-1 btn-lg" id="write">등록</button>
				</div>
			</div>
		</div>
	</form>
	<script>
		
	
		// 뒤로 가기 버튼
		document.getElementById("toCancle").onclick = function() {
			location.href = "/club/toClub";
		}

		// 등록 버튼 클릭
		$("#write").on("click", function() {
			var con = confirm("모집 기간은 등록일로부터 2주입니다. 등록하시겠습니까?");
			if (con) {
				$("#submitForm").submit();
			}
		})

		//DatePicker
		$("#open_date").datepicker();
		$("#close_date").datepicker();
		$.datepicker.setDefaults({
			dateFormat : 'yy-mm-dd' // Input Display Format 변경
			,
			showOtherMonths : true // 빈 공간에 현재월의 앞뒤월의 날짜를 표시
			,
			showMonthAfterYear : true // 년도 먼저 나오고, 뒤에 월 표시
			,
			changeYear : true // 콤보박스에서 년 선택 가능
			,
			changeMonth : true
		// 콤보박스에서 월 선택 가능
		})
		
		let today = new Date();   
		let year = today.getFullYear(); // 년도
		let month = today.getMonth() + 1;  // 월
		let date = today.getDate();  // 날짜
		let day = today.getDay();  // 요일
		let sysdate = year + '-' + month + '-' + date; // 현자 날짜 표기
		
		$("#open_date").val(sysdate);
			
		
		
		
	</script>
</body>
</html>