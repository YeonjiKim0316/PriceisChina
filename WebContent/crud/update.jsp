<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="priceischina.model.dto.ClientDTO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 


<html>
<head>
<title>제품 수정</title>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
</head>
<!-- Navigation (Stays on Top) -->
	<div class="navi" style="font-color: gray">
		<p style="text-align: right;">
			<img src="img/2.gif" width=200 align=left> <a href="myPage.jsp">${id}</a>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href="login.html" class="logout">logout</a>&nbsp;
			&nbsp;&nbsp;&nbsp;&nbsp; <a href="myshopping.jsp">장바구니</a>&nbsp;
			&nbsp;&nbsp;&nbsp;&nbsp;<br>
<body>
<br>
<center>   
<h3>비밀번호 변경</h3>
<br>

<form action="controller?command=updatesuccess" method="post">
	  <!-- update Form  -->	
	  <table border="1" cellspacing="1" >
		  <tr>
			<td>사용자 아이디</td>
			<td>${id}</td>
	
	<tr><td>비밀번호 수정</td>	<td><input type="password" name="newPw" value="${pw}">
		</td>
	</table>  
	<p/>

	<%-- hidden tag완성 하세요
			 value값으로 설정해야 하는 값은? 
	--%>
	<input type="submit" value="수정"> &nbsp;
	<input type="button" value="탈퇴" Onclick="location.href='controller?command=delete'">&nbsp;
	<input type="reset" value="취소">&nbsp;
</form>

</body>
</html>
