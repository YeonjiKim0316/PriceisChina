<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="priceischina.model.dto.ProductDTO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ProductManger</title>
</head>

<body>
	
	<center>
		<h3>제품 list</h3>
		<table border="1">
	<thead>
		<tr>
			<th>제품ID</th><th>제품명</th><th>제품가격</th><th>제품제고량</th><th>삭제하기</th>
		</tr>
	</thead>
	<c:forEach items="${sessionScope.productAll}" var="product">
		<tr>
			<td>${product.productId}</td>
			<td>${product.productName}</td>
			<td>${product.quantity}</td>
			<td>${product.price}</td>
			<td><input type="text" value="제품삭제" Onclick="location.href='controller?command=deleteProduct'"></td>
		</tr>
	</c:forEach>
	</table>
	<br>
		<br>
		<!-- write Form  -->
		<form action="../controller?insertProduct" method="post">

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
			<br> <input type="submit" value="제품추가">&nbsp; <input
				type="reset" value="리셋">&nbsp;
		</form>
		
		<form action="controller?command=updateProduct" method="post">
			<!-- update Form  -->
			<table border="1" cellspacing="1">
				<tr>
					<td>제품 아이디</td>
					<td>${productId}</td>
				<tr>
					<td>제품명 수정</td>
					<td><input type="text" name="newName" value="${newName}">
					</td>
			</table>
			<p />

			<%-- hidden tag완성 하세요
			 value값으로 설정해야 하는 값은? 
	--%>
			<input type="submit" value="제품수정"> &nbsp; 
			<input type="reset"	value="취소">&nbsp;
		</form>
		<script type="text/javascript">
		console.log("product");
		</script>
</body>
</html>