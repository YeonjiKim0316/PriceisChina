<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<html>
<head>
<meta charset="UTF-8">
<title>장바구니</title>
</head>
<body>
	<div class="navi" style="font-color: gray">
		<p style="text-align: right;">
			<a href="products.jsp"><img src="img/2.gif" width=300 align=left></a> <a href="myPage.jsp">${id}</a>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href="login.html" class="logout">logout</a>&nbsp;
			&nbsp;&nbsp;&nbsp;&nbsp; <a href="myshopping.jsp">장바구니</a>&nbsp;
			&nbsp;&nbsp;&nbsp;&nbsp;<br>
		</p>
	</div><br><br>
	<div align=center>
<h2>장바구니 내역</h2></div>
<br><br><br><br>
<table border = 1 align=center>
<tr><th>체크</th><th>사진</th><th>단가</th><th>수량</th><th>총 가격</th></tr>
	<%if(request.getParameter("p1")!=null){%>
		<tr><td>
		<input type='checkbox' id='prod1' name='prod1' value='prod1'>
		<label for='prod1'></label></td>
		<td><img src='img/product1.png' width=100></td><td>15000</td><td><%=request.getParameter("p1") %></td><td><%=15000*Integer.parseInt(request.getParameter("p1")) %></td></tr>
		<%}%>
	<%if(request.getParameter("p2")!=null){%>
		<tr><td>
		<input type="checkbox" id="prod2" name="prod2" value="prod2">
		<label for="prod2"></label></td>
		<td><img src="img/product2.png" width=100></td><td>20000</td><td><%=request.getParameter("p2") %></td><td><%=20000*Integer.parseInt(request.getParameter("p2")) %></td></tr>
		<%}%>
</table>
<br><br><br><br><br>
<p align=right>총계 : <br><br><button>구매하기</button></p>

</body>
</html>