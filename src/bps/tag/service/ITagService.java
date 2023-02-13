package bps.tag.service;

import java.util.List;

import bps.tag.vo.TagVO;

public interface ITagService {
	public void insertTag(TagVO vo);
	
	public List<TagVO> getTag(int rec_no);
	
//	public List<TagVO> searchTag(String tag_name);

}
