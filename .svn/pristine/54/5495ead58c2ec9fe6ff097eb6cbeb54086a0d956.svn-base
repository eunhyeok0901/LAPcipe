package bps.tag.dao;

import java.sql.SQLException;
import java.util.List;

import javax.servlet.jsp.tagext.Tag;

import com.ibatis.sqlmap.client.SqlMapClient;

import bps.tag.vo.TagVO;
import bps.util.SqlMapClientFactory;

public class TagDAOImpl implements ITagDAO {
	private static TagDAOImpl instance;
	
	private SqlMapClient smc;
	
	private TagDAOImpl() {
		smc = SqlMapClientFactory.getSqlMapClient();
	}
	
	public static TagDAOImpl getInstance() {
		if(instance == null) instance = new TagDAOImpl();
		
		return instance;
	}

	@Override
	public void insertTag(TagVO vo) {
		Object obj = null;
		
		try {
			obj = smc.insert("tag.insertTag", vo);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		if(obj == null) {
			System.out.println("태그 데이터 추가 성공");
		}
	}

	@Override
	public List<TagVO> getTag(int rec_no) {
		List<TagVO> list = null;
		
		try {
			list = smc.queryForList("tag.getTag",rec_no);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return list;
	}
//
//	@Override
//	public List<TagVO> searchTag(String tag_name) {
//		List<TagVO> list = null;
//		
//		try {
//			list = smc.queryForList("tag.searchTag",tag_name);
//		} catch (SQLException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
//		
//		return list;
//	}

}
