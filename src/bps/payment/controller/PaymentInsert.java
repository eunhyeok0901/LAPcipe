package bps.payment.controller;

import java.io.IOException; 
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bps.buyedclass.vo.BuyedClassVO;
import bps.payment.service.IPaymentService;
import bps.payment.service.PaymentServiceImpl;
import bps.payment.vo.PaymentVO;


@WebServlet("/PaymentInsert.do")
public class PaymentInsert extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		// 0. 클라이언트 전송시 데이타 받기 
//		int price = request.getAttribute("");
//		String memId = "lolan";
//		String memId = (String) request.getAttribute("memId");
//		int rnum = 4;
//		System.out.println(request.getParameter("vno"));
//		System.out.println(request.getAttribute("memId"));
//		System.out.println(request.getParameter("memId"));
//		int cnum = 3;
		System.out.println("서블릿 2 " + request.getParameter("memId"));
		System.out.println("서블릿 2 " + request.getParameter("name"));
		System.out.println("서블릿 2 " + request.getParameter("email"));
		System.out.println("서블릿 2 " + request.getParameter("phone"));
		System.out.println("서블릿 2 " + request.getParameter("totalPrice"));
		System.out.println("서블릿 2 " + request.getParameter("address"));
		System.out.println("서블릿 2 " + request.getParameter("r1"));
//		System.out.println("서블릿 2 " + request.getParameter("memId"));
//		System.out.println("서블릿 2 " + request.getParameter("price"));
//		System.out.println("서블릿 2 " + request.getParameter("payWay"));
		String memId = (String) request.getParameter("memId");
		int rnum = Integer.parseInt(request.getParameter("classNo"));
//		int pnum = Integer.parseInt(request.getParameter("payWay"));
//		System.out.println(memId);
//		System.out.println(rnum);
		String msg = "결제가 완료됐습니다. 감사합니다!";
		if(request.getParameter("r1").equals("KakaoPay")) {
			System.out.println("카카오페이 포워드");
			request.getRequestDispatcher("/view/payment/Kakao.jsp").forward(request, response);
		}else if (request.getParameter("r1").equals("Card")) {
			System.out.println("카드 포워드");
			request.getRequestDispatcher("/PaymentUseMileage.do").forward(request, response);
		}else {
			System.out.println("포인트 포워드");
			request.getRequestDispatcher("/PaymentUseMileage.do").forward(request, response);
		}
		
//		String memId = "lolan";
		int pnum = 1;
		BuyedClassVO bvo = new BuyedClassVO();
//		bvo.setBuyed_no(cnum);
		bvo.setClass_no(rnum);
		bvo.setMem_id(memId);
		
		IPaymentService service = PaymentServiceImpl.getService();
		int res = service.insertBuyed(bvo);
//		System.out.println(bvo);
		request.setAttribute("result", res);
		
		
		BuyedClassVO setPayment = new BuyedClassVO();
		
		setPayment = service.getClassPay(memId);
		// 결제 테이블에 값들 입력.
		
		int bnum = setPayment.getBuyed_no();
//		int price = Integer.parseInt(request.getParameter("price"));
		int price = Integer.parseInt(request.getParameter("totalPrice"));
//		int price = 3000;
		PaymentVO insertPay = new PaymentVO();
		
		insertPay.setBuyed_no(bnum);
		insertPay.setPay_cost(price);
		insertPay.setPayway(pnum);
		
		int pres = service.insertPay(insertPay);
		request.setAttribute("result", pres);
//		request.getRequestDispatcher("/PaymentPoint.do").forward(request, response);
		
//		request.getRequestDispatcher("view/result.jsp").forward(request, response);
		
		
		
//			System.out.println(bvo2.getBuyed_no());
//			System.out.println(bvo2.getClass_no());
//			System.out.println(bvo2.getMem_id());
		
		// 1. service객체 얻기

		// 2. service메소드 호출 - 결과값 받기 - List
		// 3 request에 저장
		
		// 4. view페이지로 이동 - json데이타 생성
			
			//3. request에 결과값을 저장 
			
			//4.viewㅍ에이지 이동 
//		request.getRequestDispatcher("view/paymentDetail.jsp").forward(request, response);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
