package bps.recipereview.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bps.recipereview.service.IRecipeReviewService;
import bps.recipereview.service.RecipeReviewServiceImpl;
import bps.recipereview.vo.RecipeReviewVO;

/**
 * Servlet implementation class RecipeReviewInsert
 */
@WebServlet("/RecipeReviewInsert.do")
public class RecipeReviewInsert extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String content = request.getParameter("con");
		System.out.println(content);
		int star_point = Integer.parseInt(request.getParameter("score"));
		System.out.println(star_point);
		String user_id = request.getParameter("userId");
		System.out.println(user_id);
		int rec_no = Integer.parseInt(request.getParameter("rec_no"));
		System.out.println(rec_no);
		RecipeReviewVO vo = new RecipeReviewVO();
		vo.setMem_id(user_id);
		vo.setRrev_score(star_point);
		vo.setRrev_con(content);
		vo.setRec_no(rec_no);
		
		IRecipeReviewService service = RecipeReviewServiceImpl.getInstance();
		
		service.insertReview(vo);
		
	}

}
