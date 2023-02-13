package bps.postrecipe.dao;

import java.util.List;

import bps.postrecipe.vo.PostRecipeVO;

public interface IPostRecipeDAO {
	public List<PostRecipeVO> getSomePostRecipe(String id);
	
	public void insertPostRecipe(PostRecipeVO vo);
	
	public String getOnePostRecipe(int rec_no);
}
