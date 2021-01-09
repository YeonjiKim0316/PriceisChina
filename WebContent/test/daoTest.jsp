<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="priceischina.model.ProductDAO"%>
<%
	ProductDAO dao = new ProductDAO();
	//전체 제품 반환
	System.out.println(dao.productAll());
	//제품 추가 및 확인
	//System.out.println(dao.insertProduct(1, "testName1", 2000));
	//System.out.println(dao.insertProduct(2, "testName2", 3000));
	//System.out.println(dao.productAll());
	//제품 이름 변경 및 확인
	//System.out.println(dao.updateName(2, "testName222"));
	//System.out.println(dao.productAll());
	//제품 가격 변경
	//System.out.println(dao.updatePrice(2, 11000));
	//System.out.println(dao.productAll());
	//제품 삭제 및 확인
	//System.out.println(dao.delete(2);
	//System.out.println(dao.productAll());
	
	
%>