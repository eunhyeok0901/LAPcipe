package bps.use_food.dao;

import java.sql.SQLException; 
import java.util.List;

import com.ibatis.sqlmap.client.SqlMapClient;

import bps.use_food.vo.Use_foodVO;
import bps.util.SqlMapClientFactory;

public class Use_foodDAOImpl implements IUse_foodDAO {
	private static Use_foodDAOImpl instance;
	
	private SqlMapClient smc;
	
	private Use_foodDAOImpl() {
		smc = SqlMapClientFactory.getSqlMapClient();
	}
	
	public static Use_foodDAOImpl getInstance() {
		if(instance == null) instance = new Use_foodDAOImpl();
		
		return instance; 
	}

	@Override
	public void use_foodInsert(Use_foodVO vo) {
		Object obj = null; 
		
		try {
			obj = smc.insert("use_food.use_foodInsert", vo);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		if(obj == null) {
			System.out.println("use_food 데이터 추가 성공");
		}
	}

	@Override
	public List<Use_foodVO> getSomeFood(int rec_no) {
		List<Use_foodVO> list = null;
		try {
			list = smc.queryForList("use_food.getSomeFood",rec_no);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public List<Use_foodVO> getSource(int rec_no) {
		List<Use_foodVO> list = null;

		try {
			list = smc.queryForList("use_food.getSource",rec_no);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<Use_foodVO> getIngredient(int rec_no) {
		List<Use_foodVO> list = null;
		
		try {
			list = smc.queryForList("use_food.getIngredient",rec_no);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}

}
