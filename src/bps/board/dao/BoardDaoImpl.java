package bps.board.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.ibatis.sqlmap.client.SqlMapClient;

import bps.board.vo.BoardVO;
import bps.board.vo.ReplyVO;
import bps.util.SqlMapClientFactory;


public class BoardDaoImpl implements IBoardDao {

    private SqlMapClient client;
    private static IBoardDao dao;
    
    private BoardDaoImpl() {
        client = SqlMapClientFactory.getSqlMapClient();
    }
    
    public static IBoardDao getDao() {
        if(dao==null) dao = new BoardDaoImpl();
        return dao;
    }
    
    @Override
    public List<BoardVO> listByPage(Map<String, Object> map) {
        List<BoardVO> list = null;
        try {
            list = client.queryForList("board.listByPage", map);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    @Override
    public int totalCount(Map<String, Object> map) {
        int count = 0;
        try {
            count = (int) client.queryForObject("board.totalCount", map);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return count;
    }

    @Override
    public int insertBoard(BoardVO vo) {
        int count = 0;
        try {
            //원래는 insert인데 update사용
            count = (int) client.update("board.insertBoard", vo);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return count;
    }

    @Override
    public int replySave(ReplyVO vo) {
        int res =0;
        try {
            res= client.update("board.replySave", vo);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return res;
    }

    @Override
    public List<ReplyVO> replyList(int board_no) {
        List<ReplyVO> list = null;
        try {
            list = client.queryForList("board.replyList", board_no);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    @Override
    public int replyDelete(int com_no) {
        int res = 0;
        try {
            res = client.delete("board.replyDelete", com_no);
        } catch (SQLException e) {
            e.printStackTrace();
        } 
        return res;
    }

    @Override
    public int replyUpdate(Map<String, Object> map) {
        int res = 0;
        try {
            res = client.update("board.replyUpdate", map);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return res;
    }

    @Override
    public int deleteBoard(int board_no) {
        int res = 0;
        try {
            res = client.delete("board.deleteBoard", board_no);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return res;
    }
}
