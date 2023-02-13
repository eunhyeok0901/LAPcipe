package bps.recipe.dao;

import java.util.List;
import java.util.Map;

import bps.recipe.vo.RecipeVO;
import bps.tag.vo.TagVO;

public interface IRecipeDAO {
	public void insertRecipe(RecipeVO vo);
	
	public List<RecipeVO> getAllRecipe();
	
	public int getAllRecipeCount();
	
	public RecipeVO getOneRecipe(int rec_no);
	
	public List<RecipeVO> getSomeRecipe1(Map<String, Object> map);

	public List<RecipeVO> getSomeRecipe2(Map<String, Object> map);
	
	public void plusCount(int rec_no);
	
	public List<RecipeVO> getRecipeByCount();
	
	public List<RecipeVO> getAllRecipeForPaging(Map<String, Object> map);
	
	public List<RecipeVO> searchTag(Map<String, Object> map);
	
	public int searchTagCount(Map<String, Object> map);
	
	public List<RecipeVO> searchRecipe(Map<String, Object> map);
	
	public int searchRecipeCount(Map<String, Object> map);
	
	
}
