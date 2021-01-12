<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="priceischina.model.dto.ProductDTO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
    
  <c:forEach items="${sessionScope.productAll}" var="productAll">
    <c:choose>
	    <c:when test="${productAll.productId==1}">
		{"prod${productAll.productId}":{
	  		"name":"${productAll.productName}"
	  		,"spec":["자동페어링", "블루투스 5.0","더블코어 무선충전 방식", "HiFi 음질", "방수 ipx7","터치 및 음성으로 조절 가능", "대기 시간 150hr", "사용 시간 4-8hr"]
	 		 ,"price":${productAll.price},
	 		 ,"pic":5
		}}
		</c:when>
		<c:when test="${productAll.productId==2}">
		{"prod${productAll.productId}":{
		  "name":"${productAll.productName}",
		  "spec":["자동감지 기능", "거품 비누 및 물 비누 2방식 사용 가능","대용량 450ml", "usb 충전"],
		  "price":${productAll.price},
		  "pic":3
		}}
		</c:when>
	</c:choose>
</c:forEach>
	
