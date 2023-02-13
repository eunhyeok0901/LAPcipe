package bps.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bps.member.service.IMemberService;
import bps.member.service.MemberServiceImpl;
import bps.member.vo.MemberVO;

@WebServlet("/Insert.do")
public class Insert extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public Insert() {
        super();
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
request.setCharacterEncoding("utf-8");
        
        //0.클라이언트 전송시 데이터 받기 - form 데이터: VO에 저장
        String id = request.getParameter("mem_id");
        String nickname = request.getParameter("mem_nickname");
        String email = request.getParameter("mem_mail");
        String hp = request.getParameter("mem_hp");
        String bir = request.getParameter("mem_bir");
        String add1 = request.getParameter("mem_add1");
        String add2 = request.getParameter("mem_add2");
        String pass = request.getParameter("mem_pass1");
        String name = request.getParameter("mem_name");
        
        MemberVO vo = new MemberVO();
        vo.setMem_id(id);
        vo.setMem_nickname(nickname);
        vo.setMem_email(email);
        vo.setMem_tel(hp);
        vo.setMem_bir(bir);
        vo.setMem_add(add1 + " " + add2);
        vo.setMem_pass(pass);
        vo.setMem_name(name);

        //1.service객체 얻기
        IMemberService service = MemberServiceImpl.getService();
        
        //2.service메소드 호출하기-결과값 받기
        String resid = service.insertMember(vo);
        
        //3.결과값을 request에 저징
        request.setAttribute("resok", resid);
        
        //view페이지로 이동하기
        request.getRequestDispatcher("member/insert.jsp").forward(request, response);
        
    }

}
