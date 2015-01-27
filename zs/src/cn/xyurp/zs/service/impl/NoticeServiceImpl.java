package cn.xyurp.zs.service.impl;

import javax.servlet.http.HttpServletRequest;

import cn.xyurp.system.dao.CommonDao;
import cn.xyurp.system.util.FileOperation;
import cn.xyurp.system.util.ProjectException;
import cn.xyurp.zs.bean.Notice;
import cn.xyurp.zs.service.NoticeService;

public class NoticeServiceImpl implements NoticeService {
	private CommonDao commonDao;

	public void setCommonDao(CommonDao commonDao) {
		this.commonDao = commonDao;
	}
	
	public void add(Notice notice) throws ProjectException{
		if(notice!=null){
			commonDao.add(notice);
		}else{
			throw new ProjectException("操作错误：试图添加一个不存在的对象");
		}
	}
	
	public void update(Notice notice) throws ProjectException{
		Notice tmp = (Notice)commonDao.load(Notice.class, notice.getId());
		if(tmp!=null){
			String path = tmp.getUploadResource();
			if (path != null && !"".equals(path)) {
				path = path + notice.getUploadResource();
			}else{
				path=notice.getUploadResource();
			}
			tmp.setTitle(notice.getTitle());
			tmp.setContent(notice.getContent());
			tmp.setIssueTime(notice.getIssueTime());
			tmp.setIssuePerson(notice.getIssuePerson());
			tmp.setUploadResource(path);
			commonDao.update(tmp);
		}else{
			throw new ProjectException("操作错误：试图修改一个不存在的对象");
		}
	}
	
	public void del(Notice notice,HttpServletRequest request) throws ProjectException{
		if(notice.getId()!=0){
			Notice temp = (Notice)commonDao.load(Notice.class, notice.getId());
			if(temp != null) {
				String path = temp.getUploadResource();
				String[] files = path.split(";");
				for (int i = 0; i < files.length; i++) {
					FileOperation.delFile(request.getSession().getServletContext().getRealPath(files[i]));
				}
				commonDao.del(temp);
			} else {
				throw new ProjectException("操作错误：试图删除不存在的对象！");
			}
		}
	}
	
	public Notice find(int id) throws ProjectException{
		Notice tmp = (Notice)commonDao.load(Notice.class, id);
		if(tmp==null){
			throw new ProjectException("您查找的对象不存在！");
		}
		return tmp;
	}

	public void release(Notice notice) throws ProjectException {
		Notice tmp = (Notice)commonDao.load(Notice.class, notice.getId());
		if(tmp!=null){
			tmp.setIfissue(notice.getIfissue());
			commonDao.update(tmp);
		}else{
			throw new ProjectException("操作错误：试图修改一个不存在的对象");
		}
	}
}
