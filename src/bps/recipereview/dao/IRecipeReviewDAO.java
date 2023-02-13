package bps.recipereview.dao;

import java.util.List;

import bps.recipereview.vo.RecipeReviewVO;

public interface IRecipeReviewDAO {
	public List<RecipeReviewVO> getSomeReview(int rec_no);

	public List<RecipeReviewVO> getMyReview(String mem_id);
	
	public void insertReview(RecipeReviewVO vo);
	
	public List<RecipeReviewVO> getAvgScore();
}
