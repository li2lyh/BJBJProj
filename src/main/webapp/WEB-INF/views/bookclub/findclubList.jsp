<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%-- <%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%> --%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

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

/* 빨간 하트 */
#likeImg{
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
				<button type="button" id="clubBoard">임시 참여중인 클럽버튼(main에서 BookClub헤더 네비바 내리면 보이게)</button>
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
										<c:when test="${dto.img_id eq null}">
											<img src="/resources/images/noImg.png" class="card-img-top">
										</c:when>
										<c:otherwise>
											<img src="" class="card-img-top">
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
				<button type="button" class="btn btn-secondary btn-lg" id="btnClass">모집
					글 쓰기</button>
			</div>
		</div>

	</div>
	<script>
		$("#btnClass").on("click", function() {
			location.href = "/club/toWrite";
		})
		
		$("#clubBoard").on("click", function(){
			location.href = "/club/clubBoard?room_id="+'${role.room_id}';
		})
		
	</script>
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
                       <div class="row">
                    		<div class="col-8 d-flex justify-content-end">
                    			  <h5 class="card-text">${dto.room_title}</h5>
                    		</div>
                    		<div class="col-4">	
                				<!-- checkLike : 해당 모임을 찜한건지 아닌거지 여부를 담아줄 변수 -->
								<c:set var="checkLike" value="false"/>
								<!-- 찜 리스트를 반복문 돌리며 해당 모임이 찜한건지 아닌지 여부만 checkLike변수에 저장 -->
								<c:forEach items="${likeList}" var="like">	
									<!-- 만약 찜한 모임이라면 checkLike에 true 값을 담아 줌.-->
									<c:if test="${like.room_id eq dto.room_id}">
										<c:set var="checkLike" value="true"/>
									</c:if>																								
								</c:forEach>
								<div class="likeClub">
                    				<!-- 로그인 한 상태 -->
									<c:if test="${not empty loginSession}">
										<!-- 만약 checkLike가 트루라면 찜한 모임이니 빨간 하트 띄워주고 -->
										<c:if test="${checkLike}">
											<a href="/club/deleteLike?room_id=${dto.room_id}">
												<img src="/resources/images/likee.png" id="likeImg" onclick="return confirm('찜한 모임을 삭제 하시겠습니까?')">
											</a> 
										</c:if>
										<!-- 만약 checkLike가 펄스라면 찜한 모임이 아니니 빈 하트 띄워주고 -->
										<c:if test="${not checkLike}">
											<a href="/club/insertLike?room_id=${dto.room_id}">
												<img src="/resources/images/emptyLike.png" id="emptyLike" onclick="return confirm('선택한 모임을 찜 하시겠습니까?')">
											</a>
										</c:if>	
									</c:if>
								</div>
                    		</div>
                    		<div class="col-12 p-3">
                    			 <p class="inform">${dto.open_date} 시작 / ${dto.room_people}명 / 주 ${dto.meet_week}회 / ${dto.place}지역</p>
                    		</div>
                    	</div>         
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
</body>
</html>