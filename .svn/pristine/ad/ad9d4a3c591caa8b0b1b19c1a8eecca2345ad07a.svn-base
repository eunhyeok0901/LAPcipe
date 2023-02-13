package bps.classreview.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bps.classreview.service.ClassReviewServiceImpl;
import bps.classreview.service.IClassReviewService;
import bps.classreview.vo.ClassReviewVO;

/**
 * Servlet implementation class StarScore
 */
@WebServlet("/GetClassReview.do")
public class GetClassReview extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	
	request.setCharacterEncoding("utf-8");
	
	int classNo = Integer.parseInt(request.getParameter("classNo"));
	
	IClassReviewService service = ClassReviewServiceImpl.getService();
	
	List<ClassReviewVO> list = service.getReview(classNo);
	
	request.setAttribute("reviewlist", list);
	

	
	request.getRequestDispatcher("/view/list3.jsp").forward(request, response);
	}

}
