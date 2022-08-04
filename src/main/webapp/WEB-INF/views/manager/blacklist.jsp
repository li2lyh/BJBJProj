<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<meta charset="UTF-8">
<title>블랙리스트</title>
<style>

/*폰트*/
@font-face {
    font-family: 'MapoGoldenPier';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/MapoGoldenPierA.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}

@import url(//fonts.googleapis.com/earlyaccess/nanumgothiccoding.css);

.nanumgothiccoding * {
 font-family: 'Nanum Gothic Coding', monospace;
}

*{
	font-family : 'MapoGoldenPier';
}
/*버튼*/
.searchBtn {
	margin: 2px;
	width: 50px;
	height: 30px;
	color:white;
	background-color:black;
}
.deleteBtn{
	margin: 2px;
	width: 50px;
	height: 30px;
	color:black;
	background-color:white;	
	border-color:gray;
}

/*leftBox*/
.leftPageBox h5{
	margin: 5px;
}
.leftPageBox h6{
	margin: 8px;
}

.leftPageBox a {
	text-decoration: none;
	color: black;
}

/*rightBox*/
.rightPage th{
	font-family : 'Nanum Gothic Coding' ;
	text-align:center;
}

.rightPage td{
	font-family : 'Nanum Gothic Coding';
	text-align:center;
}

.selectBox {
	margin: 1px;
}

.inputContent {
	margin: 1px;
}
</style>
</head>
<body>
	<div class="container">
		<!-- header -->
		<div class="header">
		<jsp:include page="/WEB-INF/views/frame/header.jsp"></jsp:include>
		</div>
	
		<h2>관리자</h2>
		<hr text-align:center>
		<div class="row">
            <div class="col-3 p-4 leftPage">
                <div class="row leftPageBox">
                    <h5>회원관리</h5>
                    <h6><a href="/manager/toAllmember">전체 회원</a></h6>
                    <h6><a href="/manager/toblacklist">블랙리스트</a></h6>
                    <h5>모임관리</h5>
                    <h6><a href="/manager/toAllclub">전체모임</a></h6>
                    <h5>게시글 관리</h5>
                    <h6><a href="/manager/toReview">리뷰관리</a></h6>
                    <h5><a href="/manager/toReport">신고</a></h5>
                </div>
            </div>
				<div class="col-9 rightPage">
					<div class="reportContainer">
						<form id="searchBlackForm">
						<div class="row">
							<div class="col-5">
								<h3>블랙리스트</h3>
							</div>
							<div class="col-7 p-3 d-flex justify-content-end">
								<select name="category" class="selectBox">
									<option name="email" value="email">아이디</option>
									<option name="name" value="name">이름</option>
									<option name="nickname" value="nickname">닉네임</option>
								</select> 
								<input type="text" placeholder="내용을 입력해주세요" name="keyword" class="inputContent">
								<button type="button" class="searchBtn">검색</button>
							</div>
						</div>
						</form>
						<div style="width:100%; height:500px; overflow:auto">
						<table class="table table-hover">
							<thead class="table">
								<tr>
									<th>회원 아이디</th>
									<th>이름</th>
									<th>닉네임</th>
									<th>사유</th>
									<th>해제</th>
								</tr>
							</thead>
							<tbody class="blacklistBody">
								<c:if test="${list.size() == 0}">
									<tr>
										<td colspan="6">등록된 블랙리스트가 없습니다.</td>
									</tr>
								</c:if>
								<c:if test="${list.size() > 0}">
									<c:forEach items="${list}" var="dto">
										<tr>
											<td>${dto.email}</td>
											<td>${dto.name}</td>
											<td>${dto.nickname}</td>
											<td>${dto.black_detail}</td>
											<td>
												<button type="button" class="deleteBtn" value="${dto.email}">해제</button>
											</td>
										</tr>
									</c:forEach>
								</c:if>
							</tbody>
						</table>
						</div>

					</div>
				</div>
			</div>
		<!-- footer -->
		<div class=footer>
		<jsp:include page="/WEB-INF/views/frame/footer.jsp"></jsp:include>
		</div>
			</div>
			<script>
			
		//블랙리스트 해제
		$(".blacklistBody").on("click",".deleteBtn", function(){
			alert("정말 해제하시겠습니까?");
			location.href = "/manager/deleteBlacklist?email="+this.value
		})


		//검색
		$(".searchBtn").on("click", function(){
			let data = $("#searchBlackForm").serialize();
			console.log(data);
			
			$.ajax({
				url:"/manager/searchBlacklist"
				, type: "get"
				, data: data
				, success : function(data){
					console.log(data)
					makeDynamicEl(data);
				},error : function(e){
					console.log(e);
				}
			});
		})
		
		function makeDynamicEl(data){
			$("tbody").empty();
			if(data.length == 0){
				let tr = $("<tr>");
				let td = $("<td colspan=5>").append("검색 결과가 없습니다.");
				tr.append(td);
				tr.appendTo("tbody");
			}else{
				for(let dto of data){
					let tr=$("<tr>");
					let td1=$("<td>").append(dto.email);
					let td2=$("<td>").append(dto.name);
					let td3=$("<td>").append(dto.nickname);
					let td4=$("<td>").append(dto.black_detail);
					let deleteBtn = $("<button>").attr({
						type : "button"
						, class : "deleteBtn"
						, value : dto.email
					}).append("해제");
					let td5 = $("<td>").append(deleteBtn);
					
					tr.append(td1,td2,td3,td4,td5);
					tr.appendTo("tbody");
				}
			}
		}
		
	</script>
</body>
</html>