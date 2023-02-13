package bps.wishlist.dao;

import java.sql.SQLException;
import java.util.List;

import com.ibatis.sqlmap.client.SqlMapClient;

import bps.util.SqlMapClientFactory;
import bps.wishlist.vo.WishListVO;

public class WishListDaoImpl implements IWishListDAO{
private static WishListDaoImpl instance;
	
	private SqlMapClient smc;
	
	private WishListDaoImpl() {
		smc = SqlMapClientFactory.getSqlMapClient();
	}
	
	public static WishListDaoImpl getInstance() {
		if(instance == null) instance = new WishListDaoImpl();
		
		return instance;
	}
	
	@Override
	public List<WishListVO> getMyWishList(String mem_id) {
		List<WishListVO> list = null;
		try {
			list = smc.queryForList("wishlist.getMyWishList",mem_id);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public int insertWishList(WishListVO vo) {
		int result = 0;
		try {
			Object obj1 =  smc.insert("wishlist.insertWishList",vo);
			if( obj1 == null) result = 1;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		// TODO Auto-generated method stub
		return result;
	}

	@Override
	public int deleteWishList(WishListVO vo) {
		int result = 0;
		
		try {
			result = smc.delete("wishlist.deleteWishList",vo);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public int checkWishList(WishListVO vo) {
		// TODO Auto-generated method stub
		int result = 0;
		
		try {
			result = (int) smc.queryForObject("wishlist.checkWishList",vo);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return result;
	}

}
