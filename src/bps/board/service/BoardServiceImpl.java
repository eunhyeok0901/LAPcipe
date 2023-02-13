package bps.board.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import bps.board.dao.BoardDaoImpl;
import bps.board.dao.IBoardDao;
import bps.board.vo.BoardVO;
import bps.board.vo.PageVO;
import bps.board.vo.ReplyVO;

public class BoardServiceImpl implements IBoardService {
    private IBoardDao dao;
    private static IBoardService service;
    
    private BoardServiceImpl() {
        dao = BoardDaoImpl.getDao();
    }
    
    public static IBoardService getService() {
        if(service==null) service = new BoardServiceImpl();
        return service;
    }
    
    @Override
    public List<BoardVO> listByPage(Map<String, Object> map) {
        return dao.listByPage(map);
    }

    @Override
    public PageVO pageInfo(int page, String type, String word) {
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("stype", type);
        map.put("sword", word);
        
        //전체 글 개수
        int count = this.totalCount(map);
        System.out.println("count=" + count);
        
        //전체 페이지 수
        int totalPage = (int)Math.ceil((double)count / PageVO.getPerList());
        System.out.println("totalPage=" + totalPage);
        
        //출력할 아코디언 번호(rnum)
        int start = (page -1) * PageVO.getPerList()+1;
        int end = start + PageVO.getPerList() -1;
        
        if(end>count) end = count;
        
        //시작, 끝페이지
        int startpage = ((page-1) / PageVO.getPerPage() * PageVO.getPerPage()) + 1;
        int endpage = startpage + PageVO.getPerPage()-1;
        if(endpage > totalPage) endpage = totalPage;
        
        System.out.println("start=" + start);
        System.out.println("end=" + end);
        
        PageVO vo = new PageVO();
        vo.setStart(start);
        vo.setEnd(end);
        vo.setStartPage(startpage);
        vo.setEndPage(endpage);
        vo.setTotalPage(totalPage);
        return vo;
    }

    @Override
    public int totalCount(Map<String, Object> map) {
        return dao.totalCount(map);
    }

    @Override
    public int insertBoard(BoardVO vo) {
        return dao.insertBoard(vo);
    }

    @Override
    public int replySave(ReplyVO vo) {
        return dao.replySave(vo);
    }

    @Override
    public List<ReplyVO> replyList(int board_no) {
        return dao.replyList(board_no);
    }

    @Override
    public int replyDelete(int com_no) {
        return dao.replyDelete(com_no);
    }

    @Override
    public int replyUpdate(Map<String, Object> map) {
        return dao.replyUpdate(map);
    }

    @Override
    public int deleteBoard(int board_no) {
        return dao.deleteBoard(board_no);
    }
}
