package bps.recipe.controller;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import bps.cookway.service.CookwayServiceImpl;
import bps.cookway.service.ICookwayService;
import bps.cookway.vo.CookwayVO;
import bps.postrecipe.service.IPostRecipeService;
import bps.postrecipe.service.PostRecipeServiceImpl;
import bps.postrecipe.vo.PostRecipeVO;
import bps.recipe.service.IRecipeService;
import bps.recipe.service.RecipeServiceImpl;
import bps.recipe.vo.RecipeVO;
import bps.tag.service.ITagService;
import bps.tag.service.TagServiceImpl;
import bps.tag.vo.TagVO;
import bps.use_food.service.IUse_foodService;
import bps.use_food.service.Use_foodServiceImpl;
import bps.use_food.vo.Use_foodVO;


/**
 * Servlet implementation class RecipeEnroll
 */
@WebServlet("/RecipeEnroll.do")
@MultipartConfig(
		fileSizeThreshold = 1024 * 1024 * 10, maxFileSize = 1024 * 1024 * 30, 
		maxRequestSize = 1024 * 1024 * 100 
		)
public class RecipeEnroll extends HttpServlet {
	private static final long serialVersionUID = 1L;


	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		request.setCharacterEncoding("utf-8");
//		String[] foods = request.getParameterValues("food");
//		for(String s : foods) {
//			System.out.println(s);
//		}
//		
//		String[] quantities = request.getParameterValues("quantity1");
//		for(String s : quantities) {
//			System.out.println(s);
//		}
//		
//		String[] sources = request.getParameterValues("source");
//		for(String s : sources) {
//			System.out.println(s);
//		}
//		
//		if(request.getParameter("cookway5").trim().equals("")) {
//			System.out.println("cookway1에 아무것도 기입하지 않음!");
//		}
//		
//		int totalInsert = foods.length;
		
		// 1. 우선 레시피 테이블에 데이터를 기입한다.  
		String mem_id = request.getParameter("memId");
		System.out.println("레시피 등록할 때 아이디 들어왔는지 체크 아이디 : " + mem_id);
		String titleNM = request.getParameter("title");
		String recipeAnnounce = request.getParameter("announcement");
		String category = request.getParameter("category");
		
		// 레시피 대표 사진을 업로드 하고 db에 반영시키는 코드 
		String uploadPath = "c:/uploadFiles"; 
		
		File f = new File(uploadPath);
		if(!f.exists()) {
			f.mkdirs();
		}
		
		Part mainimgpart = request.getPart("mainimg");
		String saveFileName = null;
		if(extractFile(mainimgpart)) {
			saveFileName = UUID.randomUUID().toString();
			mainimgpart.write(uploadPath+File.separator+saveFileName);
			
		}
		
		// recipeVO에다가 데이터들을 모두 저장 시킨후 insert시킴과 동시에 레시피 일련번호를 받아온다.
		RecipeVO recipevo = new RecipeVO();
		
		recipevo.setRec_name(titleNM);
		recipevo.setRec_con(recipeAnnounce);
		recipevo.setRec_car(category);
		recipevo.setRec_video(saveFileName);
		
		IRecipeService recipeservice = RecipeServiceImpl.getInstance();
		
		System.out.println(recipevo.getRec_car());
		System.out.println(recipevo.getRec_con());
		
		recipeservice.insertRecipe(recipevo);
		
		
		// 2. 등록한 레시피 테이블에 데이터를 추가해준다 
		PostRecipeVO postvo = new PostRecipeVO();
		postvo.setMem_id(mem_id);
		IPostRecipeService postservice = PostRecipeServiceImpl.getInstance();
		postservice.insertPostRecipe(postvo);
		/////////////////////////////////////////////
		
		// 3. 아래 for문이 끝나면 조리방법에 대한 데이터들이 테이블에 저장된다.  
		// 전체 Part객체 개수만큼 반복처리 
		for(Part part : request.getParts()) {
			boolean check = extractFile(part);  
			
			// 찾은 파일명이 공백""이면 이것은 파일이 아닌 일반 파라미터라는 의미이다. 
			if(check) {  // 파일인지 검사    
				
				String partname = part.getName();
				// 사진이 조리방법에 대한 사진인지 다시 한번 검사 
				if(partname.startsWith("uploadimg")) {
					// 조리순서
					String cookorder = partname.substring(9, partname.length());
					// 순서에 매핑되는 사진명
					saveFileName = UUID.randomUUID().toString();
					// 사진을 로컬에 업로드 
					part.write(uploadPath+File.separator+saveFileName);  // 파일 저장 
					// 조리내용 
					String cookway = request.getParameter("cookway"+cookorder);
					
					// 해당 내용들을 insert시킨다(조리방법 테이블에)
					CookwayVO cookvo = new CookwayVO();
					cookvo.setCook_index(cookorder);
					cookvo.setCook_con(cookway);
					cookvo.setCook_image(saveFileName);
					
					ICookwayService cookservice = CookwayServiceImpl.getInstance();
					cookservice.cookwayInsert(cookvo);
					
				}
				
			} // if문 끝...
			
		} // for문 끝...
		
		// 4. 태그 테이블에 데이터를 추가시킴 
		String tag = request.getParameter("tag");
		
		String[] tags = tag.split(",");
		System.out.println(tags);
		ITagService tagservice = TagServiceImpl.getInstance();
		
		for(String onetag : tags) {
			String trimmedtag = onetag.trim();
			TagVO tagvo = new TagVO();
			tagvo.setTag_name(trimmedtag);
			tagservice.insertTag(tagvo);
		}
		
		
		
		// 5. 재료사용 테이블에 데이터를 추가시킴 
		String[] foods = request.getParameterValues("food");
		String[] sources = request.getParameterValues("source");
		String[] quantities = request.getParameterValues("quantity1");
		int start_cnt1 = 0;
		int start_cnt2 = 1;
		
		for(int i = 0; i < foods.length; i++) {
			Use_foodVO vo1 = new Use_foodVO();
			Use_foodVO vo2 = new Use_foodVO();
			vo1.setIng_name(foods[i]);
			vo1.setIng_qty(Integer.parseInt(quantities[start_cnt1]));
			
			vo2.setIng_name(sources[i]);
			vo2.setIng_qty(Integer.parseInt(quantities[start_cnt2]));
		
			IUse_foodService use_food_service = Use_foodServiceImpl.getInstance();
			use_food_service.use_foodInsert(vo1);
			use_food_service.use_foodInsert(vo2);
			
			start_cnt1 += 2;
			start_cnt2 += 2;
		}
		
		request.getRequestDispatcher("/ShowRecipeList.do").forward(request, response);
		
	} // doPost메서드 끝...
	
	// -----------------------------
	/*
	 * - Part구조 
	 * 1) 파일이 아닌 일반 데이터일 경우 
	 * ----------------------------29456132sdf123123132dsfads56654 ==> Part를 구분하는 구분선 
	 * content-disposition : form-data; name="username"  ==> 파라미터명 
	 * 			==> 빈줄 
	 * 홍길동         ==> 파라미터 값 
	 * 
	 * 2) 파일일 경우 
	 * --------------------------29456132sdf123123132dsfads56654  ==> Part를 구분하는 구분선 
	 * content-disposition : form-data; name="upFile1"; filename="test1.txt"    ==> 파일 정보 
	 * content-type : text/plain                      ==> 파일의 종류 
	 * 							 ==> 빈줄 
	 * abcde1231245 ==> 파일 내용 
	 * 			
	 */

	
	// Part구조 안에서 파일을 찾는 메서드 
	private boolean extractFile(Part part) {
		boolean filecheck = false;
		String content = part.getHeader("content-disposition");
		String[] items = content.split(";");
		for(String item : items) {
			if(item.trim().startsWith("filename")) {   // Part가 파일인지 검사 
				filecheck = true;
			}
		}
		return filecheck; 
	}
		
		
	

}
