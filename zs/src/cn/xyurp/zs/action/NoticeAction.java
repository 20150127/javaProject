package cn.xyurp.zs.action;

import java.io.File;
import java.util.List;

import org.apache.poi.util.SystemOutLogger;

import cn.xyurp.system.action.BaseAction;
import cn.xyurp.system.service.AbstractDao;
import cn.xyurp.system.util.FileOperation;
import cn.xyurp.system.util.MyConstants;
import cn.xyurp.system.util.PagerModel;
import cn.xyurp.zs.bean.Notice;
import cn.xyurp.zs.service.NoticeService;


public class NoticeAction extends BaseAction{
	private static final long serialVersionUID = 1L;
	private Notice notice;
	private AbstractDao abstractDao;
	private List<File> file;
    private List<String> fileFileName;
    private List<String> fileContentType;
    private final static String UPLOADDIR = "/upload";
	private String issueTime;
	
	private NoticeService noticeService;
	
	public Notice getNotice() {
		return notice;
	}
	public void setNotice(Notice notice) {
		this.notice = notice;
	}
	public AbstractDao getAbstractDao() {
		return abstractDao;
	}
	public void setAbstractDao(AbstractDao abstractDao) {
		this.abstractDao = abstractDao;
	}
	public String getIssueTime() {
		return issueTime;
	}
	public void setIssueTime(String issueTime) {
		this.issueTime = issueTime;
	}
	public List<File> getFile() {
		return file;
	}
	public void setFile(List<File> file) {
		this.file = file;
	}
	public List<String> getFileFileName() {
		return fileFileName;
	}
	public void setFileFileName(List<String> fileFileName) {
		this.fileFileName = fileFileName;
	}
	public List<String> getFileContentType() {
		return fileContentType;
	}
	public void setFileContentType(List<String> fileContentType) {
		this.fileContentType = fileContentType;
	}
	
	public void setNoticeService(NoticeService noticeService) {
		this.noticeService = noticeService;
	}
	
	public String toAdd() throws Exception{
		return SUCCESS;
	}
	
	public String add() throws Exception{
		if (issueTime != null && !"".equals(issueTime)) {
			notice.setIssueTime(issueTime);
		}else{
			notice.setIssueTime("");
		}
		StringBuffer str = new StringBuffer();
		if (file != null) {
			for (int i = 0; i < file.size(); ++i) {
				String rootPath = getRequest().getSession().getServletContext()
						.getRealPath(UPLOADDIR);
				rootPath += "/";
				String fileName = FileOperation.uploadForName(this.getFileFileName().get(i), rootPath, file.get(i));
				str.append(UPLOADDIR + "/" + fileName + ";");
			}
		}
		if(str.toString() !=null && str.toString() != ""){
			notice.setUploadResource(str.toString());
		}else {
			notice.setUploadResource("");
		}
		if(notice!=null && notice.getContent()!=null){
		    notice.setContent("&nbsp;<br/>"+notice.getContent());
		}
		noticeService.add(notice);
		return SUCCESS;
	}
	
	public String update() throws Exception{
		if (issueTime != null && !"".equals(issueTime)) {
			notice.setIssueTime(issueTime);
		}else{
			notice.setIssueTime("");
		}
		
		StringBuffer str = new StringBuffer();
		if (file != null) {
			for (int i = 0; i < file.size(); ++i) {
				String rootPath = getRequest().getSession().getServletContext()
						.getRealPath(UPLOADDIR);
				rootPath += "/";
				String fileName = FileOperation.uploadForName(this.getFileFileName().get(i), rootPath, file.get(i));
				str.append(UPLOADDIR + "/" + fileName + ";");
			}
		}
		if(str.toString() !=null && str.toString() != ""){
			notice.setUploadResource(str.toString());
		}else {
			notice.setUploadResource("");
		}
		if(notice!=null && notice.getContent()!=null){
		    if(!notice.getContent().startsWith("&nbsp;<br/>")){
			notice.setContent("&nbsp;<br/>"+notice.getContent());
		    }
		}
		noticeService.update(notice);
		return SUCCESS;
	}
	
	public String release() throws Exception{
		noticeService.release(notice);
		return SUCCESS;
	}
	
	public String del() throws Exception{
		noticeService.del(notice,getRequest());
		return SUCCESS;
	}
	
	public String show() throws Exception{
	    	
		Notice n = noticeService.find(notice.getId());
		getRequest().setAttribute("notice", n);
		return SUCCESS;
	}
	public String show2() throws Exception{
	    PagerModel page = abstractDao.searchPaginated("from Notice n where n.ifissue='1' order by n.issueTime desc",0,5);
	    getRequest().setAttribute("page", page);
	    Notice n = noticeService.find(notice.getId());
	    getRequest().setAttribute("notice", n);
	    getRequest().setAttribute("str", n.getContent());
	    return SUCCESS;
	}
	
	public String getList() throws Exception{
		StringBuffer hql = new StringBuffer();
		hql.append("from Notice as n where 1=1");
		if(notice!=null&&!"".equals(notice.getTitle())){
			hql.append(" and n.title like '%");
			hql.append(MyConstants.vd(notice.getTitle().trim()));
			hql.append("%'");
			notice.setTitle(MyConstants.vd(notice.getTitle().trim()));
		}
		if(getRequest().getParameter("issueTime1")!=null&&!"".equals(getRequest().getParameter("issueTime1"))){
			hql.append(" and n.issueTime >='");
			hql.append(getRequest().getParameter("issueTime1"));
			hql.append("'");
			getRequest().setAttribute("issueTime1", getRequest().getParameter("issueTime1"));
		}
		if(getRequest().getParameter("issueTime2")!=null&&!"".equals(getRequest().getParameter("issueTime2"))){
			hql.append(" and n.issueTime <='");
			hql.append(getRequest().getParameter("issueTime2"));
			hql.append("'");
			getRequest().setAttribute("issueTime2", getRequest().getParameter("issueTime2"));
		}
		PagerModel page = abstractDao.searchPaginated(hql.toString());
		getRequest().setAttribute("page", page);
		getRequest().setAttribute("notice", notice);
		return SUCCESS;
	}
	
	public String moreNotice() throws Exception{
		PagerModel page = abstractDao.searchPaginated("from Notice n where n.ifissue='1' order by n.issueTime desc");
	    getRequest().setAttribute("page", page);
		return SUCCESS;
	}
}
