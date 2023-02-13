package bps.classreview.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bps.classreview.service.ClassReviewServiceImpl;
import bps.classreview.service.IClassReviewService;
import bps.classreview.vo.ClassReviewVO;
import bps.classreview.vo.ReviewVO;

/**
 * Servlet implementation class RegisterClass
 */
@WebServlet("/RegisterClass.do")
public class RegisterClass extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("utf-8");
		
		String id = request.getParameter("id");
		
		IClassReviewService service = ClassReviewServiceImpl.getService();
		
		List<ReviewVO> list = service.registerClass(id);
		
		request.setAttribute("list", list);
		
		request.getRequestDispatcher("/view/list4.jsp").forward(request, response);
		
	}

}
