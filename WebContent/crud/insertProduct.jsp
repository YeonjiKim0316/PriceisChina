<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="priceischina.model.dto.ProductDTO"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>제품추가</title>
</head>

<body>
&nbsp;<p><p><p>
	<center>
	<h3>회원가입</h3>
	<br>
	  <!-- write Form  -->
	 <form action="../controller?insertProduct" method="post">
	 
	 <input type="hidden" name="command" value="insertProduct">
	  
	  <table border="1" cellspacing="1">
		  <tr>
			<td align=center >제품 ID</td>
			<td>
				<input type="text" name="productId">
			</td>
		  </tr>
		  <tr>
			<td align=center >제품명</td>
			<td>
				<input type="text" name="productName">
			</td>
		  </tr>
		  <tr>
			<td align=center >제품가격</td>
			<td>
				<input type="text" name="price">
			</td>
		  </tr>
		  <tr>
			<td align=center >제품제고량</td>
			<td>
				<input type="text" name="quantity">
			</td>
		  </tr>
	  </table>
	 <br><br>
	 <input type="submit" value="제품추가">&nbsp;
	 <input type="reset" value="리셋">&nbsp;</form>
	 </form>	 


</body>
</html>