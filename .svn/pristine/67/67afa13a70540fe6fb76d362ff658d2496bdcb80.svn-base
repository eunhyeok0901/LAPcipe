package bps.payment.dao;

import java.security.Provider.Service;
import java.sql.SQLException;
import java.util.List;

import com.ibatis.sqlmap.client.SqlMapClient;

import bps.buyedclass.vo.BuyedClassVO;
import bps.cookclass.vo.CookClassVO;
import bps.payment.vo.PaymentVO;
import bps.util.SqlMapClientFactory;

public class PaymentDAOImpl implements IPaymentDAO {
	private SqlMapClient client;
	private static IPaymentDAO dao;
		
	    //생성자 
	   private PaymentDAOImpl() {
		   client = SqlMapClientFactory.getSqlMapClient();
		  
	   }
	   
	   public static IPaymentDAO   getDao() {
		   
		  if(dao == null)  dao = new PaymentDAOImpl();
		  
		   return dao;
	   }

	@Override
	public List<PaymentVO> getAllPayment() {
		List<PaymentVO> list = null;
		
		try {
			list = client.queryForList("payment.getAllPayment");
		} catch (SQLException e) {
			list = null;
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public List<CookClassVO> getClass(int classNo) {
		List<CookClassVO> list = null;
		
		try {
			list = (List<CookClassVO>) client.queryForObject("payment.getClass",classNo);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public CookClassVO getClassone(int classNo) {
		CookClassVO cvo = null;
		try {
			cvo = (CookClassVO) client.queryForObject("payment.getClassone", classNo);
		} catch (SQLException e) {
			e.printStackTrace();
		}
				
		return cvo;
	}

	@Override
	public int insertBuyed(BuyedClassVO bvo) {
		int res = 0;
		
		try {
			res = (int) client.update("payment.insertBuyed", bvo);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return res;
	}

	@Override
	public int insertPay(PaymentVO pvo) {
		int res = 0;
		
		try {
			res = (int) client.update("payment.insertPay",pvo);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return res;
	}

	@Override
	public BuyedClassVO getClassPay(String memId){
		BuyedClassVO list = null;
		
		try {
			list = (BuyedClassVO) client.queryForObject("payment.getClassPay",memId);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public void getBuySeq() {
		try {
			client.queryForObject("payment.getBuySeq");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

	@Override
	public int insertPointResult(String memId) {
		int res = 0;
		
		try {
			res= (int) client.update("payment.insertPointResult",memId);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return res;
	}

	@Override
	public int insertMileagePlus(String memId) {
		int res = 0;
		
		try {
			res = (int) client.update("payment.insertMileagePlus",memId);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return res;
	}

//	@Override
//	public BuyedClassVO insertBuyed(BuyedClassVO bvo) {
//		BuyedClassVO bcvo = null;
//		
//		try {
//			bcvo = (BuyedClassVO) client.insert("payment.insertBuyed",bvo);
//		} catch (SQLException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
//		
//		return bcvo;
//	}

//	@Override
//	public List<PaymentVO> getAllPayment(int userId) {
//		List<PaymentVO> list = null;
//		
//		try {
//			list = client.queryForList("payment.getAllPayment",userId);
//		} catch (SQLException e) {
//			list = null;
//			e.printStackTrace();
//		}
//		
//		return list;
//	}

}
 