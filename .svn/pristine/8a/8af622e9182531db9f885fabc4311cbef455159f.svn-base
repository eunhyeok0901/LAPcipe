package bps.classdetail.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bps.classdetail.dao.ClassDetailDaoImpl;
import bps.classdetail.service.ClassDetailServiceImpl;
import bps.classdetail.service.IClassDetailService;
import bps.classdetail.vo.ClassDetailVO;
import bps.classdetail.vo.DetailVO;

@WebServlet("/GetClassDetail.do")
public class GetClassDetail extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		doGet(request,response);
	
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		System.out.println(request.getParameter("classNo"));
		
		int classNo = Integer.parseInt(request.getParameter("classNo"));
		
		IClassDetailService service = ClassDetailServiceImpl.getservice();
		
		List<DetailVO> list = service.getClassDetail(classNo);
		request.setAttribute("list", list);
		
		request.getRequestDispatcher("/view/list2.jsp").forward(request, response);
		

	}
	
	
	
	

}
