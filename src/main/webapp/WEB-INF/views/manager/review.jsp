<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.6.0.js"
	integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
	crossorigin="anonymous"></script>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<head>
<meta charset="UTF-8">
<title>리뷰 관리</title>
<style>
/*공백*/
.empty{
    height:30px;
}

/*버튼*/
.searchBtn{
    margin:2px;
    width:50px;
    height:30px;
}


/*leftBox*/
h6{
    margin:10px;
    padding:2px;
    
}
a{
	text-decoration:none;
	color:black;
}

/*rightBox*/
.selectBox{
    margin:1px;
}
.inputContent{
    margin:1px;
}
</style>
</head>
<body>
    <div class="empty"></div>
    <div class="container">
        <h2>관리자</h2>
        <hr text-align:center>
        <div class="row">
            <div class="col-3 p-4 leftPage">
                <div class="row">
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
                    <form id="searchReviewForm">
                    <div class="row">
                        <div class="col-5">
                            <h3>리뷰관리</h3>
                        </div>
                        <div class="col-7 p-3 d-flex justify-content-end">
                            <select name="category" class="selectBox">
                                <option name="nickname" value="nickname">작성자</option>
                                <option name="book_title" value="book_title">책이름</option>
                                <option name="review_title" value="review_title">제목</option>
                            </select>
                            <input type="text" placeholder="내용을 입력해주세요" class="inputContent" name="keyword">
                            <button type="button" class="searchBtn">검색</button>
                        </div>
                    </div>
                    </form>
                    <table class="table table-hover">
                        <thead class="table-secondary">
                        <tr>
                            <th>책이름</th>
                            <th>게시글 제목</th>
                            <th>작성자</th>
                            <th>작성일자</th>
                            <th>개별</th>
                            <th>
                                <input type="checkbox" id="allCheck">
                            </th>
                        </tr>
                        </thead>
                        <tbody>
                        	<c:if test="${list.size() == 0}">
                        		<tr>
                        			<td colspan ="6">등록된 리뷰가 없습니다.</td>
                        		</tr>
                        	</c:if>
                        	<c:if test="${list.size() > 0}">
                        		<c:forEach items="${list}" var="dto">
                        			<tr>
                                        <td>${dto.book_title}</td>
										<td>${dto.review_title}</td>
										<td>${dto.nickname}</td>
										<td>${dto.written_date}</td>
										<td>
											<button type="button" class="deleteBtn" value="${dto.review_no}">삭제</button>
										</td>
										<td><input type="checkbox" class="checkReview" value="${dto.review_no}" name="review_no"></td>
									</tr>
                      			</c:forEach>
                        	</c:if>
                        </tbody>
                    </table>
                    <div class="row">
                        <div class="col-12 d-flex justify-content-end">
                            <button type="button" class="deleteAllBtn">전체 삭제</button>
                        </div>
                    </div>
                </div>
            </div>
        </div> 
        
        <script>
        $("#allCheck").on("click", function(){ //전체 선택, 해제
            if(this.checked){ 
                $(".checkReview").prop("checked" , true);
                $(".checkReview").click(function(e){
                    e.preventDefault();
                });
            }else{
                $(".checkReview").prop("checked", false);
                $(".checkReview").unbind();
            }
        })
        
        //리뷰 개별 삭제
        $(".deleteBtn").on("click", function(){
        	location.href = "/manager/deleteReview?review_no="+this.value;
        })
        
        //리뷰 전체선택 삭제
// 		$(".deleteAllBtn").on("click",function(){
// 			let deleteArr = [];
// 			let noArr = $(".checkReview:checked");
			
// 			for(let review_no of noArr){
// 				deleteArr.push(review_no.value);
// 			}
			
// 			if(deleteArr.length > 0 ){
// 				$.ajax({
// 					url:"/manager/deleteAllReview"
// 					, type : "post"
// 					, data : ("review[]" : deleteArr)
// 					, success : function(){
// 						location.href="/manager/review";
// 					}, error : function(e){
// 						console.log(e);
// 					}
// 				})
// 			}else{
// 				alert("선택된 리뷰가 없습니다.")
// 			}
			
			
// 		})
        
        
        //리뷰 검색
        $(".searchBtn").on("click", function(){
        	let data = $("#searchReviewForm").serialize();
        	console.log(data);
        	
        	$.ajax({
        		url: "/manager/searchReview"
        		, type: "get"
        		, data: data
        		, success: function(data){
        			console.log(data);
        			makeDynamicEl(data);
        		},error : function(e){
        			console.log(e);
        		}
        	})
        })
        
        function makeDynamicEl(data){
        	$("tbody").empty();
        	if(data.length == 0){
        		let tr = $("<tr>");
        		let td = $("<td colspan=6>").append("검색 결과가 없습니다.");
        		tr.append(td);
        		tr.appendTo("tbody");
        	}else{
        		for (let dto of data){
        			 let tr=$("<tr>");
        			 let td1 = $("<td>").append(dto.book_title);
        			 let td2 = $("<td>").append(dto.review_title);
        			 let td3 = $("<td>").append(dto.nickname);
        			 let td4 = $("<td>").append(dto.written_date);
        			 let deleteBtn = $("<button>").attr({
        				 type: "button"
        				 , class : "deleteBtn"
        				 , value : dto.review_no
        			 }).append("삭제");
        			 let td5 = $("<td>").append(deleteBtn);
        			 let checkReview = $("<input>").attr({
        				 type: "checkbox"
        				 , class : "checkReview"
        				 , value : dto.review_no
        			 });
        			 let td6 = $("<td>").append(checkReview);
        			 
        			 tr.append(td1, td2, td3, td4, td5, td6);
        			 tr.appendTo("tbody");
        		}
        	}
        }
        
        
        
        
        </script>
        
</body>
</html>