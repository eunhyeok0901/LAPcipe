package bps.recipe.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bps.recipe.service.IRecipeService;
import bps.recipe.service.RecipeServiceImpl;
import bps.recipe.vo.RecipeVO;
import bps.wishlist.service.IWishService;
import bps.wishlist.service.WishListServiceImpl;
import bps.wishlist.vo.WishListVO;

/**
 * Servlet implementation class GetMyWhishList
 */
@WebServlet("/GetMyWhishList.do")
public class GetMyWhishList extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String myid = request.getParameter("id");
		
		// postrecipe테이블에서 where = 'a001'을 통해서
		// 해당 회원이 쓴 레시피목록들을 가져온다 .
		IWishService whishservice = WishListServiceImpl.getInstance();
		
		List<WishListVO> list = whishservice.getMyWishList(myid);
		
		
		IRecipeService recipeservice = RecipeServiceImpl.getInstance();
		
		if(list == null || list.size() == 0) {
			request.setAttribute("flag", "false");
			request.getRequestDispatcher("/process/showmywhishprocess.jsp").forward(request, response);
		}else {
			// recipevo들에 대한 데이터를 담을 리스트 
			
			
			List<RecipeVO> recipes = new ArrayList<RecipeVO>();
			for(int i = 0; i < list.size(); i++) {
				RecipeVO vo = recipeservice.getOneRecipe(list.get(i).getRec_no());
				recipes.add(vo);
				
			}
			request.setAttribute("flag", "true");
			request.setAttribute("recipes", recipes);
			request.getRequestDispatcher("/process/showmywhishprocess.jsp").forward(request, response);
		}
	}

}
