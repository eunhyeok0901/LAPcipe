package bps.classreview.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bps.classdetail.service.IClassDetailService;
import bps.classreview.service.ClassReviewServiceImpl;
import bps.classreview.service.IClassReviewService;

/**
 * Servlet implementation class DeleteReview
 */
@WebServlet("/DeleteReview.do")
public class DeleteReview extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		
		String con = request.getParameter("con");
		
		IClassReviewService service = ClassReviewServiceImpl.getService();
		
		int count =  service.deleteReview(con);
		
//		request.setAttribute("count", count);
		
		response.setCharacterEncoding("utf-8");
		response.setContentType("application/json; charset=utf-8");
		
//		request.getRequestDispatcher("/view/mainPage.jsp").forward(request, response);
		
		response.getWriter().write("{ \"count\" : " + count + " }");


		
		
	}

}
