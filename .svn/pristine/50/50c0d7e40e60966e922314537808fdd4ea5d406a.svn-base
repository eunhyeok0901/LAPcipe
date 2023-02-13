package bps.payment.dao;

import java.sql.SQLException;

import java.util.List;

import bps.buyedclass.vo.BuyedClassVO;
import bps.cookclass.vo.CookClassVO;
import bps.payment.vo.PaymentVO;

public interface IPaymentDAO {
	
	public List<PaymentVO> getAllPayment();
	
	public List<CookClassVO> getClass (int classNo);
	
	public CookClassVO getClassone (int classNo);
	
//	public BuyedClassVO insertBuyed(BuyedClassVO bvo);
	public int insertBuyed(BuyedClassVO bvo);
	public int insertPay(PaymentVO pvo);
	public BuyedClassVO getClassPay(String memId);
	public void getBuySeq();
	
	public int insertPointResult(String memId);
	
	public int insertMileagePlus(String memId);
}
   
   
