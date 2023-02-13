package bps.board.service;

import java.util.List;
import java.util.Map;

import bps.board.vo.BoardVO;
import bps.board.vo.PageVO;
import bps.board.vo.ReplyVO;

public interface IBoardService {
  //페이지별 리스트 출력
    //메소드 이름은 board.xml에 있는 id이름과 동일
    public List<BoardVO> listByPage(Map<String, Object> map);
    
    //페이지정보 추출-start, end, startPage, endPage, totalPage
    //Dao에 안 들어감_DB와 관련이 없음
    public PageVO pageInfo(int page, String type, String word);
    
    //전체 글 갯수 가져오기
    public int totalCount(Map<String, Object> map);
    
    //글 수정하기
    
    //글 삭제하기
    public int deleteBoard(int board_no);
    
    //글쓰기(저장)
    public int insertBoard(BoardVO vo);
    
    
    //댓글쓰기(저장)
    public int replySave(ReplyVO vo);
    
    //댓글리스트
    public List<ReplyVO> replyList(int board_no);
    
    //댓글 수정
    public int replyUpdate(Map<String, Object> map);
    
    //댓글 삭제
    public int replyDelete(int com_no);
}
