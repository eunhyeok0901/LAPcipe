package bps.buyedclass.dao;

import java.sql.SQLException;
import java.util.List;

import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;

import bps.buyedclass.vo.BuyedClassVO;
import bps.buyedclass.vo.BuyedVO;
import bps.util.SqlMapClientFactory;

public class BuyedClassDaoImpl implements IBuyedClassDao {
	private SqlMapClient smc;
	private static IBuyedClassDao dao;
	
	private BuyedClassDaoImpl() {
		smc = SqlMapClientFactory.getSqlMapClient();
	}
	public static IBuyedClassDao getDao() {
		if(dao == null) dao = new BuyedClassDaoImpl();
		
		return dao;
	}
	
	@Override
	public List<BuyedClassVO> getAllBuyedClass() {
		List<BuyedClassVO> list = null;
		
		try {
			list = smc.queryForList("buyedclass.getAllBuyedClass");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return list;
	}
	@Override
	public List<BuyedVO> registeredClass(String id) {
		
		List<BuyedVO> list = null;
		
		try {
			list = smc.queryForList("buyedclass.registeredClass",id);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}
	

}
