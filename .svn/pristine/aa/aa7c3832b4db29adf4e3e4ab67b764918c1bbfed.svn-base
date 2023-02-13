package bps.ingreunit.dao;

import java.sql.SQLException; 
import java.util.List;

import com.ibatis.sqlmap.client.SqlMapClient;

import bps.ingreunit.vo.IngreunitVO;
import bps.util.SqlMapClientFactory;

public class ingreunitDAOImpl implements IingreunitDAO {
	private static ingreunitDAOImpl instance;
	
	private SqlMapClient smc;
	
	private ingreunitDAOImpl() {
		smc = SqlMapClientFactory.getSqlMapClient();
	}
	
	public static ingreunitDAOImpl getInstance() {
		if(instance == null) instance = new ingreunitDAOImpl();
		
		return instance;
	}
	
	
	@Override
	public List<IngreunitVO> getAllMaterial(String code) {
		List<IngreunitVO> list = null;
		try {
			list = smc.queryForList("ingre_unit.getAllMaterial", code);
			System.out.println(list);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public String getOneUnit(String food_name) {
		String name = null;
		
		try {
			name = (String) smc.queryForObject("ingre_unit.getOneUnit",food_name);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return name;
	}

	

}
