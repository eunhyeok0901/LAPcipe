package bps.cookclass.dao;

import java.sql.SQLException;

import java.util.List;
import java.util.Map;

import com.ibatis.sqlmap.client.SqlMapClient;

import bps.buyedclass.vo.BuyedClassVO;
import bps.cookclass.vo.CookClassVO;
import bps.util.SqlMapClientFactory;

public class CookClassDaoImpl implements ICookClassDao {
	
	private SqlMapClient client;
	private static ICookClassDao dao;

	private CookClassDaoImpl() {
		client = SqlMapClientFactory.getSqlMapClient();
	}
	
	public static ICookClassDao getDao() {
		if(dao == null) dao = new CookClassDaoImpl();
		return dao;
		


}

	@Override
	public List<CookClassVO> getClassList() {
		
		List<CookClassVO> list = null;
		
		try {
			list = client.queryForList("cookClass.getClassList");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		return list;
	}
/*
	@Override
	public int totalCount(Map<String, Object> map) {
	int count = 0;
		
		try {
			count = (int) client.queryForObject("cookClass.totalCount",map);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		return count;
	}
*/
	
	
	@Override
	public List<CookClassVO> getSortList(String sort) {
		
		List<CookClassVO> list = null;
		
		try {
			list = client.queryForList("cookClass.getSortList",sort);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public int totalCount(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<CookClassVO> searchMaterial(String material) {
		 List<CookClassVO> list = null;
		 
		 try {
			list = client.queryForList("cookClass.searchMaterial",material);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		 
		
		return list;
	}

	@Override
	public List<CookClassVO> searchName(String name) {
		
		List<CookClassVO> list = null;
		
		try {
			list = client.queryForList("cookClass.searchName",name);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public int countClass(BuyedClassVO vo) {
		
		int count = 0;
		try {
		count = (int)client.queryForObject("cookClass.countClass", vo);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return count;
	}

	@Override
	public List<CookClassVO> getClassDetail(int class_no) {
		
		List<CookClassVO> list = null;
		
		try {
			list = client.queryForList("cookClass.getClassDetail",class_no);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}


	
	
	
	
}
	
	
