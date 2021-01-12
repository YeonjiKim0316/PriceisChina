<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<html>
<head>
<meta charset="UTF-8">
<title>장바구니</title>

</head>
<body onload="drawVal()">
	<div class="navi" style="font-color: gray">
		<p style="text-align: right;">
			<a href="products.jsp"><img src="${pageContext.request.contextPath}/img/2.gif" width=300 align=left></a> <c:if test="${not empty id}"> <a href="myPage.jsp">${id}</a></c:if> <c:if test="${empty id}"> <a href="crud/join.jsp">가입하기</a></c:if>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<c:if test="${not empty id}"> <a href="controller?command=logout" class="logout">logout</a></c:if><c:if test="${empty id}"> <a href="login.html" class="login">login</a></c:if>&nbsp;
			&nbsp;&nbsp;&nbsp;&nbsp; <a href="myshopping.jsp">장바구니</a>&nbsp;
			&nbsp;&nbsp;&nbsp;&nbsp;<br>
		</p>
	</div>
	<br><br>
<div><h2 align="center">장바구니 내역</h2></div>
<br><br><br><br>

<table border = 1 align=center>
<tr><th>체크</th><th>사진</th><th>단가</th><th>수량</th><th>총 가격</th></tr>
		<tr><td>
		<input type='checkbox' id='prod1' name='prod1' value='prod1'>
		<label for='prod1'></label></td>
		<td><img src='img/product1.png' width=100></td><td>15000</td><td id="p1val"></td><td id="p1total"></td></tr>
		<tr><td>
		<input type="checkbox" id="prod2" name="prod2" value="prod2">
		<label for="prod2"></label></td>
		<td><img src="img/product2.png" width=100></td><td>20000</td><td id="p2val"></td><td id="p2total"></td></tr>
</table>

<script>
function drawVal(){
	if(localStorage.getItem("prod1")==null){
		localStorage.setItem("prod1",0);
	}
	if(localStorage.getItem("prod2")==null){
		localStorage.setItem("prod2",0);
	}
	if(<%=request.getParameter("p1")%>!=null){
		localStorage.setItem("prod1",localStorage.getItem("prod1")*1 + <%=request.getParameter("p1")%>*1);
	}
	if(<%=request.getParameter("p2")%>!=null){
		localStorage.setItem("prod2",localStorage.getItem("prod2")*1 + <%=request.getParameter("p2")%>*1);
	}
	draw();
}
function clearList(){
	localStorage.setItem("prod1",0);
	localStorage.setItem("prod2",0);
	draw();
}
function draw(){
	let p1val = localStorage.getItem("prod1");
	let p2val = localStorage.getItem("prod2");
	document.getElementById("p1val").innerText= p1val;
	document.getElementById("p2val").innerText= p2val;
	document.getElementById("p1total").innerText= 15000*localStorage.getItem("prod1");
	document.getElementById("p2total").innerText= 20000*localStorage.getItem("prod2");
	document.getElementById("total").innerText= 15000*localStorage.getItem("prod1")+20000*localStorage.getItem("prod2");
}
</script>
<br><br><br><br><br>
<p align=right>총계 : <span id="total"></span><br><br><button onclick="clearList()">장바구니 삭제</button>&emsp;&emsp;&emsp;<button>구매하기</button></p>

</body>
</html>