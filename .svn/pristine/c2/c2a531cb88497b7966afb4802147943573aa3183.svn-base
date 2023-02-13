package bps.recipereview.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bps.recipereview.service.IRecipeReviewService;
import bps.recipereview.service.RecipeReviewServiceImpl;
import bps.recipereview.vo.RecipeReviewVO;

/**
 * Servlet implementation class GetMyReview
 */
@WebServlet("/GetMyReview.do")
public class GetMyReview extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		IRecipeReviewService reviewservice = RecipeReviewServiceImpl.getInstance();
		String mem_id = request.getParameter("id");
		
		List<RecipeReviewVO> list = reviewservice.getMyReview(mem_id);
		
		if(list == null || list.size() == 0){
			request.setAttribute("flag", "false");
			request.getRequestDispatcher("/process/showmyreview.jsp").forward(request, response);
		}else {
			request.setAttribute("flag", "true");
			request.setAttribute("reviews", list);
			request.getRequestDispatcher("/process/showmyreview.jsp").forward(request, response);
			
		}
		
	}


}
