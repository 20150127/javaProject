package cn.xyurp.zs.service;

import java.util.List;

import cn.xyurp.system.util.ProjectException;
import cn.xyurp.zs.bean.BYLB;

public interface BYLBService {
	public List<BYLB> getAll() throws ProjectException;
	
	public BYLB find(int id) throws ProjectException;
}
