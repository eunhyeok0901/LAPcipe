package bps.cookclass.service;

import java.util.HashMap;

import java.util.List;
import java.util.Map;

import bps.buyedclass.vo.BuyedClassVO;
import bps.cookclass.dao.CookClassDaoImpl;
import bps.cookclass.dao.ICookClassDao;
import bps.cookclass.vo.CookClassVO;

public class CookClassServiceImpl implements ICookClassService {
	
	
	private ICookClassDao dao;
	private static ICookClassService service;
	
	private CookClassServiceImpl() {
		dao = CookClassDaoImpl.getDao();
	}
	
	
	
	public static ICookClassService getservice() {
		if(service == null) service = new CookClassServiceImpl();
		
		return service;
	}



	@Override
	public List<CookClassVO> getClassList() {
		// TODO Auto-generated method stub
		return dao.getClassList();
	}



	@Override
	public int totalCount(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return dao.totalCount(map);
	}



	@Override
	public List<CookClassVO> getSortList(String sort) {
		// TODO Auto-generated method stub
		return dao.getSortList(sort);
	}



	@Override
	public List<CookClassVO> searchMaterial(String material) {
		// TODO Auto-generated method stub
		return dao.searchMaterial(material);
	}



	@Override
	public List<CookClassVO> searchName(String name) {
		// TODO Auto-generated method stub
		return dao.searchName(name);
	}



	@Override
	public int countClass(BuyedClassVO vo) {
		// TODO Auto-generated method stub
		return dao.countClass(vo);
	}



	@Override
	public List<CookClassVO> getClassDetail(int class_no) {
		// TODO Auto-generated method stub
		return dao.getClassDetail(class_no);
	}




	
	
	



	
	
		
	
	

}
