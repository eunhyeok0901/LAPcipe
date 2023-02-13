package bps.recipenote.dao;

import java.sql.SQLException;
import java.util.List;

import com.ibatis.sqlmap.client.SqlMapClient;

import bps.recipenote.vo.RecipeNoteVO;
import bps.util.SqlMapClientFactory;

public class RecipenoteDAOImpl implements IRecipenoteDAO {
	private static RecipenoteDAOImpl instance;
	
	private SqlMapClient smc;
	
	private RecipenoteDAOImpl() {
		smc = SqlMapClientFactory.getSqlMapClient();
	}
	
	public static RecipenoteDAOImpl getInstance() {
		if(instance == null) instance = new RecipenoteDAOImpl();
		
		return instance;
	}
	
	@Override
	public List<RecipeNoteVO> getMyNote(String mem_id) {
		List<RecipeNoteVO> list = null;
		try {
			list = smc.queryForList("recipenote.getMyNote",mem_id);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}
		
}
