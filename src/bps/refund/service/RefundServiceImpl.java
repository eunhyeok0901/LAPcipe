package bps.refund.service;

import java.util.List;

import bps.refund.dao.IRefundDao;
import bps.refund.dao.RefundDaoImpl;
import bps.refund.vo.RefundVO;

public class RefundServiceImpl implements IRefundService {
	private static IRefundService service;
	private IRefundDao dao;
	
	private RefundServiceImpl() {
		dao = RefundDaoImpl.getDao();
	}
	public static IRefundService getService() {
		if(service == null) service = new RefundServiceImpl(); 
		return service;
	}

	@Override
	public List<RefundVO> getAllRefund() {
		// TODO Auto-generated method stub
		return dao.getAllRefund();
	}

}
