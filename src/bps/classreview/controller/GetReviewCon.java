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
 * Servlet implementation class GetReviewCon
 */
@WebServlet("/GetReviewCon.do")
public class GetReviewCon extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("utf-8");
		
		int classNo = Integer.parseInt(request.getParameter("no"));
		String id = request.getParameter("myid");
		
		
		IClassReviewService service = ClassReviewServiceImpl.getService();
	
		ClassReviewVO vo = new ClassReviewVO();
		vo.setClass_no(classNo);
		vo.setMem_id(id);
		
		String reviewCon = service.getReviewCon(vo);
		System.out.println(reviewCon);
		
//		request.setAttribute("reviewlist", list);
//		
//		request.getRequestDispatcher("/view/list3.jsp").forward(request, response);
		
		

		response.setCharacterEncoding("utf-8");
		response.setContentType("application/json; charset=utf-8");
//		response.setContentType("text/html; charset=utf-8");

		
		response.getWriter().write("{ \"reviewCon\" : \"" + reviewCon + "\" }");
//		response.getWriter().write(reviewCon);
	}

}
