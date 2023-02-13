package bps.buyedclass.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bps.buyedclass.service.BuyedClassServiceImpl;
import bps.buyedclass.service.IBuyedClassService;
import bps.buyedclass.vo.BuyedClassVO;
import bps.buyedclass.vo.BuyedVO;
import bps.classreview.service.ClassReviewServiceImpl;
import bps.classreview.service.IClassReviewService;

/**
 * Servlet implementation class RegisteredClass
 */
@WebServlet("/RegisteredClass.do")
public class RegisteredClass extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


		request.setCharacterEncoding("utf-8");
		
		String id = request.getParameter("id");
		IBuyedClassService service = BuyedClassServiceImpl.getService();
		
		List<BuyedVO> list = service.registeredClass(id);
		
		request.setAttribute("list", list);
		
		request.getRequestDispatcher("/view/list5.jsp").forward(request, response);
		
		
		
	}

}
