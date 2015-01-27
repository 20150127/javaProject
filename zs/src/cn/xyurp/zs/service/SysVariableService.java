package cn.xyurp.zs.service;

import cn.xyurp.system.util.ProjectException;
import cn.xyurp.zs.bean.SysVariable;

public interface SysVariableService {

	public abstract void update(SysVariable sv) throws ProjectException;

	public abstract SysVariable find(Integer id) throws ProjectException;
	
	public abstract SysVariable get(Integer id) throws ProjectException;

}