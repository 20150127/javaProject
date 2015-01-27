package cn.xyurp.zs.action;

import cn.xyurp.system.action.BaseAction;
import cn.xyurp.system.service.AbstractDao;
import cn.xyurp.system.util.PagerModel;
import cn.xyurp.zs.bean.GuestBook;
import cn.xyurp.zs.bean.Score;
import cn.xyurp.zs.service.GuestBookService;

public class GuestBookAction extends BaseAction{
	
	private static final long serialVersionUID = 1L;
	private AbstractDao abstractDao;
	private GuestBook guestBook;
	private Score asker;
	
	private GuestBookService guestBookService;
	
	public AbstractDao getAbstractDao() {
		return abstractDao;
	}
	public void setAbstractDao(AbstractDao abstractDao) {
		this.abstractDao = abstractDao;
	}
	public GuestBook getGuestBook() {
		return guestBook;
	}
	public void setGuestBook(GuestBook guestBook) {
		this.guestBook = guestBook;
	}
	public Score getAsker() {
		return asker;
	}
	public void setAsker(Score asker) {
		this.asker = asker;
	}
	
	public void setGuestBookService(GuestBookService guestBookService) {
		this.guestBookService = guestBookService;
	}
	
	
	
	public String toAdd() throws Exception{
		return SUCCESS;
	}
	
	public String add() throws Exception{
		guestBookService.add(guestBook);
		return SUCCESS;
	}
	
	public String update() throws Exception{
		guestBookService.update(guestBook);
		return SUCCESS;
	}
	
	public String del() throws Exception{
		guestBookService.del(getRequest().getParameterValues("ids"));
		return SUCCESS;
	}
	
	public String show() throws Exception{
		GuestBook gb = guestBookService.find(guestBook.getId());
		getRequest().setAttribute("guestBook", gb);
		return SUCCESS;
	}
	
	public String getList() throws Exception{
		StringBuffer hql = new StringBuffer();
		hql.append("from GuestBook as g where 1=1");
		if(guestBook!=null&&!"".equals(getRequest().getParameter("askTime1"))){
			hql.append(" and g.askTime >='");
			hql.append(getRequest().getParameter("askTime1"));
			hql.append("'");
		}
		if(guestBook!=null&&!"".equals(getRequest().getParameter("askTime2"))){
			hql.append(" and g.askTime <='");
			hql.append(getRequest().getParameter("askTime2"));
			hql.append("'");
		}
		if(guestBook!=null&&!"".equals(guestBook.getIfanswer())){
			hql.append(" and g.ifanswer = '");
			hql.append(guestBook.getIfanswer());
			hql.append("'");
		}
		PagerModel page = abstractDao.searchPaginated(hql.toString());
		getRequest().setAttribute("page", page);
		getRequest().setAttribute("guestBook", guestBook);
		return SUCCESS;
	}
}
