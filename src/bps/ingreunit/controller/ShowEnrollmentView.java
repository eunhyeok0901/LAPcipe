package bps.ingreunit.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bps.ingreunit.service.IingreunitService;
import bps.ingreunit.service.IngreunitServiceImpl;
import bps.ingreunit.vo.IngreunitVO;

/**
 * Servlet implementation class ShowEnrollmentView
 */
@WebServlet("/ShowEnrollmentView.do")
public class ShowEnrollmentView extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		IingreunitService service = IngreunitServiceImpl.getInstance();
		System.out.println(service);
		List<IngreunitVO> list1 = service.getAllMaterial("재료");
		System.out.println(list1);
		List<IngreunitVO> list2 = service.getAllMaterial("양념");
		System.out.println(list2);
		
		request.setAttribute("list1", list1);
		request.setAttribute("list2", list2);
		
		request.getRequestDispatcher("/process/enrollrecipeprocess.jsp").forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
