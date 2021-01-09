<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="priceischina.model.OrderedDAO"%>
<%
	OrderedDAO dao = new OrderedDAO();
	//전체 제품 반환
	//System.out.println(dao.orderedAll());
	//제품 추가 및 확인
	//System.out.println(dao.insertOredered(1, "testid", 1, 3, "yyyy-MM-dd HH:mm:ss"));
	//System.out.println(dao.insertOredered(2, "testid", 1, 3, "yyyy-MM-dd HH:mm:ss"));
	//System.out.println(dao.orderedAll());
	//제품 이름 변경 및 확인
	//System.out.println(dao.updateorderedQuantity(1, 6));
	//System.out.println(dao.orderedAll());
	//제품 삭제 및 확인
	System.out.println(dao.delete(2));
	System.out.println(dao.orderedAll());
	
%>