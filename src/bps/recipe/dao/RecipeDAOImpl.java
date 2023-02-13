package bps.recipe.dao;

import java.sql.SQLException;  
import java.util.List;
import java.util.Map;

import com.ibatis.sqlmap.client.SqlMapClient;

import bps.recipe.vo.RecipeVO;
import bps.util.SqlMapClientFactory;

public class RecipeDAOImpl implements IRecipeDAO {
	private static RecipeDAOImpl instance;
	private SqlMapClient smc;
	
	private RecipeDAOImpl() {
		smc = SqlMapClientFactory.getSqlMapClient();
	}
	
	public static RecipeDAOImpl getInstance() {
		if(instance == null) instance = new RecipeDAOImpl();
		
		return instance;
	}
	
	@Override
	public void insertRecipe(RecipeVO vo) {
		Object obj = null;
		try {
			obj = smc.insert("recipe.insertRecipe", vo);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		if(obj == null) {
			System.out.println("recipe 데이터 삽입 성공");
		}
	}

	@Override
	public List<RecipeVO> getAllRecipe() {
		List<RecipeVO> list = null;
		
		try {
			list = smc.queryForList("recipe.getAllRecipe");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public List<RecipeVO> getSomeRecipe1(Map<String, Object> map) {
		List<RecipeVO> list = null;
		try {
			list = smc.queryForList("recipe.getSomeRecipe1",map);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<RecipeVO> getSomeRecipe2(Map<String, Object> map) {
		List<RecipeVO> list = null;
		try {
			list = smc.queryForList("recipe.getSomeRecipe2",map);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		System.out.println(list);
		return list;
	}

	@Override
	public RecipeVO getOneRecipe(int rec_no) {
		RecipeVO vo = new RecipeVO();
		
		try {
			vo = (RecipeVO) smc.queryForObject("recipe.getOneRecipe", rec_no);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return vo;
	}

	@Override
	public void plusCount(int rec_no) {
		try {
			smc.update("recipe.plusCount", rec_no);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	@Override
	public List<RecipeVO> getRecipeByCount() {
		List<RecipeVO> list = null;
		try {
			list = smc.queryForList("recipe.getRecipeByCount");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<RecipeVO> searchTag(Map<String, Object> map) {
		List<RecipeVO> list = null;
		
		try {
			list = smc.queryForList("recipe.searchTag",map);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public List<RecipeVO> searchRecipe(Map<String, Object> map) {
		List<RecipeVO> list = null;
		try {
			list = smc.queryForList("recipe.searchRecipe",map);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public int searchRecipeCount(Map<String, Object> map) {
		int cnt = 0;
		try {
			cnt = (int) smc.queryForObject("recipe.searchRecipeCount",map);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return cnt;
	}

	@Override
	public List<RecipeVO> getAllRecipeForPaging(Map<String, Object> map) {
		List<RecipeVO> list = null;
		try {
			list = smc.queryForList("recipe.getAllRecipeForPaging",map);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public int searchTagCount(Map<String, Object> map) {
		int cnt = 0;
		try {
			cnt = (int) smc.queryForObject("recipe.searchTagCount",map);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return cnt;
	}

	
	@Override
	public int getAllRecipeCount() {
		int cnt = 0;
		try {
			cnt = (int) smc.queryForObject("recipe.getAllRecipeCount");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return cnt;
	}

	
	
	

}
