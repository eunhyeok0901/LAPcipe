package bps.payment.service;

import java.util.List;

import bps.buyedclass.vo.BuyedClassVO;
import bps.cookclass.vo.CookClassVO;
import bps.payment.dao.IPaymentDAO;
import bps.payment.dao.PaymentDAOImpl;
import bps.payment.vo.PaymentVO;

public class PaymentServiceImpl implements IPaymentService {
	private static IPaymentService  service;
	private IPaymentDAO  dao;
	
	private PaymentServiceImpl() {
		dao = PaymentDAOImpl.getDao();
	}
	
	public static IPaymentService getService() {
		if(service == null) 
			  service = new PaymentServiceImpl();
		
		 return service;
	}
	@Override
	public List<PaymentVO> getAllPayment() {
		
		return dao.getAllPayment();
	}
//
//	@Override
//	public List<PaymentVO> getAllPayment(int userId) {
//		return dao.getAllPayment(userId);
//	}

	@Override
	public List<CookClassVO> getClass(int classNo) {
		// TODO Auto-generated method stub
		return dao.getClass(classNo);
	}

	@Override
	public CookClassVO getClassone(int classNo) {
		// TODO Auto-generated method stub
		return dao.getClassone(classNo);
	}

	@Override
	public int insertBuyed(BuyedClassVO bvo) {
		// TODO Auto-generated method stub
		return dao.insertBuyed(bvo);
	}

	@Override
	public int insertPay(PaymentVO pvo) {
		return dao.insertPay(pvo);
	}

	@Override
	public BuyedClassVO getClassPay(String memId) {
		// TODO Auto-generated method stub
		return dao.getClassPay(memId);
	}

	@Override
	public void getBuySeq() {
		dao.getBuySeq();
		
	}

	@Override
	public int insertPointResult(String memId) {
		// TODO Auto-generated method stub
		return dao.insertPointResult(memId);
	}

	@Override
	public int insertMileagePlus(String memId) {
		// TODO Auto-generated method stub
		return dao.insertMileagePlus(memId);
	}

//	@Override
//	public BuyedClassVO insertBuyed(BuyedClassVO bvo) {
//		// TODO Auto-generated method stub
//		return dao.insertBuyed(bvo);
//	}

}
