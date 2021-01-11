<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<title>My Page</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
.dropdown {
  position: relative;
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
</head>
<body>
<div id="bodyContents"></div>

  <center>
<div class="dropdown">
  <button>My Page</button>
  <div class="dropdown-content">
	<div id="buttons">
		<button onclick="acyncMovePage()">비밀번호 변경</button>
  		<button onclick="acyncMovePage1()">장바구니 확인</button>
  		<button onclick="acyncMovePage2()">주문내역 보기</button></div>
</div></div></center>
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
</script>

</body>
</html>

