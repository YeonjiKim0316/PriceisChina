package service;

import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import priceischina.model.OrderedDAO;
import priceischina.model.ClientDAO;
import priceischina.model.ProductDAO;

public class LoginService {
	//싱글톤 패턴으로 만들기
	
	//id 불일치시 "id", pw 불일치시 "pw", 로그인 성공시 "success"를 반환
	public static String login(String id, String pw) {
		return ClientDAO.login(id, pw);
	}
	
	//로그아웃시 세션 삭제
	public static String logout(String id, String pw) {
		return ClientDAO.login(id, pw); 
	}
		
		
	//회원 가입
	public static String join(String id, String pw) {
		return ClientDAO.insert(id, pw); 
	}	

	//회원 정보 삭제
	public static boolean delete(String id) {
	return ClientDAO.delete(id); 
	}

	//비밀번호 수정
	public static boolean update(String id, String newPw) {
	return ClientDAO.update(id, newPw); 
	}
}
