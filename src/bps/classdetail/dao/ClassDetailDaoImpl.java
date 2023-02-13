package bps.classdetail.dao;

import java.sql.SQLException;
import java.util.List;

import com.ibatis.sqlmap.client.SqlMapClient;

import bps.classdetail.vo.ClassDetailVO;
import bps.classdetail.vo.DetailVO;
import bps.classreview.vo.ReviewVO;
import bps.cookclass.dao.CookClassDaoImpl;
import bps.cookclass.dao.ICookClassDao;
import bps.util.SqlMapClientFactory;

public class ClassDetailDaoImpl implements IClassDetailDao {

	
	private SqlMapClient client;
	private static IClassDetailDao dao;

	private ClassDetailDaoImpl() {
		client = SqlMapClientFactory.getSqlMapClient();
	}
	
	public static IClassDetailDao getDao() {
		if(dao == null) dao = new ClassDetailDaoImpl();
		return dao;
	}
		
		
	@Override
	public List<DetailVO>  getClassDetail(int class_no) {
		
		List<DetailVO> list = null;
		
		
		
		try {
			list = (List<DetailVO>)client.queryForList("classdetail.getClassDetail",class_no);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}

}
