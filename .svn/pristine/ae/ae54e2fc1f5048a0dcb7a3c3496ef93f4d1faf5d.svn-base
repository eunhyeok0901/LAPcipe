package bps.ingredient.dao;

import java.sql.SQLException;
import java.util.List;

import com.ibatis.sqlmap.client.SqlMapClient;

import bps.ingredient.vo.IngrediVO;
import bps.util.SqlMapClientFactory;

public class IngredientDAOImpl implements IIngredientDAO{
	
	private static IngredientDAOImpl dao;
	private SqlMapClient client;
	
	private IngredientDAOImpl() {
		client = SqlMapClientFactory.getSqlMapClient();
		// TODO Auto-generated constructor stub
	}
	
	public static IngredientDAOImpl getInstance() {
		if(dao == null) dao = new IngredientDAOImpl();
		
		return dao;
	}

	@Override
	public List<IngrediVO> getIngredient(String ing_name) {
		List<IngrediVO> list = null;
		
		try {
			list = client.queryForList("ingredient.getIngredient",ing_name);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return list;
	}

}
