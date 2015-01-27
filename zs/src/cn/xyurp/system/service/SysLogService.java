package cn.xyurp.system.service;

import cn.xyurp.system.bean.SysLog;
import cn.xyurp.system.util.ProjectException;

public interface SysLogService {

	public void add(SysLog sysLog) throws ProjectException;
	
	public void del(String[] ids) throws ProjectException; 
	
}
