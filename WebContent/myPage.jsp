<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<title>W3.CSS</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<body>
<div class="w3-container">
	<p style="text-align: right;">
			<img src="img/2.gif" width=200 align=left> <a href="myPage.jsp">${id}</a>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href="login.html" class="logout">logout</a>&nbsp;
			&nbsp;&nbsp;&nbsp;&nbsp; <a href="myshopping.jsp">장바구니</a>&nbsp;
			&nbsp;&nbsp;&nbsp;&nbsp;<br>
</div>

<div class="w3-bar w3-black">
  <button class="w3-bar-item w3-button" onclick="open('update')">비밀번호 변경</button>
  <button class="w3-bar-item w3-button" onclick="open('myshopping')">장바구니</button>
  <button class="w3-bar-item w3-button" onclick="open('order')">주문 상황</button>
</div>

<div id="update" class="w3-container jsp">
  <h2>비밀번호 변경</h2>
<jsp:forward page="crud/update.jsp">
		<jsp:param value="id" name="msg"/>
	</jsp:forward>
</div>

<div id="myshopping" class="w3-container jsp" style="display:none">
<jsp:forward page="myshopping.jsp">
		<jsp:param value="id" name="msg"/>
	</jsp:forward>
</div>

<div id="order" class="w3-container jsp" style="display:none">
<jsp:forward page="order.jsp">
		<jsp:param value="id" name="msg"/>
	</jsp:forward>
</div>

<script>
function open('orderName') {
  var i;
  var x = document.getElementsByClassName("jsp");
  for (i = 0; i < x.length; i++) {
    x[i].style.display = "none";  
  }
  document.getElementById(cityName).style.display = "block";  
}
</script>

</body>
</html>
