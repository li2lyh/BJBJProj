<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
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
<style>
/* ******** 기준 ******** */
body {
	font-size: 20px;
	margin-top: 5rem;
	margin-bottom: 10rem;
}

/* ******** 공통 ******** */
.contentBox {
	margin-top: 4rem;
}

/* ******** 캐러셀 ******** */

/* .bookContainer {
            width: 100%;
            height: 100%;
            display: flex;
            justify-content: center;
            align-items: center;
        } */
@media ( max-width : 767px) {
	.carousel-inner .carousel-item>div {
		display: none;
	}
	.carousel-inner .carousel-item>div:first-child {
		display: block;
	}
}

.carousel-inner .carousel-item.active, .carousel-inner .carousel-item-next,
	.carousel-inner .carousel-item-prev {
	display: flex;
}

/* medium and up screens */
@media ( min-width : 768px) {
	.carousel-inner .carousel-item-end.active, .carousel-inner .carousel-item-next
		{
		transform: translateX(25%);
	}
	.carousel-inner .carousel-item-start.active, .carousel-inner .carousel-item-prev
		{
		transform: translateX(-25%);
	}
}

.carousel-inner .carousel-item-end, .carousel-inner .carousel-item-start
	{
	transform: translateX(0);
}

/* ******** 더보기 버튼 ******** */
.moreBtnBox {
	margin-top: 1.5rem;
	width: 13rem;
}
</style>
</head>

<body>
	<div class="container">

		<%-- *************************** header *************************** --%>
		<div class="header">
			<jsp:include page="/WEB-INF/views/frame/header.jsp"></jsp:include>
		</div>


		<!-- *************************** Carousel *************************** -->
		<!-- <div class="carousel row">
            <div id="carouselExampleIndicators" class="carousel slide" data-bs-ride="true">
                <div class="carousel-indicators">
                    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0"
                        class="active" aria-current="true" aria-label="Slide 1"></button>
                    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1"
                        aria-label="Slide 2"></button>
                    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2"
                        aria-label="Slide 3"></button>
                </div>
                <div class="carousel-inner">
                    <div class="carousel-item active">
                        <img src="/media/1.jpg" class="d-block w-100" alt="...">
                    </div>
                    <div class="carousel-item">
                        <img src="/media/2.jpg" class="d-block w-100" alt="...">
                    </div>
                    <div class="carousel-item">
                        <img src="/media/3.jpg" class="d-block w-100" alt="...">
                    </div>
                </div>
                <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators"
                    data-bs-slide="prev">
                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                    <span class="visually-hidden">Previous</span>
                </button>
                <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators"
                    data-bs-slide="next">
                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                    <span class="visually-hidden">Next</span>
                </button>
            </div>
        </div> -->

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
				<div class="col-3 p-0 d-flex justify-content-center">
					<div class="card" style="width: 18rem;">
						<img src="/media/4.jpg" class="card-img-top" alt="...">
						<div class="card-body">
							<h4 class="card-title">[위치] Title</h4>
							<p class="card-text">
								모집기간 : 00.00 ~ 00.00 <br> 모임기간 : 00.00 ~ 00.00
							</p>
						</div>
					</div>
				</div>
				<div class="col-3 p-0 d-flex justify-content-center">
					<div class="card" style="width: 18rem;">
						<img src="/media/4.jpg" class="card-img-top" alt="...">
						<div class="card-body">
							<h4 class="card-title">[위치] Title</h4>
							<p class="card-text">
								모집기간 : 00.00 ~ 00.00 <br> 모임기간 : 00.00 ~ 00.00
							</p>
						</div>
					</div>
				</div>
				<div class="col-3 p-0 d-flex justify-content-center">
					<div class="card" style="width: 18rem;">
						<img src="/media/4.jpg" class="card-img-top" alt="...">
						<div class="card-body">
							<h4 class="card-title">[위치] Title</h4>
							<p class="card-text">
								모집기간 : 00.00 ~ 00.00 <br> 모임기간 : 00.00 ~ 00.00
							</p>
						</div>
					</div>
				</div>
				<div class="col-3 p-0 d-flex justify-content-center">
					<div class="card" style="width: 18rem;">
						<img src="/media/4.jpg" class="card-img-top" alt="...">
						<div class="card-body">
							<h4 class="card-title">[위치] Title</h4>
							<p class="card-text">
								모집기간 : 00.00 ~ 00.00 <br> 모임기간 : 00.00 ~ 00.00
							</p>
						</div>
					</div>
				</div>
			</div>

			<!-- 더보기 버튼 -->
			<div class="moreBtnBox row">
				<button type="button" class="btn btn-secondary moreBtn" id="">더
					보 기</button>
			</div>
		</div>

		<!-- *************************** Review *************************** -->
		<div class="contentBox reviewBox row d-flex justify-content-center">
			<!-- 타이틀 -->
			<div class="reviewTitle row">
				<div class="col-12">
					<h1>Review</h1>
				</div>
			</div>

			<!-- 북클럽 모집 컨텐츠 -->
			<div class="reviewCon row d-flex ">
				<div class="col-3 p-0 d-flex justify-content-center">
					<div class="card" style="width: 18rem;">
						<img src="/media/4.jpg" class="card-img-top" alt="...">
						<div class="card-body">
							<h4 class="card-title">책 제목</h4>
							<p class="card-text"></p>
						</div>
					</div>
				</div>
				<div class="col-3 p-0 d-flex justify-content-center">
					<div class="card" style="width: 18rem;">
						<img src="/media/4.jpg" class="card-img-top" alt="...">
						<div class="card-body">
							<h4 class="card-title">책 제목</h4>
							<p class="card-text"></p>
						</div>
					</div>
				</div>
				<div class="col-3 p-0 d-flex justify-content-center">
					<div class="card" style="width: 18rem;">
						<img src="/media/4.jpg" class="card-img-top" alt="...">
						<div class="card-body">
							<h4 class="card-title">책 제목</h4>
							<p class="card-text"></p>
						</div>
					</div>
				</div>
				<div class="col-3 p-0 d-flex justify-content-center">
					<div class="card" style="width: 18rem;">
						<img src="/media/4.jpg" class="card-img-top" alt="...">
						<div class="card-body">
							<h4 class="card-title">책 제목</h4>
							<p class="card-text"></p>
						</div>
					</div>
				</div>
			</div>

			<!-- 더보기 버튼 -->
			<div class="moreBtnBox row">
				<button type="button" class="btn btn-secondary moreBtn" id="">더
					보 기</button>
			</div>
		</div>

		<!-- *************************** 신간도서 Book *************************** -->
		<div class="contentBox reviewCon row d-flex justify-content-center ">
			<!-- 타이틀 -->
			<div class="newBook row">
				<div class="col-12">
					<h1>신간도서</h1>
				</div>
			</div>
			<!-- 캐러셀 -->
			<div class="bookBox">
				<div class="row mx-auto my-auto justify-content-center">
					<div id="recipeCarousel" class="carousel slide"
						data-bs-ride="carousel">
						<div class="carousel-inner" id="newBook" role="listbox">
							<div class="carousel-item active">
								<!-- 카드 -->
								<div class="col-lg-3">
									<div class="card" style="width: 18rem;">
										<img src="/media/4.jpg" class="card-img-top" alt="...">
										<div class="card-body">
											<h4 class="card-title">책 제목</h4>
											<p class="card-text"></p>
										</div>
									</div>
								</div>
							</div>
							<div class="carousel-item">
								<div class="col-lg-3">
									<div class="card" style="width: 18rem;">
										<img src="/media/4.jpg" class="card-img-top" alt="...">
										<div class="card-body">
											<h4 class="card-title">책 제목</h4>
											<p class="card-text"></p>
										</div>
									</div>
								</div>
							</div>
							<div class="carousel-item">
								<div class="col-lg-3">
									<div class="card" style="width: 18rem;">
										<img src="/media/4.jpg" class="card-img-top" alt="...">
										<div class="card-body">
											<h4 class="card-title">책 제목</h4>
											<p class="card-text"></p>
										</div>
									</div>
								</div>
							</div>
							<div class="carousel-item">
								<div class="col-lg-3">
									<div class="card" style="width: 18rem;">
										<img src="/media/4.jpg" class="card-img-top" alt="...">
										<div class="card-body">
											<h4 class="card-title">책 제목</h4>
											<p class="card-text"></p>
										</div>
									</div>
								</div>
							</div>
							<div class="carousel-item">
								<div class="col-lg-3">
									<div class="card" style="width: 18rem;">
										<img src="/media/4.jpg" class="card-img-top" alt="...">
										<div class="card-body">
											<h4 class="card-title">책 제목</h4>
											<p class="card-text"></p>
										</div>
									</div>
								</div>
							</div>
							<div class="carousel-item">
								<div class="col-lg-3">
									<div class="card" style="width: 18rem;">
										<img src="/media/4.jpg" class="card-img-top" alt="...">
										<div class="card-body">
											<h4 class="card-title">책 제목</h4>
											<p class="card-text"></p>
										</div>
									</div>
								</div>
							</div>
						</div>
						<!-- 버튼-->
						<a class="carousel-control-prev bg-transparent w-aut"
							href="#recipeCarousel" role="button" data-bs-slide="prev"> <span
							class="carousel-control-prev-icon" aria-hidden="true"></span>
						</a> <a class="carousel-control-next bg-transparent w-aut"
							href="#recipeCarousel" role="button" data-bs-slide="next"> <span
							class="carousel-control-next-icon" aria-hidden="true"></span>
						</a>
					</div>
				</div>
			</div>
		</div>

				<!-- *************************** 베스트셀러 Book *************************** -->
				<div class="contentBox reviewCon row d-flex ">
					<!-- 타이틀 -->
					<div class="bestBook row">
						<div class="col-12">
							<h1>베스트셀러</h1>
						</div>
					</div>

					<div class="bookBox">
						<div class="row mx-auto my-auto justify-content-center">
							<div id="recipeCarousel2" class="carousel slide"
								data-bs-ride="carousel">
								<div class="carousel-inner" role="listbox">
									<div class="carousel-item active">
										<!-- 카드 -->
										<div class="col-lg-3">
											<div class="card" style="width: 18rem;">
												<img src="/media/4.jpg" class="card-img-top" alt="...">
												<div class="card-body">
													<h4 class="card-title">책 제목</h4>
													<p class="card-text"></p>
												</div>
											</div>
										</div>
									</div>
									<div class="carousel-item">
										<div class="col-lg-3">
											<div class="card" style="width: 18rem;">
												<img src="/media/4.jpg" class="card-img-top" alt="...">
												<div class="card-body">
													<h4 class="card-title">책 제목</h4>
													<p class="card-text"></p>
												</div>
											</div>
										</div>
									</div>
									<div class="carousel-item">
										<div class="col-lg-3">
											<div class="card" style="width: 18rem;">
												<img src="/media/4.jpg" class="card-img-top" alt="...">
												<div class="card-body">
													<h4 class="card-title">책 제목</h4>
													<p class="card-text"></p>
												</div>
											</div>
										</div>
									</div>
									<div class="carousel-item">
										<div class="col-lg-3">
											<div class="card" style="width: 18rem;">
												<img src="/media/4.jpg" class="card-img-top" alt="...">
												<div class="card-body">
													<h4 class="card-title">책 제목</h4>
													<p class="card-text"></p>
												</div>
											</div>
										</div>
									</div>
									<div class="carousel-item">
										<div class="col-lg-3">
											<div class="card" style="width: 18rem;">
												<img src="/media/4.jpg" class="card-img-top" alt="...">
												<div class="card-body">
													<h4 class="card-title">책 제목</h4>
													<p class="card-text"></p>
												</div>
											</div>
										</div>
									</div>
									<div class="carousel-item">
										<div class="col-lg-3">
											<div class="card" style="width: 18rem;">
												<img src="/media/4.jpg" class="card-img-top" alt="...">
												<div class="card-body">
													<h4 class="card-title">책 제목</h4>
													<p class="card-text"></p>
												</div>
											</div>
										</div>
									</div>
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
					<%-- *************************** footer *************************** --%>
					 
					<div class="footer">
						<jsp:include page="/WEB-INF/views/frame/footer.jsp"></jsp:include>
					</div> 
				</div>
				<script
					src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"
					integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2"
					crossorigin="anonymous"></script>
				<script>
                    let items = document.querySelectorAll('.carousel .carousel-item')

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
        </script>
</body>
</html>
