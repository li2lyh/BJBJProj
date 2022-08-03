<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!doctype html>
<html>

<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>searchPage</title>
	<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<link rel="stylesheet"	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet"
		integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" crossorigin="anonymous">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa"
		crossorigin="anonymous"></script>
	<style>
		/* ------------ 기준 ------------ */
		.container {
			font-size: 20px;
		}

		.contentBox {
			margin-top: 3rem;
		}

		/*  ------ Search Title  -------- */
		.searchTitle {
			margin-bottom: 7rem;
		}

		.searchTitle h3 {
			margin-bottom: 0.5rem;
			font-size: 3rem;
			font-weight: bold;
		}

		.searchTitle span {
			font-size: 1.3rem;
		}

		/*  ------ Search Book  -------- */
		/*  ------ title -------- */
		.searchBookTitle h3 {
			font-size: 2.5rem;
			font-weight: bold;

		}

		/*  ------ contents ----- */
		.bookContents {
			margin-bottom: 9rem;
		}

		.bookContents .card {
			margin-top: 1.3rem;
			margin-bottom: 1.3rem;
		}

		.bookContents .card-title {
			font-weight: bolder;
			font-size: 1rem;
			text-align: center;
			text-overflow: ellipsis;
			overflow: hidden;
			word-break: break-word;

			display: -webkit-box;
			-webkit-line-clamp: 2;
			-webkit-box-orient: vertical;
		}


		/*  ------ Search Club  -------- */
		/*  ------ title -------- */
		.searchClubTitle h3 {
			font-size: 2.5rem;
			font-weight: bold;
		}

		/*  ------ contents ----- */
		.clubContents {
			margin-bottom: 9rem;
		}
		#enterRoom{
		cursor:pointer;
		}
		
	</style>
</head>

<body>
	<div class="container">
		<div class="contentBox">
			<!-- ------------------------ search Title ----------------------- -->
			<div class="row searchTitle">
				<div class="col-12">
					<h3>SEARCH</h3>
					<span>검색하신 "${keyword}"에 대한 결과입니다</span>
				</div>
			</div>
			<!-- ------------------------ search Book ------------------------ -->
			<!-- ------------------------ Book title ------------------------- -->
			<div class="row searchBookTitle">
				<div class="col-12">
					<h3>BOOK</h3>
				</div>
			</div>
			<!-- ------------------------ Book content _ 참고용 레이아웃 ----------------------- -->
			
			<c:forEach items="${search}" var="dto" begin="0" end="11">
			<div class="bookContents row d-flex ">
				<div class="col-3 p-0 d-flex justify-content-center">
					<div class="card" style="width: 18rem;">
						
						<a href="${dto.link}">
						<img src="${dto.cover}"  class="card-img-top" alt="...">
						</a>
						<div class="card-body">
							<h4 class="card-title">${dto.title}</h4>	
						</div>
					</div>
				</div>
			</div>
			
			</c:forEach>
			


			<!-- ------------------------ search Club ------------------------ -->
			<!-- ------------------------ Club title ------------------------- -->
			<div class="row searchClubTitle">
				<div class="col-12">
					<h3>BookClub</h3>
				</div>
			</div>
			<!-- ------------------------ Club content _layout 참고용 ----------------------- -->
		
		<c:choose>
			
			<c:when test="${club.size() == 0}">
				<div>
				<p> 해당 검색어와 관련된 클럽이 없습니다.</p>
				</div>
			</c:when>
			<c:otherwise>
			<c:forEach items="${club}" var="dto">
			
			<div class="clubContents row d-flex ">
				<div class="col-3 p-0 d-flex justify-content-center">
					<div class="card" style="width: 18rem;">
						<div id = "enterRoom">
						<img src="${dto.book_cover}" class="card-img-top" alt="...">
						</div>
						<input type="hidden" id="room_id" value="${dto.room_id}">
						<div class="card-body">
							<h4 class="card-title">[${dto.place}] ${dto.room_title}</h4>
							<p class="card-text">모집기간 : ${dto.recruit_start} ~ ${dto.recruit_end} <br>
							</p>
						</div>
					</div>
				</div>
			</div>
			
			</c:forEach>			
			</c:otherwise>
	  
	  </c:choose>
		
			
	
			<!-- ------------------------ Club content _  ----------------------- -->
			<!--
				    <c:forEach items="${clubList}" var="dto" begin="0" end="3">  
                        <c:if test="${dto.room_status == '모집중'}">
             				<div class="col-3 p-0 d-flex justify-content-center">
                 				<div class="card" style="width: 14rem;">
                     				<img src="${dto.book_cover}" class="card-img-top" 
                     				alt="..." style="height: 15.5rem;">
                     				<div class="card-body">
				                        <h5 class="card-title">[${dto.place}] ${dto.room_title}</h5>
				                        <p class="card-text">
				                           모집기간 : <br>${dto.recruit_start}~${dto.recruit_end}
				                        </p>
                     				</div>
                 				</div>
              				</div>   
                      </c:if>
                   </c:forEach>

			-->

		</div>
	</div>
</body>
<script>
	$("#enterRoom").on("click", function(){
		let loginSession = '${loginSession}';
		
		if(loginSession == ""){
			alert("로그인 후 이용해주세요");
			return false;
		}	
		location.href = "/club/detailView?room_id="+$("#room_id").val();
	})
</script>





</html>