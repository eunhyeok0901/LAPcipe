package bps.classreview.dao;

import java.util.List;

import bps.classreview.vo.ClassReviewVO;
import bps.classreview.vo.ReviewVO;

public interface IClassReviewDao {
	
	//클래스 리뷰에 별점
	public List<ClassReviewVO> getReview(int class_no);
	//등록한 클래스 불러오기
	public List<ReviewVO> registerClass(String mem_id);
	
	//리뷰 등록
	public int insertReview(ClassReviewVO vo);
	
	//리뷰 등록은 1회만 가능하다
	public int countReview(ClassReviewVO vo);
	
	//리뷰 내용 가져오기
	public String getReviewCon(ClassReviewVO vo);
	
	//리뷰 수정저장
	public int insertNewCon(ClassReviewVO vo);

	//리뷰 삭제
	public int deleteReview(String con);
}
