package bps.recipereview.service;

import java.util.List;

import bps.recipereview.dao.IRecipeReviewDAO;
import bps.recipereview.dao.RecipeReviewDAOImpl;
import bps.recipereview.vo.RecipeReviewVO;

public class RecipeReviewServiceImpl implements IRecipeReviewService{
	private static RecipeReviewServiceImpl instance;
	
	private IRecipeReviewDAO dao;
	
	private RecipeReviewServiceImpl() {
		dao = RecipeReviewDAOImpl.getInstance();
	}
	
	public static RecipeReviewServiceImpl getInstance() {
		if(instance == null) instance = new RecipeReviewServiceImpl();
		
		return instance;
	}
	@Override
	public List<RecipeReviewVO> getSomeReview(int rec_no) {
		// TODO Auto-generated method stub
		return dao.getSomeReview(rec_no);
	}

	@Override
	public void insertReview(RecipeReviewVO vo) {
		dao.insertReview(vo);
	}

	@Override
	public List<RecipeReviewVO> getMyReview(String mem_id) {
		// TODO Auto-generated method stub
		return dao.getMyReview(mem_id);
	}

	@Override
	public List<RecipeReviewVO> getAvgScore() {
		// TODO Auto-generated method stub
		return dao.getAvgScore();
	}

}
