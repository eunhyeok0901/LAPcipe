package bps.classdetail.service;

import java.util.List;

import bps.classdetail.dao.ClassDetailDaoImpl;
import bps.classdetail.dao.IClassDetailDao;
import bps.classdetail.vo.ClassDetailVO;
import bps.classdetail.vo.DetailVO;
import bps.cookclass.dao.CookClassDaoImpl;
import bps.cookclass.dao.ICookClassDao;
import bps.cookclass.service.CookClassServiceImpl;
import bps.cookclass.service.ICookClassService;

public class ClassDetailServiceImpl implements IClassDetailService {
	

	private IClassDetailDao dao;
	private static IClassDetailService service;
	
	private ClassDetailServiceImpl() {
		dao = ClassDetailDaoImpl.getDao();
	}
	
	
	
	public static IClassDetailService getservice() {
		if(service == null) service = new ClassDetailServiceImpl();
		
		return service;
	}



	@Override
	public List<DetailVO>  getClassDetail(int class_no) {
		// TODO Auto-generated method stub
		return dao.getClassDetail(class_no);
	}

	

}
