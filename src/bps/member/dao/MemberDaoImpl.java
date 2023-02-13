package bps.member.dao;

import java.sql.SQLException;

import com.ibatis.sqlmap.client.SqlMapClient;

import bps.member.vo.MemberVO;
import bps.util.SqlMapClientFactory;

public class MemberDaoImpl implements IMemberDao {

	private SqlMapClient client;
	
	private static IMemberDao dao;
	
	private MemberDaoImpl() {
		client = SqlMapClientFactory.getSqlMapClient();
	}
	
	public static IMemberDao getDao() {
		if(dao==null) dao = new MemberDaoImpl();
		
		return dao;
	}
	
	
	@Override
	public String idSearch(String userId) {
		String result = null;
		
		try {
			result = (String) client.queryForObject("member.idSearch", userId);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public String insertMember(MemberVO vo) {
		String result = null;
		
		try {
			result = (String) client.insert("member.insertMember", vo);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}
	
    @Override
    public int deleteMember(String memId)  {
        int cnt = 0;
        try {
            cnt = client.delete("member.deleteMember", memId);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return cnt;
    }

    @Override
    public int updateMember(MemberVO memVo) {
        int cnt = 0;
        try {
            cnt = client.update("member.updateMember", memVo);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return cnt;
        
    }

    public MemberVO getMember(MemberVO memVo) {
        
        MemberVO loginMemberVo = null;
        
        try {
            loginMemberVo = (MemberVO) client.queryForObject("member.getMember",memVo);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        
        return loginMemberVo;
    }

    public MemberVO login(MemberVO memVo) {
        
        MemberVO loginMemberVo = null;
        
        try {
            loginMemberVo = (MemberVO) client.queryForObject("member.login",memVo);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        
        return loginMemberVo;
    }
    
    @Override
    public MemberVO searchId(MemberVO memVo) {
        
        MemberVO searchId = null;
        
        try {
            searchId = (MemberVO) client.queryForObject("member.searchId", memVo);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        
        return searchId;
    }

    @Override
    public int searchPass(MemberVO memVo) {
        
        int searchPass = 0;
        
        try {
            searchPass = (int) client.queryForObject("member.searchPass", memVo);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        
        return searchPass;
    }

    @Override
    public int updatePass(MemberVO memVo) {
        int updatePass = 0;
        
        try {
            updatePass = client.update("member.updatePass", memVo);
        
        } catch (SQLException e) {
            e.printStackTrace();
        }
        
        return updatePass;
    }

	@Override
	public MemberVO getMember2(String memId) {
		MemberVO mvo = null;
		
		try {
			mvo = (MemberVO) client.queryForObject("member.getMember2", memId);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return mvo;
	}
    
    
    
    
    
}
