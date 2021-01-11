<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<style type="text/css">
    .img-with-text { float: left; margin-left: 10em; text-align: left}
    </style>
	<div class="navi" style="font-color: gray">
		<p style="text-align: right;">
			<img src="img/2.gif" width=200 align=left>
			<a href="업데이트**" class="id"></i>${id}</a> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
			<a href="login.html">logout</a>&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;
			<a href="myshopping.html">장바구니</a>&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;<br>
		</p>
	</div>
	
	<br><br><br>&emsp;&emsp;&emsp;
	
	<div class="container" align=center>
		<div class="img-with-text"><img src="img/1.png" width=300 height=300 onclick="location.href='productDetail.jsp'"><p> 상품1<br>가격1<br>설명1 </p></div>
		<div class="img-with-text"><img src="img/2.png" width=300 height=300 onclick="location.href='productDetail.jsp'"><p> 상품2<br>가격2<br>설명2 </p></div>
		</div>
	</body>
	</html>
}

