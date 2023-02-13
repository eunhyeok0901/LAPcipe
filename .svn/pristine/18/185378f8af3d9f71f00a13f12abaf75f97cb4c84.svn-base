package bps.use_food.service;


import java.util.List;

import bps.use_food.dao.Use_foodDAOImpl;
import bps.use_food.vo.Use_foodVO;

public class Use_foodServiceImpl implements IUse_foodService{
	private static Use_foodServiceImpl instance;
	
	private Use_foodDAOImpl dao;
	
	private Use_foodServiceImpl() {
		dao = Use_foodDAOImpl.getInstance();
	}
	
	public static Use_foodServiceImpl getInstance() {
		if(instance == null) instance = new Use_foodServiceImpl();
		
		return instance; 
	}

	@Override
	public void use_foodInsert(Use_foodVO vo) {
		dao.use_foodInsert(vo);
	}

	@Override
	public List<Use_foodVO> getSomeFood(int rec_no) {
		return dao.getSomeFood(rec_no);
	}

	@Override
	public List<Use_foodVO> getSource(int rec_no) {
		// TODO Auto-generated method stub
		return dao.getSource(rec_no);
	}

	@Override
	public List<Use_foodVO> getIngredient(int rec_no) {
		// TODO Auto-generated method stub
		return dao.getIngredient(rec_no);
	}
}
