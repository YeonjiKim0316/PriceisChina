<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="priceischina.model.dto.OrderedDTO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>OrderedManger</title>
</head>

<body>
	
	<center>
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
		<!-- write Form  -->
		<form action="controller?addOrdered" method="post">

			<input type="hidden" name="command" value="addOrdered">

			<table border="1" cellspacing="1">
				<tr>
					<td align=center>주문번호</td>
					<td><input type="text" name="orderNo"></td>
				</tr>
				<tr>
					<td align=center>고객아이디</td>
					<td><input type="text" name="id"></td>
				</tr>
				<tr>
					<td align=center>제품아이디</td>
					<td><input type="text" name="productId"></td>
				</tr>
				<tr>
					<td align=center>주문수량</td>
					<td><input type="text" name="orderedQuantity"></td>
				</tr>
				<tr>
					<td align=center>주문시간</td>
					<td><input type="text" name="timestamp"></td>
				</tr>
			</table>
			<br>
			<br> <input type="submit" value="주문추가">&nbsp; 
				<input type="reset" value="리셋">&nbsp;
		</form>
		
		<form action="controller?command=updateOrdered" method="post">
			<!-- update Form  -->
			<table border="1" cellspacing="1">
				<tr>
					<td>주문 번호</td>
					<td><input type="text" name="orderNo" value="${orderNo}"></td>
				</tr>
				<tr>
					<td>주문수량 수정</td>
					<td><input type="text" name="neworderQuantity" value="${neworderQuantity}">
					</td>
					</tr>
			</table>
			<p />

			<input type="submit" value="주문수정"> &nbsp; 
			<input type="reset"	value="취소">&nbsp;
		</form>
</body>
</html>