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
import bps.util.PageUtil;

/**
 * Servlet implementation class ShowRecipeList
 */
@WebServlet("/ShowRecipeList.do")
public class ShowRecipeList extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		IRecipeService service = RecipeServiceImpl.getInstance();
		Map<String, Object> map = new HashMap<String, Object>();
		List<RecipeVO> recipes = new ArrayList<RecipeVO>();
		
		
		int pageSize = PageUtil.pageSize;
		int blockPage = PageUtil.blockpage;
		int totalCount = 0;
		String searchword = request.getParameter("searchword");
		String tagName = request.getParameter("tag_name");
		
		System.out.println(searchword);
		
		int pageNum = 1;
		String pageTemp = request.getParameter("pageNum");
		if(pageTemp != null && !pageTemp.equals("")) {
			pageNum = Integer.parseInt(pageTemp);
		}
		
		int start = (pageNum - 1) * pageSize + 1;
		int end = pageNum * pageSize;   
		map.put("start",start);
		map.put("end",end);
		map.put("searchword", searchword);
		map.put("tag_name", tagName);
		
		// 검색한 단어가 있을 때
		if(searchword != null) {
			
			recipes = service.searchRecipe(map);
			totalCount = service.searchRecipeCount(map);
		
		}else if(tagName != null){  // tag를 통해 들어왔을 때
			recipes = service.searchTag(map);
			totalCount = service.searchTagCount(map);
		}else { // 검색 안 했을 때 
			recipes = service.getAllRecipeForPaging(map);
			totalCount = service.getAllRecipeCount();
		}
		
		String pagingImg = PageUtil.pagingStr(totalCount, pageSize, blockPage, pageNum, request.getContextPath()+"/ShowRecipeList.do");
		
		map.put("pagingimg", pagingImg);
		request.setAttribute("sword", searchword);
		request.setAttribute("list", recipes);
		request.setAttribute("map", map);
		request.getRequestDispatcher("/view/recipemain.jsp").forward(request, response);  
		
		
//		if(searchCategory == null) {
//			recipes = service.getAllRecipe();
//			request.setAttribute("list", recipes);
//			request.getRequestDispatcher("/view/recipemain.jsp").forward(request, response);
//		}else {
//			
//			if("".equals(searchWord)&&searchCategory.equals("전체")) {
//				map.put("searchWord", searchWord);
//				map.put("searchCategory", searchCategory);
//				recipes = service.getAllRecipe();
//				
//			}else if(!("".equals(searchWord))&&searchCategory.equals("전체")){
//				map.put("searchWord", searchWord);
//				map.put("searchCategory", searchCategory);
//				recipes = service.getSomeRecipe1(map);
//				
//			}else {
//				map.put("searchWord", searchWord);
//				map.put("searchCategory", searchCategory);
//				
//				
//				recipes = service.getSomeRecipe2(map);
//				
//			}
//			request.setAttribute("list", recipes);
//			
//			request.getRequestDispatcher("/view/recipemain.jsp").forward(request, response);
//		}
		
		
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
