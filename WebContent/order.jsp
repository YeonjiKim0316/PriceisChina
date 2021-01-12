<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="priceischina.model.dto.OrderedDTO"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문 내역 보기</title>
</head>
<body>
	<style type="text/css">
    
    .dropdown {
  position: center;
  display: inline-block;
	}

	.dropdown-content {
  display: none;
  position: absolute;
  background-color: #f9f9f9;
  min-width: 160px;
  box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
  padding: 12px 16px;
  z-index: 1;
	}

	.dropdown:hover .dropdown-content {
  display: block;
	}
    </style>
	<div class="navi" style="font-color: gray" align=center>
		<p style="text-align: center;">
			<a href="products.jsp"><img src="img/2.gif" width=300 align=left></a> 
			<c:if test="${not empty id}"> <div class="dropdown">
			<br><br>
  <button>${id}</button>
  <div class="dropdown-content">
	<div id="buttons">
		<button onclick="acyncMovePage()">회원정보 관리</button><br>
  		<button onclick="acyncMovePage1()">장바구니 확인</button><br>
  		<button onclick="acyncMovePage2()">주문내역 보기</button></div>
  		<div id="bodyContents"></div></div>
		<script type="text/javascript">
 
	
	function acyncMovePage() {
		xhr = new XMLHttpRequest();
		xhr.onreadystatechange = function(){
			if(this.readyState == 4 && this.status == 200){
				document.getElementById("bodyContents").innerHTML = this.responseText;
			}
		};
		xhr.open("POST", "${pageContext.request.contextPath}/crud/update.jsp", true);
		xhr.send();
		
	}
 
	function acyncMovePage1() {
		xhr = new XMLHttpRequest();
		xhr.onreadystatechange = function(){
			if(this.readyState == 4 && this.status == 200){
				document.getElementById("bodyContents").innerHTML = this.responseText;
			}
		};
		xhr.open("POST", "${pageContext.request.contextPath}/myshopping.jsp", true);
		xhr.send();
		
	}
	

	function acyncMovePage2() {
		xhr = new XMLHttpRequest();
		xhr.onreadystatechange = function(){
			if(this.readyState == 4 && this.status == 200){
				document.getElementById("bodyContents").innerHTML = this.responseText;
			}
		};
		xhr.open("POST", "${pageContext.request.contextPath}/order.jsp", true);
		xhr.send();
		
	}
</script></c:if> <c:if test="${empty id}"> <a href="crud/join.jsp">가입하기</a></c:if>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<c:if test="${not empty id}"> <a href="controller?command=logout" class="logout">logout</a></c:if><c:if test="${empty id}"> <a href="login.html" class="login">login</a></c:if>&nbsp;
			&nbsp;&nbsp;&nbsp;&nbsp; <a href="myshopping.jsp">장바구니</a>&nbsp;
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<c:if test="${id=='testadmin'}"> <a href="admin.html">관리자 모드</a></c:if>&nbsp;
			
			&nbsp;&nbsp;&nbsp;&nbsp;<br><br>
		</p>
	</div><br><br>
	<div class="container" style="font-color: gray" align=center>
		<h3>주문 내역 list</h3>
		<table border="1">
		<tr>
			<th>주문번호</th><th>고객아이디</th><th>제품아이디</th><th>주문수량</th><th>주문시간</th><th>삭제하기</th>
		</tr>
	<c:forEach items="${sessionScope.orderedAll}" var="orderedAll">
		<tr>
			<td>${orderedAll.orderNo}</td>
			<td>${orderedAll.id}</td>
			<td>${orderedAll.productId}</td>
			<td>${orderedAll.orderedQuantity}</td>
			<td>${orderedAll.timestamp}</td>
			<td>
			<button Onclick="location.href='controller?command=deleteOrdered&orderNo=${orderedAll.orderNo}'">삭제</button>
			</td>
		</tr>
	</c:forEach>
	</table>
	<br>
		<br>
</body>
</html>