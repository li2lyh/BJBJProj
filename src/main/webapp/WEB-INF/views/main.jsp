<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html lang="en">

<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Main</title>
<%-- CDN --%>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2"
	crossorigin="anonymous"></script>
<style>
/* ******** 전체 기준 ******** */
.container {
	margin-bottom: 1.5rem;
}
.content-container {
	font-size: 20px;
	margin-top: 3rem;
	margin-bottom: 5rem;
	padding-left: 6rem;
	padding-right: 6rem;
}


/* ******** BookClub 영역 ******** */
/*.contentBox*/
.contentBox .clubTitle{
	margin-top : 3rem;
}

/* title */
.clubTitle h1 {
	font-size : 2rem;
	font-weight: bold;
}

/* ******** Review 영역 ******** */
/*contentBox*/
.contentBox .reviewTitle{
	margin-top : 5rem;
}

/* title */
.reviewTitle h1 {
	font-size : 2rem;
	font-weight: bold;
}

/* ******** 더보기 버튼 _공통******** */
.content-container .moreBtnBox {
	margin-top: 1.5rem;
	width: 18rem;
}

/* ******** 북클럽 ******** */
.clubCon .card-body {
	padding : 0;
}
.clubCon .card-title {
	margin-top : 0.3rem;
	margin-bottom : 0.1rem;
	font-weight: bold;
	font-size: 1.3rem;
	text-align: center;
}

.clubCon .card-text {
	padding-left : 0.5rem;
	padding-right: 0.5rem;
	font-size: 0.9rem;
}



/**************************************************************/

/* ******** 신간도서 ******** */
/* Title 영역 */
.contentBox .newBookTitle {
	margin-top : 5rem;
}

.newBookTitle h1 {
	font-size : 2rem;
	font-weight: bold;
}



/* ******** 베스트셀러 ******** */
/* Title 영역 */
.contentBox .bestBookTitle {
	margin-top : 7rem;
}

.bestBookTitle h1 {
	font-size : 2rem;
	font-weight: bold;
}


/* ******** Contents card 공통 ******** */
/* 신간도서, 베스트셀러 */
.bookBox .card {
	margin-top:1.3rem;
	margin-bottom:1.3rem;
}

.bookBox .card-title {
	font-weight: bolder;
	font-size :1rem;
	text-align:center;
	text-overflow: ellipsis;
	overflow: hidden;
	word-break: break-word;
	
	display: -webkit-box;
	-webkit-line-clamp: 2;
	-webkit-box-orient:	vertical;
}

.bookBox .card-text {
	font-size :1rem;
	text-overflow: ellipsis;
	overflow: hidden;
	word-break: break-word;
	
	display: -webkit-box;
	-webkit-line-clamp: 2;
	-webkit-box-orient:	vertical;
}


/* ******** 캐러셀 ******** */
@media ( max-width : 767px) {
	.carousel-book .carousel-inner .carousel-item>div {
		display: none;
	}
	.carousel-book .carousel-inner .carousel-item>div:first-child {
		display: block;
	}
}

.carousel-book .carousel-inner .carousel-item.active, .carousel-book .carousel-inner .carousel-item-next,
	.carousel-book .carousel-inner .carousel-item-prev {
	display: flex;
}
/* medium and up screens */
@media ( min-width : 768px) {
	.carousel-book .carousel-inner .carousel-item-end.active, .carousel-book .carousel-inner .carousel-item-next
		{
		transform: translateX(25%);
	}
	.carousel-book .carousel-inner .carousel-item-start.active,
		.carousel-book .carousel-inner .carousel-item-prev {
		transform: translateX(-25%);
	}
}

.carousel-book .carousel-inner .carousel-item-end, .carousel-book .carousel-inner .carousel-item-start
	{
	transform: translateX(0);
}

</style>
</head>

<body>
	<div class="container">
		<%-- *************************** header *************************** --%>
		<div class="header">
			<jsp:include page="/WEB-INF/views/frame/header.jsp"></jsp:include>
		</div>
	</div>
		<!-- *************************** Carousel *************************** -->
		<div class="carousel mainCarousel row">
			<div id="carouselExampleIndicators" class="carousel slide"
					data-bs-ride="true">
				<div class="carousel-indicators">
					<button type="button" data-bs-target="#carouselExampleIndicators"
							data-bs-slide-to="0" class="active" aria-current="true"
							aria-label="Slide 1"></button>
					<button type="button" data-bs-target="#carouselExampleIndicators"
							data-bs-slide-to="1" aria-label="Slide 2"></button>
				</div>
				<div class="carousel-inner">
					<div class="carousel-item active">
						<img src="/resources/images/carousel1.jpg" class="d-block w-100" alt="...">
					</div>
					<div class="carousel-item">
							<img src="/resources/images/carousel2.jpg" class="d-block w-100" alt="...">
					</div>
				</div>
				<button class="carousel-control-prev" type="button"
						data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
					<span class="carousel-control-prev-icon" aria-hidden="true"></span>
					<span class="visually-hidden">Previous</span>
				</button>
				<button class="carousel-control-next" type="button"
						data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
					<span class="carousel-control-next-icon" aria-hidden="true"></span>
					<span class="visually-hidden">Next</span>
				</button>
			</div>
		</div>
		
	<div class="container">
		<div class="content-container">
			<!-- *************************** BookClub *************************** -->
			<div class="contentBox bookClubBox row d-flex justify-content-center">
				<!-- 타이틀 -->
				<div class="clubTitle row">
					<div class="col-12">
						<h1>BookClub</h1>
					</div>
				</div>

			<!-- 북클럽 모집 컨텐츠 -->
            <div class="clubCon row d-flex ">
          
               <c:choose>
                  <c:when test="${empty clubList}">
                     <p>모집 중인 클럽이 없습니다.</p>
                  </c:when>
                  <c:otherwise>               
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
                     
                  </c:otherwise>
               
               </c:choose>
            </div>

				<!-- 더보기 버튼 -->
				<div class="moreBtnBox row">
					<button type="button" class="btn btn-outline-secondary moreBtn" id="btnBookclub">더
						보 기</button>
				</div>
			</div>


			<!-- *************************** 신간도서 Book *************************** -->
			<div class="contentBox row d-flex justify-content-center ">
				<!-- 타이틀 -->
				<div class="newBookTitle row">
					<div class="col-12">
						<h1>신간도서</h1>
					</div>
				</div>
				<!-- 캐러셀 -->

				<div class="bookBox">
					<div class="row mx-auto my-auto justify-content-center">
						<c:forEach items="${newBooks}" var="book" begin="0" end="7">
							<div class="col-lg-3 d-flex justify-content-center">
								<div class="card" style="width: 13rem; border: none">
									<a href="${book.link}"><img src="${book.cover}"
										class="card-img-top" alt="..." style="height: 16rem;"></a>
									<div class="card-body">
										<h5 class="card-title">${book.title}</h5>
										<%-- <p class="card-text">${book.description}</p> --%>
									</div>
								</div>
							</div>
						</c:forEach>
					</div>
				</div>

				<!-- *************************** 베스트셀러 Book *************************** -->
				<div class="contentBox row d-flex ">
					<!-- 타이틀 -->
					<div class="bestBookTitle row">
						<div class="col-12 ">
							<h1>베스트셀러</h1>
						</div>
					</div>

					<div class="bookBox">
						<div class="row mx-auto my-auto justify-content-center">
							<div id="recipeCarousel2" class="carousel slide carousel-book"
								data-bs-ride="carousel">
								<div class="carousel-inner" role="listbox">
									<!-- 카드 -->
									<c:forEach items="${bestBooks}" var="book" begin="0" end="0">
										<div class="carousel-item active">
											<div class="col-lg-3 d-flex justify-content-center">
												<div class="card" style="width: 13rem; border: none;">
													<img src="${book.cover}" class="card-img-top" alt="..." style="height: 16rem;">
													<div class="card-body">
														<h5 class="card-title">${book.title}</h5>
														<%-- <p class="card-text">${book.description}</p> --%>
													</div>
												</div>
											</div>
										</div>
									</c:forEach>

									<c:forEach items="${bestBooks}" var="book" begin="1">
										<div class="carousel-item">
											<div class="col-lg-3 d-flex justify-content-center">
												<div class="card" style="width: 13rem; border: none;">
													<img src="${book.cover}" class="card-img-top" alt="..." style="height: 16rem;">
													<div class="card-body">
														<h4 class="card-title">${book.title}</h4>
														<%-- <p class="card-text">${book.description}</p> --%>
													</div>
												</div>
											</div>
										</div>
									</c:forEach>
								</div>
								<!-- 버튼-->
								<a class="carousel-control-prev bg-transparent w-aut"
									href="#recipeCarousel2" role="button" data-bs-slide="prev">
									<span class="carousel-control-prev-icon" aria-hidden="true"></span>
								</a> <a class="carousel-control-next bg-transparent w-aut"
									href="#recipeCarousel2" role="button" data-bs-slide="next">
									<span class="carousel-control-next-icon" aria-hidden="true"></span>
								</a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

		<%-- *************************** footer *************************** --%>
		<div class=footer>
			<jsp:include page="/WEB-INF/views/frame/footer.jsp"></jsp:include>
		</div>
	</div>

	<script>
		/* 더보기 버튼 */
		
		$("#btnBookclub").on("click", function(){
		      let loginSession = '${loginSession}';
		      
		      if(loginSession == ""){
		         location.href = "/club/toClub";
		      }else{
		         location.href = "/club/toClubList";
		      }
		      
		   })
		
	
		/* 캐러셀 */
        let items = document.querySelectorAll('.carousel-book .carousel-item')
        items.forEach((el) => {
                        const minPerSlide = 4
                        let next = el.nextElementSibling
                        for (var i = 1; i < minPerSlide; i++) {
                            if (!next) {
                                // wrap carousel by using first child
                                next = items[0]
                            }
                            let cloneChild = next.cloneNode(true)
                            el.appendChild(cloneChild.children[0])
                            next = next.nextElementSibling
                        }
                    })
                    
                     $("#test").on("click", function(){
						location.href = "/club/toClub";
					})
   </script>
</body>

</html>