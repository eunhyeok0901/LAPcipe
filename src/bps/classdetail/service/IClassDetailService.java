package bps.classdetail.service;

import java.util.List;

import bps.classdetail.vo.ClassDetailVO;
import bps.classdetail.vo.DetailVO;

public interface IClassDetailService {
	
	//클래스 번호로 클래스 상세정보 가져오기
	public List<DetailVO> getClassDetail(int class_no);

}
