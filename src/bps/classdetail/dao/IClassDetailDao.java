package bps.classdetail.dao;

import java.util.List;

import bps.classdetail.vo.ClassDetailVO;
import bps.classdetail.vo.DetailVO;
import bps.classreview.vo.ReviewVO;

public interface IClassDetailDao {

	
	//클래스 번호로 클래스 상세정보 가져오기
	public List<DetailVO> getClassDetail(int class_no);
}
