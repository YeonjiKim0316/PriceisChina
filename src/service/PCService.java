package service;

import java.util.ArrayList;

import priceischina.model.ClientDAO;
import priceischina.model.OrderedDAO;
import priceischina.model.ProductDAO;
import priceischina.model.dto.OrderedDTO;
import priceischina.model.dto.ProductDTO;

public class PCService {
	
	//id 불일치시 "id", pw 불일치시 "pw", 로그인 성공시 "success"를 반환
	public static String login(String id, String pw) {
		return ClientDAO.login(id, pw);
	}
	
	//admin login
	public static String adminlogin(String adminId, String adminPw) {
		return ClientDAO.login(adminId, adminPw);
	}
	
	//로그아웃시 세션 삭제
	public static String logout(String id, String pw) {
		return ClientDAO.login(id, pw); 
	}
		
	//회원 가입
	public static String join(String id, String pw, String gender, String ageString) {
		int age = Integer.valueOf(ageString);
		return ClientDAO.insert(id, pw, gender, age); 
	}	

	//회원 정보 삭제
	public static boolean deleteID(String id) {
	return ClientDAO.delete(id); 
	}

	//비밀번호 수정
	public static boolean update(String id, String newPw) {
	return ClientDAO.update(id, newPw); 
	}

	
	//제품 List  반환
	public static ArrayList<ProductDTO> product() {
		return ProductDAO.productAll();
	}
	
	//제품 추가
	public static String insertProduct(int productId, String name, int quantity, int price) {
		return ProductDAO.insertProduct(productId, name, quantity, price); 
	}

	//제품 삭체
	public static boolean deleteProduct(int productId) {
	return ProductDAO.delete(productId); 
	}

	//제품명 수정
	public static boolean updateName(int productId, String newName) {
	return ProductDAO.updateName(productId, newName); 
	}
	
	//제품가격 수정
	public static boolean updatePrice(int productId, String newPrice) {
		return ProductDAO.updateName(productId, newPrice); 
	}
	//주문 list 반환
	public static ArrayList<OrderedDTO> ordered() {
		return OrderedDAO.orderedAll();
	}
	//주문 추가
	public static String insertOrdered(int orderNo, String id, int productId, int orderedQuantity, String timestamp) {
		return OrderedDAO.insertOredered(orderNo, id, productId, orderedQuantity, timestamp); 
	}
	//주문 수량 수정
	public static boolean updateorderedQuantity(int orderNo, int neworderQuantity) {
		return OrderedDAO.updateorderedQuantity(orderNo, neworderQuantity); 
	}
	//주문 삭제
	public static boolean deleteOrdered(int orderNo) {
		return OrderedDAO.deleteOrdered(orderNo); 
	}
}
