package bps.classreview.service;

import java.util.List;

import bps.classdetail.vo.DetailVO;
import bps.classreview.dao.ClassReviewDaoImpl;
import bps.classreview.dao.IClassReviewDao;
import bps.classreview.vo.ClassReviewVO;
import bps.classreview.vo.ReviewVO;

public class ClassReviewServiceImpl implements IClassReviewService {
	
	
	private IClassReviewDao dao;
	private static IClassReviewService service;
	
	
	private ClassReviewServiceImpl() {
		dao = ClassReviewDaoImpl.getDao();
	}
	
	
	public static IClassReviewService getService() {
		if (service == null) {
			service = new ClassReviewServiceImpl();
				
			}return service;
				
	}
	
	
	@Override
	public List<ClassReviewVO> getReview(int class_no) {
		// TODO Auto-generated method stub
		return dao.getReview(class_no);
	}


	@Override
	public List<ReviewVO> registerClass(String mem_id) {
		// TODO Auto-generated method stub
		return dao.registerClass(mem_id);
	}


	@Override
	public int insertReview(ClassReviewVO vo) {
		// TODO Auto-generated method stub
		return dao.insertReview(vo);
	}


	@Override
	public int countReview(ClassReviewVO vo) {
		// TODO Auto-generated method stub
		return dao.countReview(vo);
	}


	@Override
	public String getReviewCon(ClassReviewVO vo) {
		// TODO Auto-generated method stub
		return dao.getReviewCon(vo);
	}


	@Override
	public int insertNewCon(ClassReviewVO vo) {
		// TODO Auto-generated method stub
		return dao.insertNewCon(vo);
	}


	@Override
	public int deleteReview(String con) {
		// TODO Auto-generated method stub
		return dao.deleteReview(con);
	}


//	@Override
//	public List<ClassReviewVO> getReviewCon(ClassReviewVO vo) {
//		// TODO Auto-generated method stub
//		return dao.getReviewCon(vo);
//	}





}
