package cn.xyurp.zs.service;

import cn.xyurp.system.util.ProjectException;
import cn.xyurp.zs.bean.Link;

public interface LinkService {
	public void add(Link link) throws ProjectException;
	
	public void update(Link link) throws ProjectException;
	
	public void del(String[] ids) throws ProjectException;
	
	public Link find(int id) throws ProjectException;
	
}
