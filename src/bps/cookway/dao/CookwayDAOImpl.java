package bps.cookway.dao;

import java.sql.SQLException; 
import java.util.List;

import com.ibatis.sqlmap.client.SqlMapClient;

import bps.cookway.vo.CookwayVO;
import bps.util.SqlMapClientFactory;
public class CookwayDAOImpl implements ICookwayDAO {
	private static CookwayDAOImpl instance;
	
	private SqlMapClient smc;
	
	private CookwayDAOImpl() {
		smc = SqlMapClientFactory.getSqlMapClient();
	}
	
	public static CookwayDAOImpl getInstance() {
		if(instance == null) instance = new CookwayDAOImpl();
		
		return instance;
	}
	
	@Override
	public void cookwayInsert(CookwayVO vo) {
		Object obj = null;
		try {
			obj = smc.insert("cookway.cookwayInsert", vo);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		if(obj == null) {
			System.out.println("cookway 데이터 삽입 성공");
		}
		
	}

	@Override
	public List<CookwayVO> getSomeCookway(int rec_no) {
		List<CookwayVO> list = null;
		try {
			list = smc.queryForList("cookway.getSomeCookway", rec_no);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}

}
