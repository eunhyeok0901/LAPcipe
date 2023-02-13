package bps.recipe.service;

import java.util.List;
import java.util.Map;

import bps.recipe.dao.IRecipeDAO;
import bps.recipe.dao.RecipeDAOImpl;
import bps.recipe.vo.RecipeVO;

public class RecipeServiceImpl implements IRecipeService {
	private static RecipeServiceImpl instance;
	private IRecipeDAO dao;
	
	private RecipeServiceImpl() {
		dao = RecipeDAOImpl.getInstance();
	}
	
	public static RecipeServiceImpl getInstance() {
		if(instance == null) instance = new RecipeServiceImpl();
		
		return instance;
	}

	@Override
	public void insertRecipe(RecipeVO vo) {
		dao.insertRecipe(vo);
	}

	@Override
	public List<RecipeVO> getAllRecipe() {
		// TODO Auto-generated method stub
		return dao.getAllRecipe();
	}

	@Override
	public List<RecipeVO> getSomeRecipe1(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return dao.getSomeRecipe1(map);
	}

	@Override
	public List<RecipeVO> getSomeRecipe2(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return dao.getSomeRecipe2(map);
	}

	@Override
	public RecipeVO getOneRecipe(int rec_no) {
		// TODO Auto-generated method stub
		return dao.getOneRecipe(rec_no);
	}

	@Override
	public void plusCount(int rec_no) {
		// TODO Auto-generated method stub
		dao.plusCount(rec_no);
	}

	@Override
	public List<RecipeVO> getRecipeByCount() {
		// TODO Auto-generated method stub
		return dao.getRecipeByCount();
	}

	@Override
	public List<RecipeVO> searchTag(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return dao.searchTag(map);
	}

	@Override
	public List<RecipeVO> searchRecipe(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return dao.searchRecipe(map);
	}

	@Override
	public int searchRecipeCount(Map<String, Object> map) {
		return dao.searchRecipeCount(map);
	}

	@Override
	public List<RecipeVO> getAllRecipeForPaging(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return dao.getAllRecipeForPaging(map);
	}

	@Override
	public int searchTagCount(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return dao.searchTagCount(map);
	}

	@Override
	public int getAllRecipeCount() {
		// TODO Auto-generated method stub
		return dao.getAllRecipeCount();
	}

	

}
