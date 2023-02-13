package bps.curriculum.service;

import bps.curriculum.dao.CurriculumDaoImpl;
import bps.curriculum.dao.ICurriculumDao;
import bps.curriculum.vo.CurriculumVO;

public class CurriculumServiceImpl implements ICurriculumService {
	
	
	private ICurriculumDao dao;
	private static CurriculumServiceImpl service;
	
	
	private CurriculumServiceImpl() {
		dao = CurriculumDaoImpl.getDao();
	}
	
	public static ICurriculumService getService() {
		if (service == null) {
			service = new CurriculumServiceImpl();
		}return service;
	}
	

	@Override
	public CurriculumVO getCurri(int class_no) {
		// TODO Auto-generated method stub
		return dao.getCurri(class_no);
	}

	@Override
	public String getURL(String url) {
		// TODO Auto-generated method stub
		return dao.getURL(url);
	}

}
