package bps.buyedclass.service;

import java.util.List;

import bps.buyedclass.vo.BuyedClassVO;
import bps.buyedclass.vo.BuyedVO;

public interface IBuyedClassService {

	public List<BuyedClassVO> getAllBuyedClass();
	
	//마이페이지 등록클래스
		public List<BuyedVO> registeredClass(String id);
}
