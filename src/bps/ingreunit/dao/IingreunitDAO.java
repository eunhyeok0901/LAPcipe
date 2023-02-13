package bps.ingreunit.dao;

import java.util.List;

import bps.ingreunit.vo.IngreunitVO;

public interface IingreunitDAO {
	public List<IngreunitVO> getAllMaterial(String code);
	
	public String getOneUnit(String food_name);

}
