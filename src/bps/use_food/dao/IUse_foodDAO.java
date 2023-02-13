package bps.use_food.dao;

import java.util.List;

import bps.use_food.vo.Use_foodVO;

public interface IUse_foodDAO {
	public void use_foodInsert(Use_foodVO vo);
	
	public List<Use_foodVO> getSomeFood(int rec_no);
	
	public List<Use_foodVO> getSource(int rec_no);

	public List<Use_foodVO> getIngredient(int rec_no);
}
