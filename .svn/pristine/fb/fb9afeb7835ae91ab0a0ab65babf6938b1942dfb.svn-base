package bps.payment.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.mail.Session;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.eclipse.jdt.internal.compiler.ast.ThisReference;

import bps.cookclass.vo.CookClassVO;
import bps.payment.service.IPaymentService;
import bps.payment.service.PaymentServiceImpl;
import bps.payment.vo.PaymentVO;

@WebServlet("/PaymentForm.do")
public class Payment extends HttpServlet {
	private static final long serialVersionUID = 1L;
	static Logger logger = Logger.getLogger(ThisReference.class);
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request,response);
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		
		System.out.println("서블릿 "+request.getParameter("classNo"));
//		System.out.println(Integer.parseInt(request.getParameter("classNo")));
		int cnum = Integer.parseInt(request.getParameter("classNo"));
		System.out.println("memId " +request.getParameter("memId"));
//		request.getParameter("Id");
		String id = (String) request.getParameter("memId");
		request.setAttribute("memId", id );
//		System.out.println("서블릿 Payment " +cnum);
		
		IPaymentService service = PaymentServiceImpl.getService();
//		List<CookClassVO> list = service.getClass(cnum);
//		logger.info(service);
		CookClassVO cvo = service.getClassone(cnum);
//		System.out.println(cvo);
//		System.out.println(3);
		request.setAttribute("cvo",cvo);
//		request.setAttribute("memId", );
		
		// 동작 테스트
		int res = 1;
//		request.setAttribute("result", res);
//		request.getRequestDispatcher("/view/result.jsp").forward(request, response);
		// ------------------
		
//		request.getRequestDispatcher("/view/paymentForm.jsp").forward(request, response);
		request.getRequestDispatcher("/view/payment/paymentSelect.jsp").forward(request, response);
//		request.getRequestDispatcher("/view/payment/Kakao.jsp").forward(request, response);
		// 0. 클라이언트 전송시 데이타 받기

		// 1. service객체 얻기

		// 2. service메소드 호출 - 결과값 받기 - List
		// 3 request에 저장
		

		// 4. view페이지로 이동 - json데이타 생성


	}

}
