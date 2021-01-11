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
			<a href="myshopping.jsp">장바구니</a>&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;<br>
		</p>
	</div>
	
	<br><br><br>&emsp;&emsp;&emsp;
	
	<div class="container" align=center>
		<div class="img-with-text"><img src="img/product1.png" width=300 height=300 onclick="location.href='productDetail.jsp?p=1'"><p> 
		블루투스 이어폰<br>15000원</p></div>
		<div class="img-with-text"><img src="img/product2.png" width=300 height=300 onclick="location.href='productDetail.jsp?p=2'"><p>
		거품비누 디스펜서<br>20000원</p></div>
		</div>
	</body>
	</html>

