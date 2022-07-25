<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/3.7.2/animate.min.css">
<meta charset="UTF-8">
<title>에러페이지</title>
<style>
@font-face {
    font-family: 'Eulyoo1945-Regular';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2102-01@1.0/Eulyoo1945-Regular.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}

.errorContainer{
    position:relative;
}

.errorText{
    position:absolute;
    top:40%;
    left:30%;
    font-family:'Eulyoo1945-Regular';
}
.errorImage{
    vertical-align: middle;
}
</style>
</head>
<body>
    <div class="container">
        <div class="errorContainer">
            <div class="errorText">
                <h2 class="animate__animated animate__bounce animate__repeat-2">ERROR!</h2>
                <h3>요청하신 페이지를 찾을 수 없습니다.</h3>
            </div>
            <div class="errorImage">
                <img src="../resources/images/error.png">
            </div>
        </div>
    </div>
</body>
</html>