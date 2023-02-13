package bps.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bps.member.service.IMemberService;
import bps.member.service.MemberServiceImpl;

@WebServlet("/IdCheck.do")
public class IdCheck extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    
	    //0.클라이언트 전송시 id값을 받는다.
        String userId = request.getParameter("id");
        
        //1.service객체 얻기
        IMemberService service = MemberServiceImpl.getService();
        
        //2.메소드 호출-결과값 받기
        String result = service.idSearch(userId);
        //a001을 입력했다면 결과: a001
        //korea를 입력했다면 결과: null
        
        //3.request에 저장
        request.setAttribute("result", result);
        
        //4.view페이지 이동
        request.getRequestDispatcher("member/idCheck.jsp").forward(request, response);

    }

}
