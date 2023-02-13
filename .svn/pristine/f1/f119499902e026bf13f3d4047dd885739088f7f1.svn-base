package bps.ingreunit.service;

import java.util.List;

import bps.ingreunit.dao.IingreunitDAO;
import bps.ingreunit.dao.ingreunitDAOImpl;
import bps.ingreunit.vo.IngreunitVO;

public class IngreunitServiceImpl implements IingreunitService {
	private static IngreunitServiceImpl instance;
	
	private IingreunitDAO dao;
	
	private IngreunitServiceImpl() {
		dao = ingreunitDAOImpl.getInstance();
	}
	
	public static IngreunitServiceImpl getInstance() {
		if(instance == null) instance = new IngreunitServiceImpl();
		
		return instance; 
	}
	
	@Override
	public List<IngreunitVO> getAllMaterial(String code) {
		return dao.getAllMaterial(code);
	}

	@Override
	public String getOneUnit(String food_name) {
		// TODO Auto-generated method stub
		return dao.getOneUnit(food_name);
	}

}
