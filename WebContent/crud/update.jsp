<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="priceischina.model.dto.ClientDTO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 


<html>
<head>
<title>비밀번호 변경</title>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
</head>
<body>
<!-- Navigation (Stays on Top) -->
	<div class="navi" style="font-color: gray">
		<p style="text-align: right;">
			<a href="../products.jsp"><img src="${pageContext.request.contextPath}/img/2.gif" width=300 align=left></a> <c:if test="${not empty id}"> <a href="../myPage.jsp">${id}</a></c:if> <c:if test="${empty id}"> <a href="join.jsp">가입하기</a></c:if>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<c:if test="${not empty id}"> <a href="controller?command=logout" class="logout">logout</a></c:if><c:if test="${empty id}"> <a href="${pageContext.request.contextPath}/login.html" class="login">login</a></c:if>&nbsp;
			&nbsp;&nbsp;&nbsp;&nbsp; <a href="${pageContext.request.contextPath}/myshopping.jsp">장바구니</a>&nbsp;
			&nbsp;&nbsp;&nbsp;&nbsp;<br>
		</p>
	</div>
<br>
<center>   
<h3>비밀번호 변경</h3>
<br>

<form action="../controller?command=updatesuccess" method="post">
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
	<input type="button" value="탈퇴" Onclick="location.href='../controller?command=delete'">&nbsp;
	<input type="reset" value="취소">&nbsp;
</form>

</body>
</html>
