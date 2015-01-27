package cn.xyurp.zs.service;

import java.util.List;

import cn.xyurp.system.util.ProjectException;
import cn.xyurp.zs.bean.KSLX;

public interface KSLXService {
	public List<KSLX> getAll() throws ProjectException;
	public KSLX find(int id) throws ProjectException;
}
