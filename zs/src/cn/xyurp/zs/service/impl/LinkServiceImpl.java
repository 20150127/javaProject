package cn.xyurp.zs.service.impl;

import cn.xyurp.system.dao.CommonDao;
import cn.xyurp.system.util.ProjectException;
import cn.xyurp.zs.bean.Link;
import cn.xyurp.zs.service.LinkService;

public class LinkServiceImpl implements LinkService {
	private CommonDao commonDao;

	public void setCommonDao(CommonDao commonDao) {
		this.commonDao = commonDao;
	}
	
	public void add(Link link) throws ProjectException {
		if(link!=null){
			commonDao.add(link);
		}else{
			throw new ProjectException("操作错误：试图添加一个不存在的对象");
		}
	}

	public void del(String[] ids) throws ProjectException {
		if(ids!=null){
			for (String string : ids) {
				Link temp = (Link)commonDao.load(Link.class, Integer.parseInt(string));
				if(temp != null) {
					commonDao.del(temp);
				} else {
					throw new ProjectException("操作错误：试图删除不存在的对象！");
				}
			}
		}
	}

	public Link find(int id) throws ProjectException {
		Link tmp = (Link)commonDao.load(Link.class, id);
		if(tmp==null){
			throw new ProjectException("您查找的对象不存在！");
		}
		return tmp;
	}

	public void update(Link link) throws ProjectException {
		Link tmp =(Link)commonDao.load(Link.class, link.getId());
		if(tmp!=null){
			tmp.setPxh(link.getPxh());
			tmp.setTitle(link.getTitle());
			tmp.setPath(link.getPath());
			tmp.setRemark(link.getRemark());
			commonDao.update(tmp);
		}else{
			throw new ProjectException("操作错误：试图修改一个不存在的对象");
		}
	}
	
}
