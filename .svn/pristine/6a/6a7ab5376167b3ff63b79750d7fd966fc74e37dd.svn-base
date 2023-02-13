package bps.tag.service;


import java.util.List;

import bps.tag.dao.ITagDAO;
import bps.tag.dao.TagDAOImpl;
import bps.tag.vo.TagVO;

public class TagServiceImpl implements ITagService{
	
	private static TagServiceImpl instance;
	
	private ITagDAO dao;
	
	private TagServiceImpl() {
		dao = TagDAOImpl.getInstance();
	}
	
	public static TagServiceImpl getInstance() {
		if(instance == null) instance = new TagServiceImpl();
		
		return instance;
	}

	@Override
	public void insertTag(TagVO vo) {
		dao.insertTag(vo);
	}

	@Override
	public List<TagVO> getTag(int rec_no) {
		// TODO Auto-generated method stub
		return dao.getTag(rec_no);
	}

//	@Override
//	public List<TagVO> searchTag(String tag_name) {
//		// TODO Auto-generated method stub
//		return dao.searchTag(tag_name);
//	}
//	
	

}
