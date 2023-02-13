package bps.cookclass.service;

import java.util.List;
import java.util.Map;

import bps.buyedclass.vo.BuyedClassVO;
import bps.cookclass.vo.CookClassVO;

public interface ICookClassService {
	
	//클래스 리스트 불러오기 
	public List<CookClassVO> getClassList();
	
	//한식중식/카테고리별 불러오기
	public List<CookClassVO> getSortList(String sort);
	
	
	//전체 글 갯수 가져오기
	public int totalCount(Map<String, Object> map);

	//재료명 검색으로 클래스 결과
	public List<CookClassVO> searchMaterial(String material);
		
	//요리명 검색으로 클래스 결과
	public List<CookClassVO> searchName(String name);
	
	
	//해당 회원이 해당 강죄를 수강하고 있는지 확인한다
	public int countClass(BuyedClassVO vo);
	
	
//	클래스 번호로 클래스 상세정보 가져오기
	public List<CookClassVO> getClassDetail(int class_no);



}
