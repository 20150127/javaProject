package cn.xyurp.zs.service;

import java.util.List;

import cn.xyurp.system.util.ProjectException;
import cn.xyurp.zs.bean.DQ;

public interface DQService {
	public List<DQ> getAll() throws ProjectException;
	
	public DQ find(int id) throws ProjectException;
}
