package bps.recipenote.service;

import java.util.List;

import bps.recipenote.vo.RecipeNoteVO;

public interface IRecipenoteService {
	public List<RecipeNoteVO> getMyNote(String mem_id);

}
