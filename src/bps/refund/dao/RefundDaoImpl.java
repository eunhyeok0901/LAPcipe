package bps.refund.dao;

import java.sql.SQLException;
import java.util.List;

import com.ibatis.sqlmap.client.SqlMapClient;

import bps.refund.vo.RefundVO;
import bps.util.SqlMapClientFactory;

public class RefundDaoImpl implements IRefundDao {
	private SqlMapClient smc;
	private static IRefundDao dao;
	
	private RefundDaoImpl() {
		smc = SqlMapClientFactory.getSqlMapClient();
	}
	
	public static IRefundDao getDao() {
		if(dao == null) dao = new RefundDaoImpl();
		return dao;
	}
	
	@Override
	public List<RefundVO> getAllRefund() {
		 List<RefundVO> list = null;
		 
		 try {
			list = smc.queryForList("refund.getAllRefund");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		 
		return list;
	}

}
