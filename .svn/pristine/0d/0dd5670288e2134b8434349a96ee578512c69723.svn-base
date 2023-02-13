package bps.recipereview.dao;

import java.sql.SQLException; 
import java.util.List;

import com.ibatis.sqlmap.client.SqlMapClient;

import bps.recipereview.vo.RecipeReviewVO;
import bps.util.SqlMapClientFactory;

public class RecipeReviewDAOImpl implements IRecipeReviewDAO {
	private static RecipeReviewDAOImpl instance;
	
	private SqlMapClient smc;
	
	private RecipeReviewDAOImpl() {
		smc = SqlMapClientFactory.getSqlMapClient();
	}
	
	public static RecipeReviewDAOImpl getInstance() {
		if(instance == null) instance = new RecipeReviewDAOImpl();
		
		return instance; 
	}
	@Override
	public List<RecipeReviewVO> getSomeReview(int rec_no) {
		List<RecipeReviewVO> list = null;
		
		try {
			list = smc.queryForList("recipereview.getSomeReview", rec_no);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public void insertReview(RecipeReviewVO vo) {
		Object obj = null;
		try {
			obj = smc.insert("recipereview.insertReview", vo);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	@Override
	public List<RecipeReviewVO> getMyReview(String mem_id) {
		List<RecipeReviewVO> list = null;
		
		try {
			list = smc.queryForList("recipereview.getMyReview", mem_id);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public List<RecipeReviewVO> getAvgScore() {
		List<RecipeReviewVO> list = null;
		try {
			list = smc.queryForList("recipereview.getAvgScore");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}


}
