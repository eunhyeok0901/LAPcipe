package bps.ingredient.dao;

import java.util.List;

import bps.ingredient.vo.IngrediVO;

public interface IIngredientDAO {
	public List<IngrediVO> getIngredient(String ing_name);
}
