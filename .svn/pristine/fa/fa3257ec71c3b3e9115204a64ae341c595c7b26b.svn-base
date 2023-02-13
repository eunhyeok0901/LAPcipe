package bps.cookclass.controller;

import java.io.IOException;
import java.lang.reflect.Member;

import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bps.cookclass.service.CookClassServiceImpl;
import bps.cookclass.service.ICookClassService;
import bps.cookclass.vo.CookClassVO;
import bps.member.vo.MemberVO;
import bps.payment.vo.PaymentVO;
// 작동확인 1021

/**
 * Servlet implementation class getClassList
 */
@WebServlet("/getClassList.do")
public class getClassList extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		doGet(request,response);
	
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("utf-8");
		
//		
//		HttpSession session=request.getSession();
//		MemberVO vo = new MemberVO();
//		
//		vo = (MemberVO)session.getAttribute("loginMember");//세션 받아오기
		
		
		
		ICookClassService service = CookClassServiceImpl.getservice();
		
		List<CookClassVO> list = service.getClassList();
		
		request.setAttribute("list", list);
		
		request.getRequestDispatcher("/view/list.jsp").forward(request, response);

	}

}
