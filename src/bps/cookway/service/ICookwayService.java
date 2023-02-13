package bps.cookway.service;

import java.util.List;

import bps.cookway.vo.CookwayVO;

public interface ICookwayService {
	// vo객체를 받아서 데이터를 추가시켜주는 메소드 
		public void cookwayInsert(CookwayVO vo);

		public List<CookwayVO> getSomeCookway(int rec_no);
}
