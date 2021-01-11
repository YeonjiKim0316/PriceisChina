<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<html>
<head>
<meta charset="UTF-8">
<title>상품 상세 정보</title>
</head>
<body>
	<style type="text/css">
    .img-with-text { float: left; margin-left: 10em; text-align: left}
    .div1 {overflow:auto;}
	.img { float: left;  }
	.div2 { float: left; } 
    </style>
	<div class="navi" style="font-color: gray">
		<p style="text-align: right;">
			<img src="img/2.gif" width=200 align=left>
			<a href="controller?update" class="id">${id}</a> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
			<a href="login.html">logout</a>&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;
			<a href="myshopping.html">장바구니</a>&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;<br>
		</p>
	</div>
	<div class="div1">
		<img class="img" src=img/product1.png>
		<div class="div2">
			<br><br><br><br><br><br><br><br><br>
			구매 정보<br><br><br>
			상품명<br><br><br>
			가격<br><br><br>
			수량선택
			<select name="수량">
					<option value="1">1</option>
					<option value="2">2</option>
					<option value="3">3</option>
					<option value="4">4</option>
					<option value="5">5</option>
					<option value="6">6</option>
					<option value="7">7</option>
					<option value="8">8</option>
				</select>
			<br><br><br>
			<div align=right>
				<button onclick="location.href='myshopping.jsp'">장바구니</button>
				&emsp;&emsp;&emsp;
				<button onclick="location.href='��ǰ����'">구매하기</button>
				&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
			</div>
		</div>
	</div>
	
	
</body>
</html>