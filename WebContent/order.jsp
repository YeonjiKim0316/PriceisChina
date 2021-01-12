<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>주문 내역 보기</title>
</head>
<body>
	<style type="text/css">
    
    .dropdown {
  position: center;
  display: inline-block;
	}

	.dropdown-content {
  display: none;
  position: absolute;
  background-color: #f9f9f9;
  min-width: 160px;
  box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
  padding: 12px 16px;
  z-index: 1;
	}

	.dropdown:hover .dropdown-content {
  display: block;
	}
    </style>
	<div class="navi" style="font-color: gray" align=center>
		<p style="text-align: center;">
			<a href="products.jsp"><img src="img/2.gif" width=300 align=left></a> 
			<c:if test="${not empty id}"> <div class="dropdown">
			<br><br>
  <button>${id}</button>
  <div class="dropdown-content">
	<div id="buttons">
		<button onclick="acyncMovePage()">회원정보 관리</button><br>
  		<button onclick="acyncMovePage1()">장바구니 확인</button><br>
  		<button onclick="acyncMovePage2()">주문내역 보기</button></div>
  		<div id="bodyContents"></div></div>
		<script type="text/javascript">
 
	
	function acyncMovePage() {
		xhr = new XMLHttpRequest();
		xhr.onreadystatechange = function(){
			if(this.readyState == 4 && this.status == 200){
				document.getElementById("bodyContents").innerHTML = this.responseText;
			}
		};
		xhr.open("POST", "${pageContext.request.contextPath}/crud/update.jsp", true);
		xhr.send();
		
	}
 
	function acyncMovePage1() {
		xhr = new XMLHttpRequest();
		xhr.onreadystatechange = function(){
			if(this.readyState == 4 && this.status == 200){
				document.getElementById("bodyContents").innerHTML = this.responseText;
			}
		};
		xhr.open("POST", "${pageContext.request.contextPath}/myshopping.jsp", true);
		xhr.send();
		
	}
	

	function acyncMovePage2() {
		xhr = new XMLHttpRequest();
		xhr.onreadystatechange = function(){
			if(this.readyState == 4 && this.status == 200){
				document.getElementById("bodyContents").innerHTML = this.responseText;
			}
		};
		xhr.open("POST", "${pageContext.request.contextPath}/order.jsp", true);
		xhr.send();
		
	}
</script></c:if> <c:if test="${empty id}"> <a href="crud/join.jsp">가입하기</a></c:if>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<c:if test="${not empty id}"> <a href="controller?command=logout" class="logout">logout</a></c:if><c:if test="${empty id}"> <a href="login.html" class="login">login</a></c:if>&nbsp;
			&nbsp;&nbsp;&nbsp;&nbsp; <a href="myshopping.jsp">장바구니</a>&nbsp;
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<c:if test="${id=='testadmin'}"> <a href="admin.html">관리자 모드</a></c:if>&nbsp;
			
			&nbsp;&nbsp;&nbsp;&nbsp;<br><br>
		</p>
	</div>

	
</body>
</html>