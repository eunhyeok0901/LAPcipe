package bps.recipe.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bps.wishlist.service.IWishService;
import bps.wishlist.service.WishListServiceImpl;
import bps.wishlist.vo.WishListVO;

/**
 * Servlet implementation class AddWishList
 */
@WebServlet("/AddWishList.do")
public class AddWishList extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		IWishService service = WishListServiceImpl.getInstance();
		String memid = request.getParameter("mem_id");
		System.out.println(memid);
		System.out.println(request.getParameter("rec_no"));
		int recno = Integer.parseInt(request.getParameter("rec_no"));
		
		WishListVO vo = new WishListVO();
		vo.setMem_id(memid);
		vo.setRec_no(recno);
		
		int result = service.checkWishList(vo);
		System.out.println(result);
		
		int mode = Integer.parseInt(request.getParameter("mode"));
		
		
		response.setCharacterEncoding("utf-8");
		
		if(mode == 1) {
			
			if(result >= 1) {
				service.deleteWishList(vo);	
				response.getWriter().write("하트검은색");
			}else {			
				service.insertWishList(vo);
				response.getWriter().write("하트빨간색");
			}
			
		}else {
			if(result >= 1) {
				response.getWriter().write("하트빨간색");
			}else {			
				response.getWriter().write("하트검은색");
			}
			
		}
		

		
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
