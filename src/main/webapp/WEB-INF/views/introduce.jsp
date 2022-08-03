<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<meta charset="UTF-8">
<title>소개 페이지</title>
<style>

/*폰트*/
@font-face {
    font-family: 'MapoGoldenPier';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/MapoGoldenPierA.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}
*{
	font-family : 'MapoGoldenPier';
}

/*image*/
#image1{
    width:100%;
    height:400px;
}
#imgae2{
    width:500px;
    height:400px;
}
#imgae3{
	width: 500px;
	height:400px;
}
/*공백*/
.empty{
    height:40px;
}
.empty2{
	height:20px;
}
.empty3{
	height:50px;
	width:10px;
}
.greet{
	position:relative;
}
#titleText{
	position:absolute;
	top:40%;
	left:20%;
}
.secont_section{
	width:100%;
	height:520px;
}
/*third*/
.third_section{
	position:relative;
	width:100%;
	height:550px;
}
.h3Text{
	position:absolute;
	top:30%;
}
.fourth_section{
	height:500px;
	background-color: #F0DEC0;
}

.Easteregg{
	color:white; 
}
</style>
</head>
<body>
	<div class="container">
       	<div class="header">
			<jsp:include page="/WEB-INF/views/frame/header.jsp"></jsp:include>
		</div>
       	<div class="empty"></div>
        <div class="first_section">
            <div class="row">
                <div class="col-7 d-flex justify-content-center">
                    <img id="image1" src="resources/images/intro1.jpg">
                </div>
                <div class="col-5 greet">
                    <h2 id="titleText">
                        유쾌하고 기분 좋은 대화<br>함께할래요?
                    </h2>
                </div>
            </div>
            <div class="empty"></div>
        </div>
        <div class="secont_section">
            <div class="row">
                <div class="col-6">
                	<div class="empty3"></div>
                    <h3>About us</h3>
                    <h2>함께 읽고 성장해요</h2>
                    <h5>
                        우리는 일생에 걸친 배움의 욕구를 채워갑니다.<br>
                        함께 알고 싶던 콘텐츠와 가치관을 서로 배우며<br>
                        새로운 삶을 향해 함께 나아가요.
                    </h5>
                    <div class="empty3"></div>
                    <h5>
                    	북적북적과 함께 새로운 책, 새로운 사람과 만나보세요<br>
                    	어쩌면 기대하지 않았던 새로운 인연을 만날거예요.
                    </h5>
                    <div class="empty3"></div>
                    <h5>
                    	지금, 우리, 함께
                    	북적북적에서 만나요
                    </h5>
                </div>
                <div class="col-6 d-flex justify-content-center">
                    <img id="imgae2" src="resources/images/intro2.jpg">
                </div>
            </div>
        </div>
        <div class="third_section">
        	<div class="row">
        		<div class="col">
        			<img id="imgae3" src="resources/images/intro3.jpg">
        		</div>
        		<div class="col">
        			<h3 class="h3Text">
        			we read to know we are not alone<br>
        			 -C.S Lewis
        			</h3>
        		</div>
        	</div>
        </div>
        <div class="fourth_section">
        	<div class="empty2"></div>
        	<div class="row m-4">
        		<div class="col">
        			<h2>모임은 이렇게 진행됩니다.</h2>
        			<h4>1. 모든 회원은 원하는 모임을 만들 수 있습니다.</h4>
        			<h4>2. 원하는 모임에 지원한 후, 승인을 기다립니다.</h4>
        			<h4>3. 승인이 완료될 경우 모임원들과 함게 모임을 진행합니다.</h4>
        		</div>
        	</div>
        	<div class="empty"></div>
			<div class="row m-4">
				<div class="col">
					<h4>이것만은 지켜주세요!</h4>
					<h6>'-님', 호칭을 사용하고 존대해요.<br>
						사적인 질문은 하지 않아요.(직업, 학력, 나이 등!)<br>
						다른 멤버의 발언을 끝까지 듣고 말해요.<br>
						반대 의견 환영해요! 단, 둥글게 말해주세요.<br>
						리더가 발언 시간을 조정할 수 있어요.
					</h6>
				</div>
			</div>		
        </div>
        
         <h6 class="Easteregg">북적북적짱</h6>
        <div class=footer>
			<jsp:include page="/WEB-INF/views/frame/footer.jsp"></jsp:include>
		</div>

	</div>
</body>
</html>