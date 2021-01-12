<%@ page language="java" contentType="text/html; charset=UTF-8"     pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원 탈퇴</title>
</head>
<body>
<body>
&nbsp;
<p><p>
<p><p>
<p><p>
<center>
${id}님의 계정이 삭제되었습니다.
<p><p>
<input type="button" 
 value="초기 화면으로" Onclick="location.href='products.jsp'"> 
</center>
<%	session.invalidate();
	session = null; %>
</body>
</html>
