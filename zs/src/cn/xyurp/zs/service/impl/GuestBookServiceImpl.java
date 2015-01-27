package cn.xyurp.zs.service.impl;

import cn.xyurp.system.dao.CommonDao;
import cn.xyurp.system.util.ProjectException;
import cn.xyurp.zs.bean.GuestBook;
import cn.xyurp.zs.service.GuestBookService;

public class GuestBookServiceImpl implements GuestBookService {
	private CommonDao commonDao;

	public void setCommonDao(CommonDao commonDao) {
		this.commonDao = commonDao;
	}
	
	public void add(GuestBook guestBook) throws ProjectException {
		if(guestBook!=null){
			commonDao.add(guestBook);
		}else{
			throw new ProjectException("操作错误：试图添加一个不存在的对象");
		}
	}

	public void del(String[] ids) throws ProjectException {
		if(ids!=null){
			for (String string : ids) {
				GuestBook temp = (GuestBook)commonDao.load(GuestBook.class, Integer.parseInt(string));
				if(temp != null) {
					commonDao.del(temp);
				} else {
					throw new ProjectException("操作错误：试图删除不存在的对象！");
				}
			}
		}
	}

	public GuestBook find(int id) throws ProjectException {
		GuestBook tmp = (GuestBook)commonDao.load(GuestBook.class, id);
		if(tmp==null){
			throw new ProjectException("您查找的对象不存在！");
		}
		return tmp;
	}

	public void update(GuestBook guestBook) throws ProjectException {
		GuestBook tmp = (GuestBook)commonDao.load(GuestBook.class, guestBook.getId());
		if(tmp!=null){
			tmp.setAnswer(guestBook.getAnswer());
			tmp.setAnswerPerson(guestBook.getAnswerPerson());
			tmp.setAnswerTime(guestBook.getAnswerTime());
			if(guestBook.getAnswer()!=null&&!"".equals(guestBook.getAnswer())){
				tmp.setIfanswer("1");
			}
			commonDao.update(tmp);
		}else{
			throw new ProjectException("操作错误：试图修改一个不存在的对象");
		}
	}

}
