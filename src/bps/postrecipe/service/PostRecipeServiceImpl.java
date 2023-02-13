package bps.postrecipe.service;

import java.util.List;

import bps.postrecipe.dao.IPostRecipeDAO;
import bps.postrecipe.dao.PostRecipeDAOImpl;
import bps.postrecipe.vo.PostRecipeVO;

public class PostRecipeServiceImpl implements IPostRecipeService {
	private static PostRecipeServiceImpl instance;
	
	private IPostRecipeDAO dao;
	
	private PostRecipeServiceImpl() {
		dao = PostRecipeDAOImpl.getInstance();
	}
	
	public static PostRecipeServiceImpl getInstance() {
		if(instance == null) instance = new PostRecipeServiceImpl();
		
		return instance;
	}
	
	@Override
	public List<PostRecipeVO> getSomePostRecipe(String id) {
		return dao.getSomePostRecipe(id);
	}

	@Override
	public void insertPostRecipe(PostRecipeVO vo) {
		// TODO Auto-generated method stub
		dao.insertPostRecipe(vo);
	}

	@Override
	public String getOnePostRecipe(int rec_no) {
		// TODO Auto-generated method stub
		return dao.getOnePostRecipe(rec_no);
	}

}
