<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<div class="navi" style="font-color: gray">
		<p style="text-align: right;">
			<a href="products.jsp"><img src="img/2.gif" width=300 align=left></a> <c:if test="${not empty id}"> <a href="myPage.jsp">${id}</a></c:if> <c:if test="${empty id}"> <a href="crud/join.jsp">가입하기</a></c:if>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<c:if test="${not empty id}"> <a href="controller?command=logout" class="logout">logout</a></c:if><c:if test="${empty id}"> <a href="login.html" class="login">login</a></c:if>&nbsp;
			&nbsp;&nbsp;&nbsp;&nbsp; <a href="myshopping.jsp">장바구니</a>&nbsp;
			&nbsp;&nbsp;&nbsp;&nbsp;<br>
		</p>
	</div>
</body>
</html>