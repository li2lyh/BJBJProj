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
                    <table class="table table-hover report" id="memberReport">
                        <thead class="table-secondary">
                        <tr>
                            <th>신고일자</th>
                            <th>ID</th>
                            <th>신고사유</th>
                            <th>신고자</th>
                            <th>조치</th>
                        </tr>
                        </thead>
                        <tbody>
                        	<c:if test="${list.size()== 0}">
                        		<tr>
                        			<td colspan="6">등록된 회원 신고가 없습니다.</td>
                        		</tr>
                        	</c:if>
                        	<c:if test="${list.size() > 0}">
								<c:forEach items="${list}" var="dto">
									<tr>
										<td>신고일자</td>
										<td>${dto.email}</td>
										<td><a href=""></a></td>
										<td>신고자</td>
										<td>조치</td>
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
                    <table class="table table-hover report" id="roomReport">
                        <thead class="table-secondary">
                            <tr>
                                <th>신고일자</th>
                                <th>모임명</th>
                                <th>신고사유</th>
                                <th>신고자</th>
                                <th>조치</th>
                            </tr>
                        </thead>
						<tbody>
							<c:if test="${list.size() == 0}" >
								<tr>
									<td colspan="6">등록된 모임 신고가 없습니다.</td>
								</tr>
							</c:if>
							<c:if test="${list.size() > 0 }">
								<c:forEach items="${list}" var="dto">
									<td>신고일자</td>
									<td>${dto.room_title}</td>
									<td>신고사유</td>
									<td>신고자</td>
									<td>조치</td>
								</c:forEach>
							</c:if>
						</tbody>
                    </table>
                </div>
            </div>
        </div> 
        
                <!-- 신고 모달 -->
        <form id="ReportForm" action="#" method="get">
            <div class="modal" tabindex="-1">
                <div class="modal-dialog">
                  <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title">신고</h5>
                        <button type="button" class="btn-close" id="closeBtn" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                      <div class="row p-2">
                        <div class="col-3">신고 사유</div>
                        <div class="col-9">
                            <input type="text" class="reasonTitle" readonly >
                        </div>
                      </div>
                      <div class="row p-2">
                        <div class="col-3">상세 설명</div>
                        <div class="col-9 contentBox">
                            <textarea readonly></textarea>
                        </div>
                      </div>
                    </div>
                    <div class="col-12 d-flex justify-content-center modal-footer">
                      <button type="button" class="btn btn-secondary" id="deleteBtn" data-bs-dismiss="modal">신고삭제</button>
                      <button type="button" class="btn btn-primary" id="addBtn">경고추가</button>
                    </div>
                  </div>
                </div>
              </div>
            </form>
        
        <script>
        //회원 신고 모달
        $(".report").on("click", "td", function () {
            $(".modal").show();
        })
        //회원 신고 쪽지 모달 닫기
        document.getElementById("closeBtn").onclick = function () {
            $(".modal").hide();
        }
        //회원 신고 폼 전송 
        $("#addBtn").on("click", function () {
            $("#ReportForm").submit();
        })
        </script>
        
        
</body>

</html>