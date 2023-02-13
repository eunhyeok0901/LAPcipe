package bps.cookway.service;

import java.util.List;

import bps.cookway.dao.CookwayDAOImpl;
import bps.cookway.dao.ICookwayDAO;
import bps.cookway.vo.CookwayVO;

public class CookwayServiceImpl implements ICookwayService {
	private static CookwayServiceImpl instance;
	private ICookwayDAO dao;
	
	private CookwayServiceImpl() {
		dao = CookwayDAOImpl.getInstance();
	};
	
	public static CookwayServiceImpl getInstance() {
		if(instance == null) instance = new CookwayServiceImpl();
		
		return instance;
	}
	@Override
	public void cookwayInsert(CookwayVO vo) {
		dao.cookwayInsert(vo);
		
	}

	@Override
	public List<CookwayVO> getSomeCookway(int rec_no) {
		// TODO Auto-generated method stub
		return dao.getSomeCookway(rec_no);
	}

}
