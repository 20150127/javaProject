package cn.xyurp.zs.service;

import java.util.List;

import cn.xyurp.system.util.ProjectException;
import cn.xyurp.zs.bean.XB;

public interface XBService {
	public List<XB> getAll() throws ProjectException;
	public XB find(int id) throws ProjectException;
}
