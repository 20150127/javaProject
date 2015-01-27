package cn.xyurp.zs.service;

import java.util.List;

import cn.xyurp.system.util.ProjectException;
import cn.xyurp.zs.bean.ZZMM;

public interface ZZMMService {
	public List<ZZMM> getAll() throws ProjectException;
	public ZZMM find(int id) throws ProjectException;
}
