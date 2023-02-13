package bps.payment.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bps.payment.service.IPaymentService;
import bps.payment.service.PaymentServiceImpl;

/**
 * Servlet implementation class PaymentUseMileage
 */
@WebServlet("/PaymentUseMileage.do")
public class PaymentUseMileage extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		System.out.println("서블릿 포인트사용이다");
		
//		System.out.println("서블릿 "+request.getParameter("classNo"));
//		System.out.println(Integer.parseInt(request.getParameter("classNo")));
//		int cnum = Integer.parseInt(request.getParameter("classNo"));
//		int cnum = 3;
//		System.out.println(request.getParameter("memId"));
		String id = (String) request.getParameter("memId");
//		String id = "a001";
		request.setAttribute("memId", id );
//		request.getParameter("Id");
//		System.out.println("서블릿 포인트 Payment " +cnum);
		
		IPaymentService service = PaymentServiceImpl.getService();
		int res = service.insertPointResult(id);
//		List<CookClassVO> list = service.getClass(cnum);
//		System.out.println(cvo);
//		System.out.println(3);
//		request.setAttribute("memId", );
		System.out.println("마일리지 서블릿 "+res);
		String msg="결제 완료되었습니다. 수강해주셔서 감사합니다!";
//		request.getRequestDispatcher("/view/paymentForm.jsp").forward(request, response);
//		request.getRequestDispatcher("/view/payment/paymentSelect.jsp").forward(request, response);
//		request.getRequestDispatcher("/view/payment/success.jsp").forward(request, response);
//		request.getRequestDispatcher("/main.jsp?msg="+msg).forward(request, response);
//		 response.setContentType("text/html; charset=euc-kr"); //한글이 인코딩
//		   PrintWriter out = response.getWriter(); //선언
//		   
//		   String str="";
//		   str = "<script language='javascript'>";
//		   str += "opener.window.location.reload();";  //오프너 새로고침
//		   str += "self.close();";   // 창닫기
//		    str += "</script>";
//		   out.print(str);
//		response.sendRedirect("/rps_mpro/main.jsp?msg="+msg);
//		 0. 클라이언트 전송시 데이타 받기
		String PageUrl = "/rps_mpro/view/classMain.jsp";
		// 1. service객체 얻기

		// 2. service메소드 호출 - 결과값 받기 - List
		// 3 request에 저장

		// 4. view페이지로 이동 - json데이타 생성d at: ")
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter writer = response.getWriter();
		writer.println("<script>alert('결제해주셔서 감사합니다.'); location.href='"+PageUrl+"'; window.close();</script>"); 
		writer.close();
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
