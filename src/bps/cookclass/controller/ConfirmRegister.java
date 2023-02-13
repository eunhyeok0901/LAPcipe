 package bps.cookclass.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bps.buyedclass.vo.BuyedClassVO;
import bps.cookclass.service.CookClassServiceImpl;
import bps.cookclass.service.ICookClassService;

/**
 * Servlet implementation class ConfirmRegister
 */
@WebServlet("/ConfirmRegister.do")
public class ConfirmRegister extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

//		"classNo":classNo,"mem_id":mem_id

		request.setCharacterEncoding("utf-8");
		
		int classNo = Integer.parseInt(request.getParameter("classNo"));
		String mem_id = request.getParameter("mem_id");
		
		ICookClassService service = CookClassServiceImpl.getservice();
		
		BuyedClassVO vo = new BuyedClassVO();
		vo.setClass_no(classNo);
		vo.setMem_id(mem_id);
		
		
		int count = service.countClass(vo);
		
		request.setAttribute("count", count);
		

		
		request.getRequestDispatcher("/view/classvo.jsp").forward(request, response);
		
	}

}
