package cn.xyurp.zs.service;

import cn.xyurp.system.util.ProjectException;
import cn.xyurp.zs.bean.GuestBook;

public interface GuestBookService {
	public void add(GuestBook guestBook) throws ProjectException;
	
	public void update(GuestBook guestBook) throws ProjectException;
	
	public void del(String[] ids) throws ProjectException;
	
	public GuestBook find(int id) throws ProjectException;
}
