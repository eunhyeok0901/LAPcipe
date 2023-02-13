package bps.ingredient.service;

import java.util.List;

import bps.ingredient.dao.IIngredientDAO;
import bps.ingredient.dao.IngredientDAOImpl;
import bps.ingredient.vo.IngrediVO;

public class IngredientServiceImpl implements IIngredientService{
	
	private static IngredientServiceImpl service;
	private IIngredientDAO dao;
	
	private IngredientServiceImpl() {
		dao = IngredientDAOImpl.getInstance();
	}
	public static IngredientServiceImpl getInstance() {
		if(service == null) service = new IngredientServiceImpl();
		return service;
	}
	
	
	
	@Override
	public List<IngrediVO> getIngredient(String ing_name) {
		// TODO Auto-generated method stub
		return dao.getIngredient(ing_name);
	}

}
