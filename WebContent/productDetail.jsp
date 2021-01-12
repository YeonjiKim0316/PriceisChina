<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta charset="UTF-8">
<title>상품 상세 정보</title>
</head>
<body onload="prodView(<%=request.getParameter("p") %>)">
	<style type="text/css">
    .img-with-text { float: left; margin-left: 10em; text-align: left}
    .div1 {overflow:auto;}
	.img { float: left; margin-left:10em  }
	.div2 { float: left; }
        
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
    
<br><br><br>
	<div class="div1" id = "div1">
		<img class='img' src=img/product<%=request.getParameter("p") %>.png width=400>
		<div class="div2">
			&emsp;&emsp;제품명 : <span id="prodName"></span><br><br>
			&emsp;&emsp;상세 설명<br><br><span id="prodDetail"></span><br><br>
			&emsp;&emsp;가격 : <span id="prodPrice"></span><br><br>
			&emsp;&emsp;수량선택
			<select name="수량" id="prod" value="0">
					<option value="1">1</option>
					<option value="2">2</option>
					<option value="3">3</option>
					<option value="4">4</option>
					<option value="5">5</option>
					<option value="6">6</option>
					<option value="7">7</option>
					<option value="8">8</option>
				</select>
			<br><br><br>

			<div align=right>
				<button onclick="location.href='myshopping.jsp?p<%=request.getParameter("p") %>='+document.getElementById('prod').value">장바구니</button>
				&emsp;&emsp;&emsp;
				<button onclick="location.href='order.jsp'">구매하기</button>
				&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
			<button onclick="location.href='products.jsp'">상품 페이지</button>
			</div>
		</div>
	</div>
	<br><br><br>
	<div id = "detail" align=center></div>
	
	<script type="text/javascript">
	function prodView(v) {
		var xhttp = new XMLHttpRequest();
		xhttp.onreadystatechange = function() {
			if (this.readyState == 4 && this.status == 200) {
				var data = JSON.parse(this.responseText);
				document.getElementById("prodName").innerText = data["prod"+v].name;
				document.getElementById("prodPrice").innerText = data["prod"+v].price;
				for(let spec of data["prod"+v].spec){
					document.getElementById("prodDetail").innerHTML += "&emsp;&emsp;"+spec+"<br>";
				}
				let i = 1;
				while(i<=data["prod"+v].pic){
					let images = new File([""],"img/product"+v+"-"+i+".jpg");
					if(images.name.length>0){
						document.getElementById("detail").innerHTML += "<img src=img/product"+v+'-'+i+".jpg><br>";
						i++;
					}else{
					  	break;
					}
				}
			}
		}
		xhttp.open("GET", "prodData.jsp", true);
		xhttp.send();
	}
</script>
</body>
</html>
