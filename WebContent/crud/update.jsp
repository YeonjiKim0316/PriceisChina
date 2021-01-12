<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="priceischina.model.dto.ClientDTO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 


<html>
<head>
<title>회원 정보 수정</title>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
</head>
<body>

<center>   
<h3>회원 정보 수정</h3>
<br>

<form action="${pageContext.request.contextPath}/controller?command=updatesuccess" method="post">
	  <!-- update Form  -->	
	  <table border="1" cellspacing="1" >
		  <tr>
			<td>사용자 아이디</td>
			<td>${id}</td>
	
	<tr><td>비밀번호 수정</td>	<td><input type="password" name="newPw" value="${pw}">
		</td>
	</table>  
	<p/>

	<input type="submit" value="수정"> &nbsp;
	<input type="button" value="탈퇴" Onclick="location.href='controller?command=delete'">&nbsp;
	<input type="reset" value="취소">&nbsp;
</form>

</body>
</html>
