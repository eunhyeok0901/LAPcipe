package bps.recipe.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bps.recipe.service.IRecipeService;
import bps.recipe.service.RecipeServiceImpl;
import bps.recipe.vo.RecipeVO;
import bps.recipereview.service.IRecipeReviewService;
import bps.recipereview.service.RecipeReviewServiceImpl;
import bps.recipereview.vo.RecipeReviewVO;

/**
 * Servlet implementation class ShowRecipeListByRank
 */
@WebServlet("/ShowRecipeListByRank.do")
public class ShowRecipeListByRank extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String mode = request.getParameter("mode");
		
		
		IRecipeService recipeservice = RecipeServiceImpl.getInstance();
		IRecipeReviewService reviewservice = RecipeReviewServiceImpl.getInstance();
		
		List<RecipeVO> recipes = new ArrayList<RecipeVO>();
		
		if(mode.equals("score")) {
			
			List<RecipeReviewVO> reviews = reviewservice.getAvgScore();
			
			for(RecipeReviewVO reviewvo : reviews) {
				RecipeVO recipevo = recipeservice.getOneRecipe(reviewvo.getRec_no());
				recipes.add(recipevo);
			}
			
			request.setAttribute("reviews", reviews);
			request.setAttribute("recipes", recipes);
			request.getRequestDispatcher("/view/reciperanking.jsp").forward(request, response);
		}else {
			recipes = recipeservice.getRecipeByCount();
			request.setAttribute("recipes", recipes);
			request.getRequestDispatcher("/view/reciperankByCount.jsp").forward(request, response);
		
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
