package bps.recipenote.service;

import java.util.List;

import bps.recipenote.dao.RecipenoteDAOImpl;
import bps.recipenote.vo.RecipeNoteVO;

public class RecipenoteServiceImpl implements IRecipenoteService {
	private static RecipenoteServiceImpl instance;
	
	private RecipenoteDAOImpl dao;
	
	private RecipenoteServiceImpl() {
		dao = RecipenoteDAOImpl.getInstance();
	}
	
	public static RecipenoteServiceImpl getInstance() {
		if(instance == null) instance = new RecipenoteServiceImpl();
		
		return instance;
	}
	
	@Override
	public List<RecipeNoteVO> getMyNote(String mem_id) {
		return dao.getMyNote(mem_id);
	}

}
