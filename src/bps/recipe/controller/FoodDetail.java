package bps.recipe.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bps.ingredient.service.IIngredientService;
import bps.ingredient.service.IngredientServiceImpl;
import bps.ingredient.vo.IngrediVO;

/**
 * Servlet implementation class FoodDetail
 */
@WebServlet("/FoodDetail.do")
public class FoodDetail extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		String ing_name = request.getParameter("foodname");
		
		IIngredientService service = IngredientServiceImpl.getInstance();
		
		List<IngrediVO> ingList = service.getIngredient(ing_name);
		
		request.setAttribute("ingList", ingList);
		
		request.getRequestDispatcher("view/ingredient.jsp").forward(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
