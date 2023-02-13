package bps.classreview.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bps.classreview.service.ClassReviewServiceImpl;
import bps.classreview.service.IClassReviewService;
import bps.classreview.vo.ClassReviewVO;

/**
 * Servlet implementation class EditReview
 */
@WebServlet("/EditReview.do")
public class EditReview extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");

		
		String myid = request.getParameter("myid");
		int no=Integer.parseInt(request.getParameter("no"));
		String newCOn=request.getParameter("newCOn");
		
		System.out.println(myid);
		System.out.println(no);
		System.out.println(newCOn);
		
		ClassReviewVO vo1 = new ClassReviewVO();
		
		vo1.setMem_id(myid);
		vo1.setClass_no(no);
		vo1.setCrev_con(newCOn);
		
		IClassReviewService service = ClassReviewServiceImpl.getService();
		int count = service.insertNewCon(vo1);

		
		
		response.setCharacterEncoding("utf-8");
		response.setContentType("application/json; charset=utf-8");
//		response.setContentType("text/html; charset=utf-8");

		
//		response.getWriter().write("{ \"count\" : \"" + count + "\" }");
		response.getWriter().write("{ \"count\" : " + count + " }");
//		response.getWriter().write(reviewCon);		
	}

}
