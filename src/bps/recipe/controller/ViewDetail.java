package bps.recipe.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bps.cookway.service.CookwayServiceImpl;
import bps.cookway.service.ICookwayService;
import bps.cookway.vo.CookwayVO;
import bps.recipe.service.IRecipeService;
import bps.recipe.service.RecipeServiceImpl;
import bps.recipe.vo.RecipeVO;
import bps.recipereview.service.IRecipeReviewService;
import bps.recipereview.service.RecipeReviewServiceImpl;
import bps.recipereview.vo.RecipeReviewVO;
import bps.tag.service.ITagService;
import bps.tag.service.TagServiceImpl;
import bps.tag.vo.TagVO;
import bps.use_food.service.IUse_foodService;
import bps.use_food.service.Use_foodServiceImpl;
import bps.use_food.vo.Use_foodVO;

/**
 * Servlet implementation class ViewDetail
 */
@WebServlet("/ViewDetail.do")
public class ViewDetail extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		int rec_no = Integer.parseInt(request.getParameter("rec_no"));
		System.out.println(rec_no);
//		String tag_name = request.getParameter("tag_name");
//		System.out.println(tag_name);
		
		IRecipeService recipeservice = RecipeServiceImpl.getInstance();
		ICookwayService cookservice = CookwayServiceImpl.getInstance();
		IUse_foodService foodservice = Use_foodServiceImpl.getInstance();
		IRecipeReviewService reviewservice = RecipeReviewServiceImpl.getInstance();
		ITagService tagService = TagServiceImpl.getInstance();
		RecipeVO recipevo = recipeservice.getOneRecipe(rec_no);
		
		recipeservice.plusCount(rec_no);
		List<CookwayVO> cookvo = cookservice.getSomeCookway(rec_no);
//		List<Use_foodVO> foods = foodservice.getSomeFood(rec_no);
		List<RecipeReviewVO> reviews = reviewservice.getSomeReview(rec_no);
		List<Use_foodVO> sourceList = foodservice.getSource(rec_no);
		List<Use_foodVO> ingredientList = foodservice.getIngredient(rec_no);
		List<TagVO> tagList = tagService.getTag(rec_no);

		
		request.setAttribute("recipevo", recipevo);
		request.setAttribute("cookvo", cookvo);
//		request.setAttribute("foods", foods);
		request.setAttribute("reviews", reviews);
		request.setAttribute("sourceList", sourceList);
		request.setAttribute("ingredientList", ingredientList);
		request.setAttribute("tagList", tagList);
		request.setAttribute("rec_no", rec_no);
		
		request.getRequestDispatcher("/view/RecipeView.jsp").forward(request, response);
		
		
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
