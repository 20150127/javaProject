package cn.xyurp.zs.service;

import java.util.List;

import cn.xyurp.system.util.ProjectException;
import cn.xyurp.zs.bean.KL;

public interface KLService {
	public List<KL> getAll() throws ProjectException;
	public KL find(int id) throws ProjectException;
}
