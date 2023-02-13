package bps.recipe.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bps.postrecipe.service.IPostRecipeService;
import bps.postrecipe.service.PostRecipeServiceImpl;
import bps.postrecipe.vo.PostRecipeVO;
import bps.recipe.service.IRecipeService;
import bps.recipe.service.RecipeServiceImpl;
import bps.recipe.vo.RecipeVO;
/**
 * Servlet implementation class GetMyRecipe
 */
@WebServlet("/GetMyRecipe.do")
public class GetMyRecipe extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String myid = request.getParameter("id");
		
		// postrecipe테이블에서 where = 'a001'을 통해서
		// 해당 회원이 쓴 레시피목록들을 가져온다 .
		IPostRecipeService postservice = PostRecipeServiceImpl.getInstance();
		
		List<PostRecipeVO> list = postservice.getSomePostRecipe(myid);
		
		
		// 가져온 레시피 목록들로 레시피 테이블에서 where = '레시피일련번호'를 써서
		// 레시피에 대한 데이터들을 가져온다. 
		IRecipeService recipeservice = RecipeServiceImpl.getInstance();
		
		if(list == null || list.size() == 0) {
			request.setAttribute("flag", "false");
			request.getRequestDispatcher("/process/showmyrecipeprocess.jsp").forward(request, response);
		}else {
			// recipevo들에 대한 데이터를 담을 리스트 
			
			
			List<RecipeVO> recipes = new ArrayList<RecipeVO>();
			for(int i = 0; i < list.size(); i++) {
				RecipeVO vo = recipeservice.getOneRecipe(list.get(i).getRec_no());
				recipes.add(vo);
				
			}
			request.setAttribute("flag", "true");
			request.setAttribute("recipes", recipes);
			request.getRequestDispatcher("/process/showmyrecipeprocess.jsp").forward(request, response);
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
