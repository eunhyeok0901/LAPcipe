package bps.cookclass.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bps.cookclass.service.CookClassServiceImpl;
import bps.cookclass.service.ICookClassService;
import bps.cookclass.vo.CookClassVO;

/**
 * Servlet implementation class Classdetail
 */
@WebServlet("/Classdetail.do")
public class Classdetail extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		
		int classNO = Integer.parseInt(request.getParameter("class_no"));
		
		ICookClassService service = CookClassServiceImpl.getservice();
		
		List<CookClassVO> list = service.getClassDetail(classNO);
		
		request.setAttribute("list", list);
		
		request.getRequestDispatcher("/view/list.jsp").forward(request, response);
		
		
		
	}

}
