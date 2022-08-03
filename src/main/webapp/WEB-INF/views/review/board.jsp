<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<title>북적북적 - 도서 리뷰</title>
<style>

ul {
	padding: 10px;
}
#ulBox{
	margin-bottom:0px;
	padding-bottom:0px;
}	
#ulBox > li > a{
	text-decoration:none;
	color:black;
}
#ulBox > li > a:hover{
	font-weight:bold;
}



li {
	list-style: none;
	margin-bottom: 10px;
}

.titleBox {
	margin-bottom: 10px;
	padding-bottom:10px;
}
#headTitle{
	border-bottom: 1px solid lightgray;
	margin-bottom: 0px;
}
.contentBox {
	width: 100%;
	padding: 5px;
}

.imgBox img{
	width: 80px;
	height: 80px;
}
#reviewRow{
	border-bottom: 1px solid lightgray;
}
.btnBox{
	text-align:right;
}
#titleLi{
	font-size:1rem;
}
#etcLi span{
	font-size:1rem;
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
		<div class="titleBox" id="headTitle">
			<h1>Book Review</h1>
			<span>회원 여러분들의 소중한 리뷰를 남겨주세요!</span>
		</div>
		<table class="contentBox">
			<tbody>
				<c:if test="${empty list}">
					<p style="font-size: 30px;">작성된 리뷰가 없습니다.</p>
				</c:if>
				<c:forEach items="${list}" var="item">
				<tr id="reviewRow">
					<td width="10%">
						<div class="imgBox"
							style="margin: 5px; margin-left: 20px; margin-right: 15px;">
							<img src="/resources/images/noImg.png">

						</div>
					</td>
					<td>
						<div class="titleBox" style="margin: 5px;">
							<ul id="ulBox">
								<li id="titleLi">${item.book_title}</li>
								<li><a href="/review/detail?review_no=${item.review_no}">${item.review_title}</a></li>
								<li id="etcLi"><span>${item.nickname}</span>&nbsp; &nbsp; <span>${item.written_date}</span></li>
							</ul>
						</div>
					</td>
				</tr>
				</c:forEach>
			</tbody>
		</table>
		<div class="btnBox">
			<button type="button" class="btn btn-primary" id="btnWriteReview">작성하기</button>
		</div>
		<!------------------------------------- footer ----------------------------------------->
		<div class="footer">
			<jsp:include page="/WEB-INF/views/frame/footer.jsp"></jsp:include>
		</div>
	</div>
	<script>
		document.getElementById('btnWriteReview').onclick = function() {
			if(${loginSession == null}){
				alert("리뷰 작성을 위해서 로그인이 필요합니다.");
				return;
			}
			location.href = "/review/toWrite";
		}
	</script>
</body>
</html>