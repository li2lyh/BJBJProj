<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>

<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Bootstrap demo</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet"
    integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
  <style>
    /* ******** 기준 ******** */
   	.foot-container{
      font-size: 20px;
    }

    /* ******** policyBox ******** */
    
    .policyBox{
      margin-top: 3.5rem;
    }
    
    .policyBox p{
      cursor:pointer;
    }

    /* ******** Foot Information ******** */
    .infoBox{
      margin-top: 1.5rem;
    }

    .infoBox p{
      margin-bottom: 0.3rem;
    }
  </style>
</head>

<body>
  <div class="foot-container">
    <!-- ********** 이용약관, 개인정보처리방침 ********** -->
    <div class="policyBox row">
      <div class="col-1 p-0">
        <p class="m-0" id="termsOfService" onclick="showPopup1();">
          이용약관
        </p>
      </div>
      <div class="col-2 p-0" >
        <p class="m-0" id="" onclick="showPopup2();">개인정보처리방침</p>
      </div>
    </div>
    <!-- ********** Foot Information ********** -->
    <div class="infoBox row">
      <div class="p-0">
        <h4>북적북적커뮤니티</h4>
        <p>대표 : 김당산</p>
        <p>사업자 등록번호 : 000 - 00 - 00000</p>
        <p>통신판매번호 : 제2022 - 서울 영등포 - 00000</p>
        <p>호스팅 제공자 : (주)KH정보교육원</p>
        <p>주소 : 서울특별시 영등포구 선유동2로 57 이레빌딩(구관) 19F, 20F</p>
      </div>
    </div>
  </div>
  
  
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"
    integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2"
    crossorigin="anonymous"></script>
  
  
  <script>
    /* 이용약관 */

    /* 이용 약관 popup창 */
    function showPopup1(){
            window.open("test.html","termsOfService","width=500, height=300, top=300, left=200");
        }

    /* 개인정보처리방침 */

    /* 개인정보처리방침 popup창 */
    function showPopup2(){
            window.open("test.htm2","","width=400, height=500, top=300, left=200");
        }

  </script>
</body>

</html>