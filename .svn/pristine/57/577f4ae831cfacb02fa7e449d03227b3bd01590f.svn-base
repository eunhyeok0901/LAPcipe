package bps.buyedclass.service;

import java.util.List;

import bps.buyedclass.dao.BuyedClassDaoImpl;
import bps.buyedclass.dao.IBuyedClassDao;
import bps.buyedclass.vo.BuyedClassVO;
import bps.buyedclass.vo.BuyedVO;

public class BuyedClassServiceImpl implements IBuyedClassService {
	
	private static IBuyedClassService service;
	private IBuyedClassDao dao;
	
	private BuyedClassServiceImpl() {
		dao = BuyedClassDaoImpl.getDao();
	}
	
	public static IBuyedClassService getService() {
		if(service == null) service = new BuyedClassServiceImpl();
		return service;
	}

	@Override
	public List<BuyedClassVO> getAllBuyedClass() {
		// TODO Auto-generated method stub
		return dao.getAllBuyedClass();
	}

	@Override
	public List<BuyedVO> registeredClass(String id) {
		// TODO Auto-generated method stub
		return dao.registeredClass(id);
	}

}
