package bps.postrecipe.dao;

import java.sql.SQLException;
import java.util.List;

import com.ibatis.sqlmap.client.SqlMapClient;

import bps.postrecipe.vo.PostRecipeVO;
import bps.util.SqlMapClientFactory;

public class PostRecipeDAOImpl implements IPostRecipeDAO {
	private static PostRecipeDAOImpl instance;
	
	private SqlMapClient smc;
	
	private PostRecipeDAOImpl() {
		smc = SqlMapClientFactory.getSqlMapClient();
	}
	
	public static PostRecipeDAOImpl getInstance() {
		if(instance == null) instance = new PostRecipeDAOImpl();
		
		return instance;
	}
	
	@Override
	public List<PostRecipeVO> getSomePostRecipe(String id) {
		List<PostRecipeVO> list = null;
		
		try {
			list = smc.queryForList("post_recipe.getSomePostRecipe", id);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public void insertPostRecipe(PostRecipeVO vo) {
		Object obj = null;
		try {
			obj = smc.insert("post_recipe.insertPostRecipe", vo);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	@Override
	public String getOnePostRecipe(int rec_no) {
		String mem_id = null;
		try {
			mem_id = (String) smc.queryForObject("post_recipe.getOnePostRecipe",rec_no);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return mem_id;
	}

}
