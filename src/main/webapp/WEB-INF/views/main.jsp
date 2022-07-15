<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
	<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
	<title>ë¶ì ë¶ì  - ë©ì¸íì´ì§</title>
</head>
<body>
<h1>
	Hello Spring! main page
	<button type="button" id="test">북클럽</button>
</h1>

<script>
	$("#test").on("click", function(){
		location.href = "/club/toClub";
	})
</script>

</body>
</html>
