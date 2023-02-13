package bps.payment.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bps.cookclass.vo.CookClassVO;
import bps.member.vo.MemberVO;
import bps.payment.service.IPaymentService;
import bps.payment.service.PaymentServiceImpl;

/**
 * Servlet implementation class PaymentPoint
 */
@WebServlet("/PaymentPoint.do")
public class PaymentPoint extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
request.setCharacterEncoding("utf-8");
		System.out.println("서블릿 3다");
		
//		System.out.println("서블릿 "+request.getParameter("classNo"));
//		System.out.println(Integer.parseInt(request.getParameter("classNo")));
		int cnum = Integer.parseInt(request.getParameter("classNo"));
		System.out.println(request.getParameter("memId"));
		String id = (String) request.getParameter("memId");
		request.setAttribute("memId", id );
//		request.getParameter("Id");
		System.out.println("서블릿 Payment " +cnum);
		
		IPaymentService service = PaymentServiceImpl.getService();
		int res = service.insertMileagePlus(id);
//		List<CookClassVO> list = service.getClass(cnum);
//		System.out.println(cvo);
//		System.out.println(3);
//		request.setAttribute("memId", );
		System.out.println(res);
//		request.getRequestDispatcher("/view/paymentForm.jsp").forward(request, response);
//		request.getRequestDispatcher("/view/payment/paymentSelect.jsp").forward(request, response);
		request.getRequestDispatcher("/view/payment/success.jsp").forward(request, response);
		// 0. 클라이언트 전송시 데이타 받기

		// 1. service객체 얻기

		// 2. service메소드 호출 - 결과값 받기 - List
		// 3 request에 저장

		// 4. view페이지로 이동 - json데이타 생성

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
