package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import lombok.extern.slf4j.Slf4j;
import service.PCService;

@WebServlet("/controller")
@Slf4j
public class PCcontroller extends HttpServlet {

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		process(request, response);
	}

	public void process(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		String command = req.getParameter("command");
		HttpSession session = req.getSession();
		try {
			if ((String) session.getAttribute("id") == null && !command.equals("login") && !command.equals("join")) {
				req.setAttribute("msg", "로그인하세요");
				req.getRequestDispatcher("view/error.jsp").forward(req, res);
			} else {
				if (command.equals("login")) {
					login(req, res);
				} else if (command.equals("join")) {
					join(req, res);
				} else if (command.equals("update")) {
					update(req, res);
				} else if (command.equals("updatesuccess")) {
					updatesuccess(req, res);
				} else if (command.equals("logout")) {
					logout(req, res);
				} else if (command.equals("delete")) {
					delete(req, res);
				} else if (command.equals("admin")) {
					admin(req, res);
				} else if (command.equals("productManager")) {
					productManager(req, res);
				} else if (command.equals("deleteProduct")) {
					deleteProduct(req, res);
				} else if (command.equals("updateProduct")) {
					updateProduct(req, res);
				} else if (command.equals("addOrdered")) {
					addOrdered(req, res);
				} else if (command.equals("updateOrdered")) {
					updateOrdered(req, res);
				} else if (command.equals("deleteOrdered")) {
					deleteOrdered(req, res);
				} else {
					req.setAttribute("msg", "유효하지 않은 command입니다.");
					req.getRequestDispatcher("view/error.jsp").forward(req, res);
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
			req.setAttribute("msg", e.getMessage());
			req.getRequestDispatcher("view/error.jsp").forward(req, res);
		}
	}
	
	//delete ordered
	private void deleteOrdered(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		String url = "view/error.jsp";
		HttpSession session = req.getSession();
		try {
			PCService.deleteOrdered((int)session.getAttribute("orderNo"));
	}catch (Exception e) {
		req.setAttribute("msg", "DB 조회 실패");
	}
		req.getRequestDispatcher(url).forward(req, res);
	}
	
	//update Ordered
	private void updateOrdered(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		String url = "view/error.jsp";
		HttpSession session = req.getSession();
		try {
			PCService.updateorderedQuantity((int)session.getAttribute("orderNo")
					,(int)session.getAttribute("neworderQuantity"));
		}catch (Exception e) {
			req.setAttribute("msg", "DB 조회 실패");
		}
		req.getRequestDispatcher(url).forward(req, res);
	}
	
	//add ordered
	private void addOrdered(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		String url = "view/error.jsp";
		HttpSession session = req.getSession();
		try {
			PCService.insertOrdered((int)session.getAttribute("orderNo")
									,(String)session.getAttribute("id")
									,(int)session.getAttribute("productId")
									,(int)session.getAttribute("orderedQuantity")
									,(String)session.getAttribute("timestamp"));
		}catch (Exception e) {
			req.setAttribute("msg", "DB 조회 실패");
		}
		req.getRequestDispatcher(url).forward(req, res);

	}
	
	// update product
	private void updateProduct(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		String url = "view/error.jsp";
		HttpSession session = req.getSession();
		try{
		PCService.updateName((int)session.getAttribute("productId"), (String)session.getAttribute("newName"));
		url = "admin.html";
		}catch (Exception e) {
			req.setAttribute("msg", "DB 조회 실패");
		}
		req.getRequestDispatcher(url).forward(req, res);
	}
	
	// delete product
	private void deleteProduct(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		String url = "view/error.jsp";
		HttpSession session = req.getSession();
		try {
		PCService.deleteProduct((int)session.getAttribute("productId"));
		url = "admin.html";
		}catch (Exception e) {
			req.setAttribute("msg", "DB 조회 실패");
	}
		req.getRequestDispatcher(url).forward(req, res);
	}

	// admin login
	private void admin(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		String adminId = req.getParameter("adminId");
		String adminPw = req.getParameter("adminPw");
		String url = "view/error.jsp";
		HttpSession session = req.getSession();
		try {
			String loginresult = PCService.adminlogin(adminId, adminPw);
			if (loginresult.equals("admin success")) {
				session.setAttribute("adminId", adminId);
				session.setAttribute("adminPw", adminPw);
				url = "admin.html";
				log.info(adminId + "매니저 로그인 성공");
			} else if (loginresult.equals("adminId")) {
				req.setAttribute("msg", "adminID를 다시 확인해주세요");
			} else if (loginresult.equals("pw")) {
				req.setAttribute("msg", "admin 비밀번호를 다시 확인해주세요");
			}
		} catch (Exception e) {
			req.setAttribute("msg", "DB 조회 실패");
		}
		req.getRequestDispatcher(url).forward(req, res);
	}
	
	// product Manager
	private void productManager(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		String url = "view/error.jsp";
		HttpSession session = req.getSession();
		try {
			req.setAttribute("productId", session.getAttribute("productId"));
			req.setAttribute("productName", session.getAttribute("productName"));
			req.setAttribute("quantity", session.getAttribute("quantity"));
			req.setAttribute("price", session.getAttribute("price"));
			
			req.setAttribute("productAll", PCService.product());
			url = "productManager.jsp";
		} catch (Exception s) {
			req.setAttribute("msg", "DB 조회 실패");
			s.printStackTrace();
		}
		req.getRequestDispatcher(url).forward(req, res);
	}

	private void logout(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		req.getRequestDispatcher("logout.jsp").forward(req, res);
	}

	// myPage
//	private void mypage(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
//		req.getRequestDispatcher("myPage.jsp").forward(req, res);
		
	// update하기
	private void update(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		req.getRequestDispatcher("crud/update.jsp").forward(req, res);

	}

	// 로그인 DB 조회
	public void login(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		String id = req.getParameter("id");
		String pw = req.getParameter("pw");
		String url = "view/error.jsp";
		HttpSession session = req.getSession();
		try {
			String loginresult = PCService.login(id, pw);
			if (loginresult.equals("success")) {
				session.setAttribute("id", id);
				session.setAttribute("pw", pw);
				url = "products.jsp";
				log.info(id + " 로그인 성공");
			} else if (loginresult.equals("id")) {
				req.setAttribute("msg", "ID를 다시 확인해주세요");
			} else if (loginresult.equals("pw")) {
				req.setAttribute("msg", "비밀번호를 다시 확인해주세요");
			}
		} catch (Exception e) {
			req.setAttribute("msg", "DB 조회 실패");
		}
		req.getRequestDispatcher(url).forward(req, res);
	}

	// 회원 가입
	public void join(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		String id = req.getParameter("id");
		String pw = req.getParameter("pw");
		String gender = req.getParameter("gender");
		String ageString = req.getParameter("age");
		String url = "view/error.jsp";
		HttpSession session = req.getSession();
		try {
			String joinresult = PCService.join(id, pw, gender, ageString);
			if (joinresult.equals("success")) {
				session.setAttribute("id", id);
				session.setAttribute("pw", pw);
				session.setAttribute("gender", gender);
				session.setAttribute("age", ageString);
				url = "products.jsp";
				log.info("회원 가입: " + session.getAttribute("id "));
			} else if (joinresult.equals("fail")) {
				req.setAttribute("msg", "중복된 ID가 존재합니다.");
			}
		} catch (Exception e) {
			req.setAttribute("msg", "가입 실패");
		}
		req.getRequestDispatcher(url).forward(req, res);
	}

	public void updatesuccess(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		HttpSession session = req.getSession();
		String id = (String) session.getAttribute("id");
		String newPw = req.getParameter("newPw");
		String url = "view/error.jsp";
		try {
			if (PCService.update(id, newPw)) {
				session.setAttribute("pw", newPw);
				url = "crud/updateSuccess.jsp";
				log.info("회원정보 수정 : " + session.getAttribute("id"));
			} else {
				req.setAttribute("msg", "수정 실패");
			}
		} catch (Exception e) {
			req.setAttribute("msg", "수정 실패");
		}
		req.getRequestDispatcher(url).forward(req, res);
	}

	public void delete(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		String url = "view/error.jsp";
		HttpSession session = req.getSession();
		String id = (String) session.getAttribute("id");
		try {
			PCService.deleteID(id);
			url = "crud/deleteSuccess.jsp";
			log.info("회원 탈퇴 : " + session.getAttribute("id"));
		} catch (Exception e) {
			e.printStackTrace();
			req.setAttribute("msg", "회원 삭제시 에러");
		}
		req.getRequestDispatcher(url).forward(req, res);
	}
}
