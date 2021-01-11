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
		<form action="controller?insertProduct" method="post">

			<input type="hidden" name="command" value="insertProduct">

			<table border="1" cellspacing="1">
				<tr>
					<td align=center>제품 ID</td>
					<td><input type="text" name="productId"></td>
				</tr>
				<tr>
					<td align=center>제품명</td>
					<td><input type="text" name="productName"></td>
				</tr>
				<tr>
					<td align=center>제품가격</td>
					<td><input type="text" name="price"></td>
				</tr>
				<tr>
					<td align=center>제품제고량</td>
					<td><input type="text" name="quantity"></td>
				</tr>
			</table>
			<br>
			<br> <input type="submit" value="제품추가">&nbsp; 
				<input type="reset" value="리셋">&nbsp;
		</form>
		
		<form action="controller?command=updateProduct" method="post">
			<!-- update Form  -->
			<table border="1" cellspacing="1">
				<tr>
					<td>제품 아이디</td>
					<td><input type="text" name="productId" value="${productId}"></td>
				</tr>
				<tr>
					<td>제품명 수정</td>
					<td><input type="text" name="newName" value="${newName}">
					</td>
					</tr>
			</table>
			<p />

			<%-- hidden tag완성 하세요
			 value값으로 설정해야 하는 값은? 
	--%>
			<input type="submit" value="제품수정"> &nbsp; 
			<input type="reset"	value="취소">&nbsp;
		</form>
</body>
</html>