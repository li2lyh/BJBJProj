<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<title>BookClub 모집</title>

<style>

        #head{
            border-bottom: 1px solid lightgray;
            text-align: left;
        }
        h4{
            text-align: left;
        }
        .btnBox{
            text-align: right;
             padding: 30px;
        }
        .imgBox{
            padding: 30px;
        }
        .contentBox{
            padding: 30px;
            padding-left: 0;
        }
        #titleDiv{
            margin-bottom: 50px;
        }
        #meetDiv{
            margin-bottom: 30px;
        }
        
        #detail{
            width: 100%;
            height: 140px;
            border:none;
        }
        textarea{
            resize: none;
        }
        #mydesc{
        	width:100%;
        	border:none;
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
                <h4>MyClub</h4>
            </div>
        </div>

        <div class="row">
            <div class="col-4 imgBox">
             <c:choose>
                <c:when test="${dto.img_id eq null}">
                  <img src="/resources/images/noImg.png" class="card-img-top">
                  </c:when>
                  <c:otherwise>
                  <img src="" class="card-img-top">
                   </c:otherwise>
                </c:choose>          
            </div>
            
            <div class="col-8 contentBox">
                
                <div id="titleDiv">
                    <h3>${dto.room_title}</h3>
                </div>
                
                <div>
                    <h5>모집 인원 : ${dto.room_people} 명</h5>
                </div>  

                <div>
                    <h5>모임 기간 : ${dto.open_date} ~ ${dto.close_date}</h5>
                </div>

                <div>
                    <h5>장소 : ${dto.place}</h5>
                </div>

                <div>
                    <h5>참여 방식 : ${dto.tag}</h5>
                </div>

                <div id="meetDiv">
                    <h5>참여 횟수 : 주 ${dto.meet_week} 회</h5>
                </div>

                <div>
                    <textarea id="detail">${dto.room_detail}</textarea>

                </div>

            </div>

        </div>

        <div class="row">
            <div class="col btnBox">
                <button type="button" id="btnBack" class="btn btn-secondary">뒤로가기</button>
             
             <c:choose>
             <c:when test="${role.role == 'L' && role.room_id == dto.room_id}"> <%-- 리더일 경우 --%>
           <button type="button" id="btnStatus" class="btn btn-primary">모집현황 보기</button>
             </c:when>
             <c:otherwise>
              <button type="button" id="btnRecruit" class="btn btn-warning">지원하기</button>
             </c:otherwise>
             
             </c:choose>
   
            </div>
        </div>
 
    </div>
    
    <%-- Modal --%>
    <form id="mydescForm" action="/club/recruit" method="post">
	    <div class="modal" tabindex="-1">
		  <div class="modal-dialog">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h5 class="modal-title">리더에게 보낼 간단한 지원동기를 작성해주세요<br>( 10자 이상, XX자 이하 )</h5>
		        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
		      </div>
		      <div class="modal-body">
		        <textarea id="mydesc" name="mydesc"></textarea>
		      </div>
		      <div class="modal-footer">
		        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal" id="btnCancel">취소</button>
		        <button type="button" class="btn btn-primary" id="btnComplete">지원완료</button>
		      </div>
		    </div>
		  </div>
		</div>
  	</form>
   
<script>
	
	//뒤로가기
	$("#btnBack").on("click", function(){
		location.href = "/club/toClub";
	})
	
	//신청하기
	$("#btnRecruit").on("click", function(){
		var con = confirm("해당 모임을 지원하시겠습니까?");
		if(con){
			
			<%-- --------- Modal ---------- --%>
			$(".modal").show();
			$("#mydesc").focus();
			//취소버튼
			$("#btnCancel").on("click", function(){
				$(".modal").hide();
			})
			//제출버튼
			$("#btnComplete").on("click", function(){
				// 글자 크기 제한 정규식 (10자 이상 XX자 이하)
				
				
				//자기소개 제출
				alert("해당 모임에 지원했습니다. 리더가 승인 할 때까지 기다려주세요!");
				$("#mydescForm").submit();
			})
			
			
			
		}
	})

</script>

</body>
</html>