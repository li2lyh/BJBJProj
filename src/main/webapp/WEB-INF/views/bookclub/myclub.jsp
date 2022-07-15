<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
        table, td, th{
            border-collapse: collapse;
            border: 1px solid black;
        }
        #tilde{
            font-size: 25px;
            margin: none;
        }
        #con{
            padding : 5px;
        }
        #con2{
            padding: 8px;
        }
        #titleDiv{
            margin-bottom: 0px;
        }
</style>

</head>
<body>
    <form action="/club/modify" id="modifyForm" method="post" enctype="multipart/form-data">
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
                <div class="row">
                    <div class="col btnBox">
                        <button type="button" id="btnBack" class="btn btn-secondary">뒤로가기</button>
                        <c:choose>
                            <c:when test="${role.role == 'L' && role.room_id == dto.room_id}"> <!-- 리더일 경우 -->
                                <button type="button" id="btnModify" class="btn btn-primary">수정</button>
                                <button type="submit" class="btn btn-primary d-none" id="complete">완료</button>
                                <button type="button" class="btn btn-danger" id="delete">삭제</button>
                            </c:when>
                        </c:choose>
                    </div>
                </div>
            </div>
     
            <div class="container">
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
                            <h3><input type="text" class="form-control" id="room_title" name="room_title" value="${dto.room_title}" readonly></h3>
                        </div>
                        
                        <div class="row">
                            <div class="col-2" id="con">
                                <h5>모집 인원 :</h5>
                            </div>
                            <div class="col-2">
                                <select class="form-select" id="room_people" name="room_people" style="width: 100px;" aria-label="Default select example" value="${dto.room_people}">
                                    <option value="3">3</option>
                                    <option value="4">4</option>
                                    <option value="5">5</option>
                                    <option value="6">6</option>
                                    <option value="7">7</option>
                                    <option value="8">8</option>
                                    <option value="9">9</option>
                                    <option value="10">10</option>
                                  </select> 
                            </div>
                            <div class="col-1" id="con">
                                <h5>명</h5>
                            </div>
                            
                        </div>  
        
                        <div class="row">
                            <div class="col-2" id="con">
                                <h5>모임 기간 :</h5>
                            </div>
                            <div class="col-4">
                                <input type="text" id="open_date" class="form-control" name="open_date" style="width: 200px;" value="202-07-11" value="${dto.open_date}" readonly />
                            
                            </div>
                            <div class="col-2" id="tilde" style="width: 60px;">
                                ~
                            </div>
                            <div class="col-4">
                                <input type="text" id="close_date" class="form-control" name="close_date" style="width: 200px;" value="202-07-11" value="${dto.close_date}" readonly />
                            </div>
                        </div>
        
                        <div class="row">
                            <div class="col-2" id="con">
                                <h5>장소 :</h5>
                            </div>
                            <div class="col-10">
                                <select class="form-select" id="place" name="place" style="width: 100px;" aria-label="Default select example" value="${dto.place}">
                                    <option value="서울">서울</option>
                                    <option value="경기">경기</option>
                                    <option value="대전">대전</option>
                                    <option value="부산">부산</option>
                                    <option value="기타">기타(모집 상세에 기입)</option>
                                </select>
                            </div>
                        </div>
        
                        <div class="row">
                            <div class="col-2" id="con">
                                <h5>참여 방식 :</h5>
                            </div>
                            <div class="col-10" id="con2">
                                <div class="col radioBox" id="tag" value="${dto.tag}">
                                    <input type="radio" class ="tag" name="tag" value="온라인">온라인
                                    <input type="radio" class ="tag" name="tag" value="오프라인" checked>오프라인
                                    <input type="radio" class ="tag" name="tag" value="온/오프라인">온/오프라인
                                </div>
                            </div>
                        </div>
        
                        <div class="row">
                            <div class="col-2" id="con">
                                <h5>참여 횟수 :</h5>
                            </div>
                            <div class="col-10">
                                <select class="form-select" id="meet_week" name="meet_week" style="width: 100px;" aria-label="Default select example" value="${dto.meet_week}">
                                    <option value="1">주 1회</option>
                                    <option value="2">주 2회</option>
                                    <option value="3">주 3회</option>
                                    <option value="4">주 4회</option>
                                    <option value="5">주 5회</option>
                                </select>
                            </div>
                            
                        </div>
        
                        <div>
                            <textarea class="form-control" id="room_detail" name="room_detail" rows="5" value="${dto.room_detail}" readonly>${dto.room_detail}</textarea>
                        </div>
        
                    </div>
        
                </div>
        </form>
        	
        <div class="row">
            <table style="text-align: center;">
                <thead>
                    <tr>
                        <th scope="col" class="thTitle">No</th>
                        <th scope="col" class="thTitle">아이디</th>
                        <th scope="col" class="thTitle">닉네임</th>
                        <th scope="col" class="thTitle">소개글</th>
                        <th scope="col" class="thTitle">승인/거절</th>
                    </tr>
                </thead>
                <tbody>
                    <c:choose>
							<c:when test="${list.size() == 0}">
								<tr>
									<td colspan="6">신청한 회원이 없습니다.</td>
								</tr>
							</c:when>
							<c:otherwise>
								<c:forEach items="${list}" var="dto">
									<tr>
										<td>${dto.seq_멤버 테이블 시퀀스}</td>
										<td>${dto.member_email}</td>
										<td>${dto.member_nickname}</td>
										<td><button type="button" class="btn btn-success id="introduce">보기</button></td>
                                        <td>
                                            <div class="col btnBox2">
                                                <button type="submit" class="btn btn-success id="approve">승인</button>
                                                <button type="button" class="btn btn-danger id="refuse">거절</button>
                                            </div>
                                        </td>
										
									</tr>
								</c:forEach>
							</c:otherwise>
						</c:choose>
                </tbody>
            </table>
        </div>
    </div>

<script>
	// 뒤로가기
	$("#btnBack").on("click", function(){
		location.href = "/club/toClub";
	})
	
    // readonly 적용
    $("#tag").not(":selected").attr("disable", "disable");
    $("#meet_week").not(":selected").attr("disable", "disable");
    $("#place").not(":selected").attr("disable", "disable");
    $("#room_people").not(":selected").attr("disable", "disable");

    // 수정 버튼을 클릭했을 때
	$("#modify").on("click", function(){
		$("#modify").addClass("d-none");
		$("#complete").removeClass("d-none");
		$("#room_title").attr("readonly", false);
        $("#tag").not(":selected").attr("disable", "");
        $("#meet_week").not(":selected").attr("disable", "");
        $("#room_people").not(":selected").attr("disable", "");
        $("#place").not(":selected").attr("disable", "");
        $("#open_date").attr("readonly", false);
        $("#close_date").attr("readonly", false);
        $("#room_detail").attr("readonly", false);
	})

    $("#delete").on("click", function(){
        let answer = confirm("정말 삭제하시겠습니까?");
        if(answer){
            let deleteForm = $("<form>").attr({
                "method" : "post"
					, "action" : "/club/delete"
			}).css("display", "none");
        }
    })
</script>
</body>
</html>