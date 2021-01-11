<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<title>My Page</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<body>

<div class="w3-container">
	<div class="navi" style="font-color: gray">
		<p style="text-align: right;">
			<a href="products.jsp"><img src="img/2.gif" width=300 align=left></a> <a href="myPage.jsp">${id}</a>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href="login.html" class="logout">logout</a>&nbsp;
			&nbsp;&nbsp;&nbsp;&nbsp; <a href="myshopping.jsp">장바구니</a>&nbsp;
			&nbsp;&nbsp;&nbsp;&nbsp;<br>
		</p>
	</div>

<div class="w3-bar w3-black">
  <button class="w3-bar-item w3-button" onclick="openCity('London')">비밀번호 변경</button>
  <button class="w3-bar-item w3-button" onclick="openCity('Paris')">장바구니 확인</button>
  <button class="w3-bar-item w3-button" onclick="openCity('Tokyo')">주문내역 보기</button>
</div>

<div id="London" class="w3-container city">
<jsp:forward page="crud/update.jsp">
		<jsp:param value="id" name="msg"/>
	</jsp:forward>
    </div>
    
<div id="Paris" class="w3-container city" style="display:none">
<jsp:forward page="order.jsp">
		<jsp:param value="id" name="msg"/>
	</jsp:forward>
</div>

<div id="Tokyo" class="w3-container city" style="display:none">
  <h2>Tokyo</h2>
  <p>Tokyo is the capital of Japan.</p>
</div>

<script>
function openCity(cityName) {
  var i;
  var x = document.getElementsByClassName("city");
  for (i = 0; i < x.length; i++) {
    x[i].style.display = "none";  
  }
  document.getElementById(cityName).style.display = "block";  
}
</script>

</body>
</html>
