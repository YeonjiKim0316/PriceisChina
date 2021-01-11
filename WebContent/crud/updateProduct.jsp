<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="priceischina.model.dto.ClientDTO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 


<html>
<head>
<title>제품 정보 수정</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body>
<br>
<center>   
<h3>제품 정보 변경</h3>
<br>

<form action="controller?command=updateProduct" method="post">
	  <!-- update Form  -->	
	  <table border="1" cellspacing="1" >
		  <tr>
			<td>제품 아이디</td>
			<td>${productId}</td>
	
	<tr><td>제품명 수정</td>	<td><input type="text" name="newName" value="${newName}">
		</td>
	</table>  
	<p/>

	<%-- hidden tag완성 하세요
			 value값으로 설정해야 하는 값은? 
	--%>
	<input type="submit" value="제품수정"> &nbsp;
	<input type="reset" value="취소">&nbsp;
</form>

</body>
</html>
