package cn.xyurp.zs.service;

import java.util.List;

import cn.xyurp.system.util.ProjectException;
import cn.xyurp.zs.bean.KSLB;

public interface KSLBService {
	public List<KSLB> getAll() throws ProjectException;
	public KSLB find(int id) throws ProjectException;
}
