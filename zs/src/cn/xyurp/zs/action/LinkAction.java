package cn.xyurp.zs.action;

import cn.xyurp.system.action.BaseAction;
import cn.xyurp.system.service.AbstractDao;
import cn.xyurp.system.util.MyConstants;
import cn.xyurp.system.util.PagerModel;
import cn.xyurp.zs.bean.Link;
import cn.xyurp.zs.service.LinkService;

public class LinkAction extends BaseAction {
	
	private static final long serialVersionUID = 1L;
	private Link link;
	private AbstractDao abstractDao;
	
	private LinkService linkService;

	public Link getLink() {
		return link;
	}
	public void setLink(Link link) {
		this.link = link;
	}

	public void setAbstractDao(AbstractDao abstractDao) {
		this.abstractDao = abstractDao;
	}
	public void setLinkService(LinkService linkService) {
		this.linkService = linkService;
	}
	
	
	
	public String toAdd() throws Exception{
		return SUCCESS;
	}
	
	public String add() throws Exception{
		linkService.add(link);
		return SUCCESS;
	}
	
	public String update() throws Exception{
		linkService.update(link);
		return SUCCESS;
	}
	
	public String del() throws Exception{
		linkService.del(getRequest().getParameterValues("ids"));
		return SUCCESS;
	}
	
	public String show() throws Exception{
		Link l = linkService.find(link.getId());
		getRequest().setAttribute("link", l);
		return SUCCESS;
	}
	
	public String getList() throws Exception{
		StringBuffer hql = new StringBuffer();
		hql.append("from Link as l where 1=1");
		
		if(link!=null&&!"".equals(link.getTitle())){
			hql.append(" and l.title like '%");
			hql.append(MyConstants.vd(link.getTitle().trim()));
			hql.append("%'");
			link.setTitle(MyConstants.vd(link.getTitle().trim()));
		}
		getRequest().setAttribute("page", abstractDao.searchPaginated(hql.toString()));
		getRequest().setAttribute("link",link);
		return SUCCESS;
	}
	
	public String moreLink() throws Exception{
		PagerModel page = abstractDao.searchPaginated("from Link l order by l.pxh asc");
	    getRequest().setAttribute("page", page);
		return SUCCESS;
	}
}
