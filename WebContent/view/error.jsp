<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>에러 상황입니다</title>
</head>
<body>
&nbsp;
<p>
<p>
<p>
<p>
<p>
<p>
<p>
<p>
<center>
<p>
<%
out.println(request.getAttribute("msg"));
%>
<br>
<p>
<p>
<p>
<p>
<button onclick="location.href='products.jsp'">쇼핑하기</button></center>
</body>
</html>