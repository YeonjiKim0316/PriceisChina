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
			<a href="products.jsp"><img src="img/2.gif" width=300 align=left></a> <a href="myPage.jsp">${id}</a>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href="login.html" class="logout">logout</a>&nbsp;
			&nbsp;&nbsp;&nbsp;&nbsp; <a href="myshopping.jsp">장바구니</a>&nbsp;
			&nbsp;&nbsp;&nbsp;&nbsp;<br>
		</p>
	</div>
	
	<br><br><br>&emsp;&emsp;&emsp;
	
	<div class="container" align=center>
		<div class="img-with-text"><img src="img/product1.png" width=300 height=300 onclick="location.href='productDetail.jsp?p=1'"><p> 
		블루투스 이어폰<br>15000원</p>
		수량선택
			<select name="수량" id="prod1" value="0">
					<option value="1">1</option>
					<option value="2">2</option>
					<option value="3">3</option>
					<option value="4">4</option>
					<option value="5">5</option>
					<option value="6">6</option>
					<option value="7">7</option>
					<option value="8">8</option>
				</select><br>
				<button onclick="location.href='myshopping.jsp?p1='+document.getElementById('prod1').value">장바구니</button></div>
		<div class="img-with-text"><img src="img/product2.png" width=300 height=300 onclick="location.href='productDetail.jsp?p=2'"><p>
		거품비누 디스펜서<br>20000원</p>
		수량선택
			<select name="수량" id="prod2" value="0">
					<option value="1">1</option>
					<option value="2">2</option>
					<option value="3">3</option>
					<option value="4">4</option>
					<option value="5">5</option>
					<option value="6">6</option>
					<option value="7">7</option>
					<option value="8">8</option>
				</select><br>
				<button onclick="location.href='myshopping.jsp?p2='+document.getElementById('prod2').value">장바구니</button></div>
		</div>
	</body>
	</html>

