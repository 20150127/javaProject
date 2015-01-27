package cn.xyurp.zs.service;

import java.util.List;

import cn.xyurp.system.util.ProjectException;
import cn.xyurp.zs.bean.MZ;

public interface MZService {
	public List<MZ> getAll() throws ProjectException;
	public MZ find(int id) throws ProjectException;
}
