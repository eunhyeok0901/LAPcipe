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
 * Servlet implementation class InsertReview
 */
@WebServlet("/InsertReview.do")
public class InsertReview extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("utf-8");
		
		String text=request.getParameter("text");
		int score=Integer.parseInt(request.getParameter("score"));
		String myid=request.getParameter("myid");
		int no=Integer.parseInt(request.getParameter("no"));
		
		IClassReviewService service = ClassReviewServiceImpl.getService();
		ClassReviewVO vo = new ClassReviewVO();
		vo.setCrev_con(text);
		vo.setCrev_score(score);
		vo.setMem_id(myid);
		vo.setClass_no(no);
		
		int count = service.insertReview(vo);
		System.out.println(count);
		
		request.getRequestDispatcher("/view/mypage.jsp").forward(request, response);
		
//		response.setCharacterEncoding("utf-8");
//		response.getWriter().write(count);
		
		
	
		
		
	
	
	}

}
