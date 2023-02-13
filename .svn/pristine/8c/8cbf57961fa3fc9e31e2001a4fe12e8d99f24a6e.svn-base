package bps.wishlist.service;

import java.util.List;

import bps.wishlist.dao.IWishListDAO;
import bps.wishlist.dao.WishListDaoImpl;
import bps.wishlist.vo.WishListVO;



public class WishListServiceImpl implements IWishService{
	private static WishListServiceImpl instance;
	
	private IWishListDAO dao;
	
	private WishListServiceImpl() {
		dao = WishListDaoImpl.getInstance();
	}
	
	public static WishListServiceImpl getInstance() {
		if(instance == null) instance = new WishListServiceImpl();
	
		return instance;
	}
	
	@Override
	public List<WishListVO> getMyWishList(String mem_id) {
		// TODO Auto-generated method stub
		return dao.getMyWishList(mem_id);
	}
	
	public int deleteWishList(WishListVO vo) {
		
		return dao.deleteWishList(vo);
	}

	@Override
	public int insertWishList(WishListVO vo) {
		// TODO Auto-generated method stub
		return dao.insertWishList(vo);
	}

	@Override
	public int checkWishList(WishListVO vo) {
		// TODO Auto-generated method stub
		return dao.checkWishList(vo);
	}
}
