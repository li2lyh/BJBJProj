<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<title>BookClub 모집</title>
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

#modal-body p{
  display:block;
  overflow: hidden;
  text-overflow: ellipsis;
  white-space: nowrap;
  height: 20px;
  margin-bottom: 10px;
}
#modal-body p:hover{
cursor:pointer;
font-weight:bold;
}
#etc{
font-weight:bold;
}
#keyword{
width:70%;
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
					<h4>BookClub 모집</h4>
				</div>
			</div>
			<div class="row">

				<div class="col-3 writing">
					<label for="title" class="form-label">모임 제목</label>
				</div>
				<div class="col">
					<input type="text" class="form-control" id="room_title"	name="room_title" placeholder="제목을 입력하세요.">
				</div>
			</div>
			<div class="row">
				<div class="col-3 writing">
					<label for="file" class="form-label">도서 이름</label>
				</div>
				<div class="col">
<<<<<<< HEAD
					<input type="file" class="form-control" id="files" name="files" multiple>
=======
					<div class="row m-0">
            <div class="col-3 p-0">
            <input type="text" id="book_title" name="book_title" class="form-control" readonly>
            <input type="hidden" id="itemId" name="itemId" value="">
            <input type="hidden" id="book_cover" name="book_cover" value="">
            </div>		
            <div class="col-9">
            <button type="button" id="btnSearch" class="btn btn-warning">검색</button>
            </div>	
					</div>
>>>>>>> 6978c39d30bf637f86b6c6ad5f0d814c6c959b6f
				</div>
			</div>
			<div class="row">
				<div class="col-3 writing">
					<label for="content" class="form-label">모임 장소</label>
				</div>
				<div class="col radioBox">
					<input type="radio" class="tag" name="tag" value="온라인">온라인
					<input type="radio" class="tag" name="tag" value="오프라인" checked>오프라인
					<input type="radio" class="tag" name="tag" value="온/오프라인">온/오프라인
				</div>
			</div>
			<div class="row">
				<div class="col-3 writing">
					<label for="content" class="form-label">모임 횟수</label>
				</div>
				<div class="col">
					<select class="form-select" id="meet_week" name="meet_week"
						aria-label="Default select example">
						<option value="1">주 1회</option>
						<option value="2">주 2회</option>
						<option value="3">주 3회</option>
						<option value="4">주 4회</option>
						<option value="5">주 5회</option>
					</select>
				</div>
			</div>
			<div class="row">
				<div class="col-3 writing">
					<label for="content" class="form-label">모집 인원</label>
				</div>
				<div class="col">
					<select class="form-select" id="room_people" name="room_people"
						aria-label="Default select example">
						<option value="3">3</option>
						<option value="4">4</option>
						<option value="5">5</option>
						<option value="6">6</option>
						<option value="7">7</option>
						<option value="8">8</option>
						<option value="9">9</option>
						<option value="10">10</option>
					</select>
				</div>
			</div>
			<div class="row">
				<div class="col-3 writing">
					<label for="content" class="form-label">모임 지역</label>
				</div>
				<div class="col">
					<select class="form-select" id="place" name="place"
						aria-label="Default select example">
						<option value="서울">서울</option>
						<option value="경기">경기</option>
						<option value="대전">대전</option>
						<option value="부산">부산</option>
						<option value="기타">기타(모집 상세에 기입)</option>
					</select>
				</div>
			</div>
			<div class="row">
				<div class="col-3 writing">
					<label for="content" class="form-label">모임 기간</label>
				</div>
				<div class="col">
					<input type="text" id="open_date" class="form-control"
						name="open_date" value="" />
				</div>

				<div class="col">
					<input type="text" id="close_date" class="form-control"
						name="close_date" value="" />
				</div>
			</div>
			<div class="row">
				<div class="col-3 writing">
					<label for="content" class="form-label">모집 상세</label>
				</div>
				<div class="col">
					<textarea class="form-control" id="room_detail" name="room_detail"
						rows="5" placeholder="내용을 입력해주세요."></textarea>
				</div>
			</div>
			<div class="row">
				<div class="col d-flex justify-content-end btnBox">
					<p id="p1">* 모집 기간은 등록일로부터 2주입니다</p>
					<button type="button" class="btn btn-secondary m-1 btn-lg"
						id="toCancle">취소</button>
					<button type="button" class="btn btn-primary m-1 btn-lg" id="write">등록</button>
				</div>
			</div>
		</div>
	</form>
	
	
	
	<%-- Modal --%>
	<form action="" method="">
	
	<div class="modal" tabindex="-1">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
       <input type="text" id="keyword" name="keyword" class="form-control">
        <button type="button" id="btnKeyword"  class="btn btn-warning" >검색</button>
        <button type="button" id="searchCancel"  class="btn btn-secondary" >닫기</button>
      </div>
      <div class="modal-body" id="modal-body">
        <p>모임에서 활용할 도서를 검색해보세요!</p>
      </div>
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
			
			// 현재 날짜
			let today = new Date();   

			let year = today.getFullYear(); // 년도
			let month = today.getMonth() + 1;  // 월
			let date = today.getDate();  // 날짜
			let day = today.getDay();  // 요일

			let sysdate = year + '-' + month + '-' + date;
			console.log("현재날짜 : " + sysdate);
			
			
			
			
			// 날짜 차이 유효성 검사 (모임기간 최소 7일)
			let open = $("#open_date").val();
			let close = $("#close_date").val();
			
			let open_date = new Date(open);
			let close_date = new Date(close);

			let date_gap = diffDate(open_date, close_date);

			let sysdate_date = new Date(sysdate);
			
			
			
			let initial_date = diffDate(sysdate_date, open_date);
			
			console.log("date_gap : " + date_gap);
			console.log("initial_date : " + initial_date);
			
			// 종료 날짜가 시작 날짜보다 빠를 때
			if(close_date < open_date){
				alert("종료 날짜는 시작날짜보다 과거 일 수 없습니다.");
				return false;
			}
			// 모임 기간이 7일 미만일 때
			if(date_gap < 7){
				alert("모임 최소 기간은 일주일 입니다.");
				return false;
			}
			// 현재 날짜보다 시작 날짜가 빠를 때
			if(initial_date < 0){
				alert("모임 시작일은 현재날짜보다 과거 일 수 없습니다.");
				return false;
			}
			  
			
			
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
		$("#close_date").val(sysdate);	
		
		// 도서 검색
		$("#btnSearch").on("click",function(){
			
			$(".modal").show();
			$("#keyword").focus();
				
		})
		
		
		$("#btnKeyword").on("click", function(){
			let keyword = $("#keyword").val();
	
			$.ajax({
				url: "/books/searchBook",
				type:"post",	
				data:{'keyword':keyword},
				success: function(data){	
					
					$("#modal-body").empty();
					
					for(let dto of data){
						console.log(dto.title);	
					
					let a = $("<p>").attr({"class":"bookSelected"}).html(textLengthOverCut(dto.title, 30, '. . .'));
					let hiddenId = $("<input>").attr({"class":"itemId"}).css({"display":"none"}).val(dto.itemId); 
					let bookCover = $("<input>").attr({"class":"book_cover"}).css({"display":"none"}).val(dto.cover); 
					$("#modal-body").append(a, hiddenId, bookCover);
					
					}
					let etc = $("<p>").attr({"id":"etc"}).html("[기타]찾는 도서가 없을 시 선택");
					$("#modal-body").append(etc);	
					
					
					$(".bookSelected").on("click", function(){
						
						$("#book_title").val($(this).html());
						$(".modal").hide();	
						$("#itemId").val($(this).next().val());
						$("#book_cover").val($(this).next().next().val());
						
						initialize();
							
					})
					// 찾는 도서가 없을 때 
					$("#etc").on("click", function(){
						$("#book_title").val("[기타]");
						$("#itemId").val(0);
						
						initialize();
					
					})		
					
				},
				error: function(e){
					console.log(e);
				}		
			})
		})
		
		$("#searchCancel").on("click", function(){
		
			initialize();
		})		
		
		
		
		// 글자 수 처리 function
		function textLengthOverCut(txt, len, lastTxt) {
        if (len == "" || len == null) { // 기본값
            len = 20;
        }
        if (lastTxt == "" || lastTxt == null) { // 기본값
            lastTxt = "...";
        }
        if (txt.length > len) {
            txt = txt.substr(0, len) + lastTxt;
        }
        return txt;
    }

		// 검색창 초기화 function
		function initialize(){
			
			$(".modal").hide();
			$("#keyword").val("");
			$("#modal-body").empty();
		
			let noP = $("<p>").html("모임에서 활용할 도서를 검색해보세요!");
			$("#modal-body").append(noP);
			
		}
		
		
		// 날짜 차이 계산 function
		function diffDate(date1, date2){
			let diffDate = date2.getTime() - date1.getTime();
			
			return diffDate / (1000 * 60 * 60 * 24);
		}
		
		
		
		
		
		
		
		
		
	</script>
</body>
</html>