<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%-- <%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%> --%>
<<<<<<< HEAD
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
=======
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
>>>>>>> 6978c39d30bf637f86b6c6ad5f0d814c6c959b6f

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<script	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
<title>모집게시판</title>
<style>
#head {
	border-bottom: 1px solid lightgray;
	text-align: left;
}

h4 {
	text-align: left;
}

#btnBox {
	text-align: right;
}

.card {
	margin-top: 50px;
	margin-bottom: 50px;
}

.card-body {
	text-align: center;
	padding-bottom: 0;
}

.cardBox {
	size: 80%;
}

.card-img-top {
	height: 15rem;
	object-fit: fill;
}

.card-text {
	margin-bottom: 20px;
}

.inform {
	margin-bottom: 0;
}

#tagBox {
	text-align: center;
	background-color: rgb(56, 177, 137);
	width: 90px;
	text-decoration: none;
	border-radius: 10px;
	color: white;
	text-decoration: none;
	margin-left: 68%;
	position: absolute;
	top: 85%;
	object-fit: cover;
}

#cardImg {
	position: relative;
}

/* 빈 하트 */
#emptyLike{
	width: 30px;
	height: 25px;
}


</style>

</head>
<body>
	<div class="container">

		<div class="row">
			<div class="col">
				<h3 id="head">BookClub</h3>
			</div>
		</div>
		<div class="row">
			<div class="col">
				<h4>모집 중 클럽</h4>
			</div>
		</div>

		<div class="row">

			<c:if test="${list.size() == 0 }">
				<div>등록된 클럽이 없습니다</div>
			</c:if>

			<c:if test="${list.size() > 0 }">
				<c:forEach items="${list}" var="dto">
					<c:if test="${dto.room_status == '모집중' }">
						<div class="col-6 col-lg-3 d-flex justify-content-center cardBox">
							<div class="card" style="width: 18rem;">
								<a id="cardImg" href="/club/detailView?room_id=${dto.room_id}"
									name="${dto.room_id}"> <c:choose>
										<c:when test="${dto.book_cover eq null}">
											<img src="/resources/images/noImg.png" class="card-img-top">
										</c:when>
										<c:otherwise>
											<img src="${dto.book_cover}" class="card-img-top">
										</c:otherwise>
									</c:choose>
									<div id="tagBox">${dto.tag}</div>
								</a>
								<div class="card-body">
									
									
									<h5 class="card-text">${dto.room_title}</h5>
									<p class="inform">
										시작일 : ${dto.open_date} <br> ${dto.room_current} /
										${dto.room_people} 명 | 주 ${dto.meet_week}회 | ${dto.place}지역
									</p>
							
							
								</div>
							</div>
						</div>
					</c:if>
				</c:forEach>
			</c:if>
		</div>

		<div class="row">
      <div class="col" id="btnBox">
          <button type="button" class="btn btn-secondary btn-lg" id="btnClass">모집 글 쓰기</button>
      </div>
    </div>
	</div>
	<script>
		$("#btnClass").on("click", function() {
			let loginSession = '${loginSession}';
			let role = '${role}';
			let waiting = '${waiting}';
			
			// 비로그인 상태 일 때
			if(loginSession == ""){
				alert("로그인이 필요합니다.");
				return false;
			}
			// 이미 모임을 가지고 있을 때(role)
			if(role != ""){
				alert("이미 참여 중인 모임이 있습니다.");
				return false;
			}

			// 모임을 신청한 상태 일 때 (waiting)
			if(waiting != ""){
				alert("지원 중인 모임이 있습니다. 지원한 모임의 리더 혹은 관리자에게 문의하세요");
				return false;
			}

		location.href = "/club/toWrite";
			
		})
		
		
	</script>
<<<<<<< HEAD
        <div class="row">
            <div class="col">
                <h3 id="head">BookClub</h3>
            </div>
        </div>
        <div class="row">
            <div class="col">
                <h4>모집 중 클럽</h4>
            </div>
        </div>

        <div class="row">
          
          <c:if test="${list.size() == 0 }">
       	<div> 등록된 클럽이 없습니다 </div>
          </c:if>
          
          <c:if test="${list.size() > 0 }">
          	<c:forEach items="${list}" var="dto">
       
      		 <div class="col-6 col-lg-3 d-flex justify-content-center cardBox">
                <div class="card" style="width: 18rem;">
                    <a href="/club/detailView?room_id=${dto.room_id}">
                         <img src="" class="card-img-top">
                    </a>
                    <div class="card-body">
                        <h5 class="card-text">${dto.room_title}</h5>
                        <p class="inform">${dto.open_date} 시작 / ${dto.room_people}명 / 주 ${dto.meet_week}회 / ${dto.place}지역</p>
                    </div>
                </div>
           </div> 
       
    	   </c:forEach>
          </c:if>
          
               
        </div>

        <div class="row">
            <div class="col" id="btnBox">
                <button type="button" class="btn btn-secondary btn-lg" id="btnClass">모집 글 쓰기</button>
            </div>
        </div>

    </div>
	<script>
	
		$("#btnClass").on("click", function(){
			location.href = "/club/toWrite";
		})
	
	</script>
=======
>>>>>>> 6978c39d30bf637f86b6c6ad5f0d814c6c959b6f
</body>
</html>