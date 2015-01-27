package cn.xyurp.zs.service;

import javax.servlet.http.HttpServletRequest;

import cn.xyurp.system.util.ProjectException;
import cn.xyurp.zs.bean.Notice;

public interface NoticeService {
	public void add(Notice notice) throws ProjectException;
	
	public void update(Notice notice) throws ProjectException;
	
	public void del(Notice notice,HttpServletRequest request) throws ProjectException;
	
	public Notice find(int id) throws ProjectException;
	
	public void release(Notice notice) throws ProjectException;
}
