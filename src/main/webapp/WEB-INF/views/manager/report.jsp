<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<meta charset="UTF-8">
<title>신고</title>
<style>
/*공백*/
.empty{
    height:30px;
}
/*버튼*/
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
th{
	text-align:center;
}

td{
	text-align:center;
}

.selectBox{
    margin:1px;
}
.inputContent{
    margin:1px;
}
/*모달창*/
textarea{
    width:300px;
    height:250px;
    resize:none;
}
.reasonTitle{
    width:300px;
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
                    <div class="row">
                        <div class="col">
                            <h3>회원 신고</h3>
                        </div>
                    </div>
                    <table class="table table-hover MemberReport" id="memberReport">
                        <thead class="table-secondary">
                        <tr>
                            <th>신고일자</th>
                            <th>신고당한 회원</th>
                            <th>신고사유</th>
                            <th>신고자</th>
                        </tr>
                        </thead>
                        <tbody>
                        	<c:if test="${report_list.size()== 0}">
                        		<tr>
                        			<td colspan="6">등록된 회원 신고가 없습니다.</td>
                        		</tr>
                        	</c:if>
                        	<c:if test="${report_list.size() > 0}">
								<c:forEach items="${report_list}" var="dto">
									<tr>
										<td>${dto.report_date}</td>
										<td>${dto.email}</td>
										<td class="report_detail">${dto.report_detail}</td>
										<td>${dto.reporter_nickname}</td>
										<td class="d-none report_content">${dto.report_content}</td>
									</tr>
								</c:forEach>
                        	</c:if>
                        </tbody>
                    </table>
                    <div class="empty"></div>
                    <div class="row">
                        <div class="col">
                            <h3>모임 신고</h3>
                        </div>
                    </div>
                    <table class="table table-hover BookroomReport" id="roomReport">
                        <thead class="table-secondary">
                            <tr>
                                <th>신고일자</th>
                                <th>신고당한 모임명</th>
                                <th>신고 사유</th>
                                <th>신고자</th>
                                <th></th>
                            </tr>
                        </thead>
						<tbody>
							<c:if test="${report_bookroom.size() == 0}" >
								<tr>
									<td colspan="6">등록된 모임 신고가 없습니다.</td>
								</tr>
							</c:if>
							<c:if test="${report_bookroom.size() > 0 }">
								<c:forEach items="${report_bookroom}" var="report_bookroom">
									<tr>
									<td>${report_bookroom.report_date}</td>
									<td>${report_bookroom.room_title}</td>
									<td class="d-none room_id">${report_bookroom.room_id}</td>
									<td class="bookroom_detail">${report_bookroom.report_detail}</td>
									<td>${report_bookroom.reporter_nickname}</td>
									<td class="d-none report_contentBR">${report_bookroom.report_content}</td>
									<td>
										<button type="button" class="deleteBookroom" value="${report_bookroom.room_id}">모임삭제</button>
									</td>
									</tr>
								</c:forEach>
							</c:if>
						</tbody>
                    </table>
                </div>
            </div>
        </div> 
        
        <!-- 회원 신고 모달 -->
            <div class="modal reportmodal" tabindex="-1">
                <div class="modal-dialog">
                  <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title">회원 신고</h5>
                        <button type="button" class="btn-close" id="closeBtn" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                      <div class="row p-2">
                        <div class="col-3">신고 사유</div>
                        <div class="col-9">
                            <input type="text" name="report_detail" id="report_detail" class="reasonTitle" readonly>
                        </div>
                      </div>
                      <div class="row p-2">
                        <div class="col-3">상세 설명</div>
                        <div class="col-9 contentBox">
                            <textarea id="report_content" name="report_content" readonly></textarea>
                        </div>
                      </div>
                    </div>
                    
                    <div class="col-12 d-flex justify-content-center modal-footer">
                      <button type="button" class="btn btn-secondary deleteReport" id="deleteMemBtn" data-bs-dismiss="modal" >신고삭제</button>
							<c:set var ="checkreport" value="false" />
							<c:forEach items = "${report_list}" var="reportlist">
								<c:if test="${reportlist.report_action == 0}">
									<c:set var ="checkreport" value="true" />
								</c:if>
							</c:forEach>
							<c:if test="${checkreport}">
								<button type="button" class="btn btn-primary" id="addBtn" value="${dto.email}">경고추가</button>
							</c:if>
							<c:if test="${not checkreport}">
								<button type="button" class="btn btn-primary" id="addBtn" value="${dto.email}" disabled="disabled">경고추가</button>
							</c:if>
                    </div>
                  </div>
                </div>
              </div>
            
        
         <!-- 모임 신고 모달 -->
            <div class="modal bookroomModal" tabindex="-1">
                <div class="modal-dialog">
                  <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title">모임 신고</h5>
                        <button type="button" class="btn-close" id="closeBtn" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                      <div class="row p-2">
                        <div class="col-3">신고 사유</div>
                        <div class="col-9">
                            <input type="text" class="reasonTitle" id="report_detailBR"readonly>
                        </div>
                      </div>
                      <div class="row p-2">
                        <div class="col-3">상세 설명</div>
                        <div class="col-9 contentBox">
                            <textarea id="report_contentBR" readonly></textarea>
                        </div>
                      </div>
                    </div>
                    <div class="col-12 d-flex justify-content-center modal-footer">
                      <button type="button" class="btn btn-secondary" id="deleteBRBtn" data-bs-dismiss="modal">신고삭제</button>
                      
                    </div>
                  </div>
                </div>
              </div>
         </div>  
        
        <script>
       //모임삭제  
        $(".deleteBookroom").on("click", function(){
        	let del = confirm("모임을 삭제하시겠습니까?");
        	if(del){
        		location.href = "/manager/deleteEachBookroom?room_id="+this.value;
        	}
        })
       
        //회원 신고 모달 열기
        $(".report_detail").on("click", function(){
        	let report_detail = $(this).html(); // 사유
        	let report_content = $(this).nextAll(".report_content").html()//상세 설명
        	let email = $(this).prev("td").html();
        	$("#report_detail").val(report_detail);
        	$("#report_content").val(report_content);
        	$("#deleteMemBtn").val(email);
        	$("#addBtn").val(email);
        	$(".reportmodal").show();
        	console.log(email);
        })      
        //회원 신고 쪽지 모달 닫기
        $(".btn-close").on("click", function(){
        	$(".reportmodal").hide();
        })
        
        //모임 신고 모달 열기
        $(".bookroom_detail").on("click", function(){
        	let report_detailBR = $(this).html();
        	let report_contentBR = $(this).nextAll(".report_contentBR").html();
			let room_id = $(this).prevAll("td").html();
        	$("#report_detailBR").val(report_detailBR);
			$("#report_contentBR").val(report_contentBR);
			$("#deleteBRBtn").val(room_id);
			$("#addBRBtn").val(room_id);
        	$(".bookroomModal").show();
        	console.log(room_id);
        	
        })
        //모임 신고 모달 닫기
        $(".btn-close").on("click", function(){
        	$(".bookroomModal").hide();
        })
        
        //회원 신고 삭제 (모달창에서)
        $("#deleteMemBtn").on("click", function(e){
        	let del1 = confirm("정말 삭제하시겠습니까?");
        	if(del1){
        		location.href= "/manager/deleteReport?email="+this.value;
        	}
        })
        //모임 신고 삭제 (모달창에서)
        $("#deleteBRBtn").on("click", function(e){
        	let del2 = confirm("정말 삭제하시겠습니까?");
        	if(del2){
        		location.href = "/manager/deleteReportBookroom?room_id="+this.value;
        	}   	
        })
        
        //회원 신고 - 경고 추가(모달창에서)
		$("#addBtn").on("click", function(){
			location.href="/manager/addReport?email="+this.value;
		})
        
        
 
        </script>
        
        
</body>

</html>