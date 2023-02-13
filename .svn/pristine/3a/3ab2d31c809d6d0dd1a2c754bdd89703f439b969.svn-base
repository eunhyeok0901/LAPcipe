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

/**
 * Servlet implementation class CountReview
 */
@WebServlet("/CountReview.do")
public class CountReview extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		request.setCharacterEncoding("utf-8");
		
		String id = request.getParameter("myid");
		int no = Integer.parseInt(request.getParameter("no"));
		
		
		IClassReviewService service = ClassReviewServiceImpl.getService();
		
		ClassReviewVO vo = new ClassReviewVO();
		vo.setClass_no(no);
		vo.setMem_id(id);
		
		System.out.println(no);
		System.out.println(id);
		
		
		
		int count = service.countReview(vo);
		System.out.println(count);
		
		response.setCharacterEncoding("utf-8");
		response.setContentType("application/json; charset=utf-8");

		
		response.getWriter().write("{ \"count\" : " + count + " }");
		
//		request.setAttribute("count", count);
//		
//		request.getRequestDispatcher("/view/mypage.jsp").forward(request, response);
		
	
	}

}
