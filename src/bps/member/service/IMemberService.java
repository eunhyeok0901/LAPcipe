package bps.member.service;

import bps.member.vo.MemberVO;

public interface IMemberService {

    //id중복검사
    public String idSearch(String userId);
    
    //저장하기-회원가입하기
    public String insertMember(MemberVO vo);
    

    /**
     * 회원 정보를 삭제하는 메서드
     * @param memId 삭제할 회원ID
     * @return 작업성공:1, 작업실패:0
     */
    public int deleteMember(String memId);
    
    /**
     * 회원 정보를 update하는 메서드
     * @param memVo update할 회원 정보가 저장된 MemberVO객체
     * @return  작업성공:1, 작업실패:0
     */
    public int updateMember(MemberVO memVo);
    
    //아이디로 회원정보 조회
    public MemberVO getMember(MemberVO memVo); 
    
    //로그인 
    public MemberVO login(MemberVO memVo);
    
    //아이디 찾기
    public MemberVO searchId(MemberVO memVo);
    
    //비밀번호 찾기
    public int searchPass(MemberVO memVo);
    
    //임시비밀번호로 업데이트
    public int updatePass(MemberVO memVo);
    
    public MemberVO getMember2(String memId);
    
    
}
