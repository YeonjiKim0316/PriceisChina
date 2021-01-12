package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import lombok.extern.slf4j.Slf4j;
import priceischina.model.dto.OrderedDTO;
import priceischina.model.dto.ProductDTO;
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
				} else if (command.equals("productManager")) {
					productManager(req, res);
				} else if (command.equals("dataManager")) {
					dataManager(req, res);
				} else if (command.equals("orderedManager")) {
					orderedManager(req, res);
				} else if (command.equals("insertProduct")) {
					insertProduct(req, res);
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
	
	//update Ordered
	private void updateOrdered(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		String url = "view/error.jsp";
		HttpSession session = req.getSession();
		try {
			PCService.updateorderedQuantity(Integer.parseInt((String)req.getParameter("orderNo"))
					,Integer.parseInt((String)req.getParameter("neworderQuantity")));
			session.setAttribute("orderedAll", PCService.ordered());
			url = "crud/orderedManager.jsp";
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
			PCService.insertOrdered(Integer.parseInt((String)req.getParameter("orderNo"))
									,(String)req.getParameter("id")
									,Integer.parseInt((String)req.getParameter("productId"))
									,Integer.parseInt((String)req.getParameter("orderedQuantity"))
									,(String)req.getParameter("timestamp"));
			session.setAttribute("orderedAll", PCService.ordered());
			url = "order.jsp";
		}catch (Exception e) {
			req.setAttribute("msg", "DB 조회 실패");
		}
		req.getRequestDispatcher(url).forward(req, res);

	}
	
		//delete ordered
		private void deleteOrdered(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
			String url = "view/error.jsp";
			HttpSession session = req.getSession();
			int orderNo = Integer.parseInt((String)req.getParameter("orderNo"));
			if(orderNo != 0) {
			try {
			PCService.deleteOrdered(orderNo);
			session.setAttribute("orderedAll", PCService.ordered());
			url = "crud/orderedManager.jsp";
			}
			catch (Exception e) {
				req.setAttribute("msg", "주문 삭제 실패");
				e.printStackTrace();	
		}
			req.getRequestDispatcher(url).forward(req, res);
		}
		}
	
		// ordered Manager
		private void orderedManager(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
			String url = "view/error.jsp";
			HttpSession session = req.getSession();
			try {
				List<OrderedDTO> orderedAll = PCService.ordered();
				session.setAttribute("orderedAll", orderedAll);
				url = "crud/orderedManager.jsp";
			} catch (Exception s) {
				req.setAttribute("msg", "DB 조회 실패");
				s.printStackTrace();
			}
			req.getRequestDispatcher(url).forward(req, res);
		}
			
	// update product
	private void updateProduct(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		String url = "view/error.jsp";
		HttpSession session = req.getSession();
		try{
		PCService.updateName(Integer.parseInt((String)req.getParameter("productId")), (String)req.getParameter("newName"));
		session.setAttribute("productAll", PCService.product());
		url = "crud/productManager.jsp";
		}catch (Exception e) {
			req.setAttribute("msg", "DB 조회 실패");
		}
		req.getRequestDispatcher(url).forward(req, res);
	}
	
	//insert Product
	private void insertProduct(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		String url = "view/error.jsp";
		HttpSession session = req.getSession();
		try {
			PCService.insertProduct(Integer.parseInt((String) req.getParameter("productId")),
					(String) req.getParameter("productName"), Integer.parseInt((String) req.getParameter("quantity")),
					Integer.parseInt((String) req.getParameter("price")));
			session.setAttribute("productAll", PCService.product());
			url = "crud/productManager.jsp";
		} catch (Exception s) {
			req.setAttribute("errorMsg", s.getMessage());
			s.printStackTrace();
		}
		req.getRequestDispatcher(url).forward(req, res);
	}
	
	// delete product
	private void deleteProduct(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		String url = "view/error.jsp";
		HttpSession session = req.getSession();
		int productId = Integer.parseInt((String)req.getParameter("productId"));
		if(productId != 0) {
		try {
		PCService.deleteProduct(productId);
		session.setAttribute("productAll", PCService.product());
		url = "crud/productManager.jsp";
		}
		catch (Exception e) {
			req.setAttribute("msg", "제품 삭제 실패");
			e.printStackTrace();	
	}
		req.getRequestDispatcher(url).forward(req, res);
	}
	}
			
	// product Manager
	private void dataManager(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		String url = "view/error.jsp";
		HttpSession session = req.getSession();
		try {
			List<ProductDTO> productAll = PCService.product();
			session.setAttribute("productAll", productAll);
			url = "prodMaker.jsp";
		} catch (Exception s) {
			req.setAttribute("msg", "DB 조회 실패");
			s.printStackTrace();
		}
		req.getRequestDispatcher(url).forward(req, res);
	}
	
	// product Manager
		private void productManager(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
			String url = "view/error.jsp";
			HttpSession session = req.getSession();
			try {
				List<ProductDTO> productAll = PCService.product();
				session.setAttribute("productAll", productAll);
				url = "crud/productManager.jsp";
			} catch (Exception s) {
				req.setAttribute("msg", "DB 조회 실패");
				s.printStackTrace();
			}
			req.getRequestDispatcher(url).forward(req, res);
		}

	private void logout(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		String url = "view/error.jsp";
		HttpSession session = req.getSession();
			try{
			session.invalidate();
			session = null; 
			url = "products.jsp";
			} catch (Exception e) {
			req.setAttribute("msg", "로그아웃 실패");
		}
		req.getRequestDispatcher(url).forward(req, res);
	}

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
				log.info("회원 가입: " + id);
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
				log.info("비밀번호 수정 : " + id);
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
			log.info("회원 탈퇴 : " + id);
		} catch (Exception e) {
			e.printStackTrace();
			req.setAttribute("msg", "회원 삭제시 에러");
		}
		req.getRequestDispatcher(url).forward(req, res);
	}
}
