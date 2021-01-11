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
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href="controller?logout" class="logout">logout</a>&nbsp;
			&nbsp;&nbsp;&nbsp;&nbsp; <a href="myshopping.jsp">장바구니</a>&nbsp;
			&nbsp;&nbsp;&nbsp;&nbsp;<br>
		</p>
	</div>
<div id="gnb">
 <button class="gnb_switch" onclick="acyncMovePage('/crud/update.jsp')">비밀번호 변경</button>
  <button class="gnb_switch" onclick="acyncMovePage('myshopping.jsp')">장바구니 확인</button>
  <button class="gnb_switch" onclick="acyncMovePage('order.jsp')">주문내역 보기</button></div>
  
        <div id="bodyContents"></div>
        
        <input type="button" value="페이지 이동" onclick="acyncMovePage('myshopping.jsp')">
    </body>
</html>

<script>
 
    function acyncMovePage('/crud/update.jsp'){
        // ajax option
        var ajaxOption = {
                url : '/crud/update.jsp',
                async : true,
                type : "POST",
                dataType : "jsp",
                cache : false
        };
        
        $.ajax(ajaxOption).done(function(data){
            // Contents 영역 삭제
            $('#bodyContents').children().remove();
            // Contents 영역 교체
            $('#bodyContents').html(data);
        });
    }
 
</script>


</body>
</html>
