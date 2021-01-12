<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>login</title>
</head>
<body>

&nbsp; 
<p>
<p>
&nbsp; 
<p>
<p>

<center>

&nbsp;
<img src="img/china1.png" width=400>
<p>
			&nbsp;User&nbsp; ID : <input type="text" name="testid"> <br>
						Password: <input type="password" name="testpw"> <br>
			<br><br>
				
			<button onclick="location.href='controller?command=login'">로그인</button>
			<button onclick="location.href='./crud/join.jsp'">회원가입</button><br><br>
			<button onclick="location.href='products.jsp'">상품 페이지</button>
			<button onclick="location.href='admin.html'">admin</button>
</center><p>
</div>
</body>
</html>