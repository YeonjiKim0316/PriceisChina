<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="priceischina.model.dto.ClientDTO"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>가입하기</title>
</head>

<body>
&nbsp;<p><p><p>
	<center>
	<h3>회원가입</h3>
	<br>
	  <!-- write Form  -->
	 <form action="../controller?join" method="post">
	 
	 <input type="hidden" name="command" value="join">
	  
	  <table border="1" cellspacing="1">
		  <tr>
			<td align=center >ID</td>
			<td>
				<input type="text" name="id">
			</td>
		  </tr>
		  <tr>
			<td align=center >비밀번호</td>
			<td>
				<input type="password" name="pw">
			</td>
		  </tr>
		    <tr>
			<td align=center >성별</td>
			<td>
		  <input type="radio" id="M" name="gender" value="M">
			  <label for="M">Male</label><br>
			  <input type="radio" id="F" name="gender" value="F">
			  <label for="F">Female</label><br>
			</td>
			</tr>
			   <tr>
			<td align=center >연령대</td>
			<td>
			  <input type="radio" id="10" name="age" value="10">
			  <label for="10">10대 이하</label><br>
			  <input type="radio" id="20" name="age" value="20">
			  <label for="20">20대</label><br>
			  <input type="radio" id="30" name="age" value="30">
			  <label for="30">30대</label><br>
			  <input type="radio" id="40" name="age" value="40">
			  <label for="40">40대</label><br>
			  <input type="radio" id="50" name="age" value="50">
			  <label for="50">50대</label><br>
			  <input type="radio" id="60" name="age" value="60">
			  <label for="60">60대 이상</label><br>
			</td>
			</tr>
	  </table>
	 <br><br>
	 <input type="submit" value="가입" onclick="location.href='products.jsp'">&nbsp;
	 <input type="reset" value="리셋">&nbsp;</form>
	 </form>	 


</body>
</html>