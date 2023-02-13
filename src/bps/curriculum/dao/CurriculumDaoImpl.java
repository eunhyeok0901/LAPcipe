package bps.curriculum.dao;

import java.sql.SQLException;

import com.ibatis.sqlmap.client.SqlMapClient;

import bps.curriculum.vo.CurriculumVO;
import bps.util.SqlMapClientFactory;

public class CurriculumDaoImpl implements ICurriculumDao{
	
	private SqlMapClient client;
	private static ICurriculumDao dao;
	
	private CurriculumDaoImpl() {
		client = SqlMapClientFactory.getSqlMapClient();
	}
	
	public static ICurriculumDao getDao() {
		if( dao == null) {
			dao = new CurriculumDaoImpl();
		}
		return dao;
	}

	@Override
	public CurriculumVO getCurri(int class_no) {
		
		CurriculumVO vo = null;
		
		try {
			vo = (CurriculumVO)client.queryForObject("curriculum.getCurri",class_no);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return vo;
	}

	@Override
	public String getURL(String url) {
		
		String link = "";
		
		
		try {
			link = (String)client.queryForObject("curriculum.getURL", url);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return link;
	}

	
	
}
