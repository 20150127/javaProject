package cn.xyurp.zs.action;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import cn.xyurp.system.action.BaseAction;
import cn.xyurp.system.service.AbstractDao;
import cn.xyurp.system.util.FileOperation;
import cn.xyurp.system.util.MyConstants;
import cn.xyurp.system.util.PagerModel;
import cn.xyurp.system.util.ProjectException;
import cn.xyurp.zs.bean.BYLB;
import cn.xyurp.zs.bean.DQ;
import cn.xyurp.zs.bean.GuestBook;
import cn.xyurp.zs.bean.KSLB;
import cn.xyurp.zs.bean.KSLX;
import cn.xyurp.zs.bean.MZ;
import cn.xyurp.zs.bean.Score;
import cn.xyurp.zs.bean.Specialty;
import cn.xyurp.zs.bean.SysVariable;
import cn.xyurp.zs.bean.XB;
import cn.xyurp.zs.bean.ZZMM;
import cn.xyurp.zs.service.BYLBService;
import cn.xyurp.zs.service.DQService;
import cn.xyurp.zs.service.GuestBookService;
import cn.xyurp.zs.service.KSLBService;
import cn.xyurp.zs.service.KSLXService;
import cn.xyurp.zs.service.MZService;
import cn.xyurp.zs.service.ScoreService;
import cn.xyurp.zs.service.SpecialtyService;
import cn.xyurp.zs.service.SysVariableService;
import cn.xyurp.zs.service.XBService;
import cn.xyurp.zs.service.ZZMMService;
public class UserAction extends BaseAction {
	private static final long serialVersionUID = -9012240244332315155L;
	
	private XBService xbService;
	private DQService dqService;
	private ZZMMService zzmmService;
	private MZService mzService;
	private BYLBService bylbService;
	private KSLBService kslbService;
	private SpecialtyService specialtyService;
	private ScoreService scoreService;
	private KSLXService kslxService; 
	private AbstractDao ad ;
	private GuestBookService gbs ;
	private SysVariableService svs;
	
	@SuppressWarnings("unused")
	private List<XB> xb;
	@SuppressWarnings("unused")
	private List<DQ> dq;
	@SuppressWarnings("unused")
	private List<ZZMM> zzmm;
	@SuppressWarnings("unused")
	private List<MZ> mz;
	@SuppressWarnings("unused")
	private List<BYLB> bylb;
	@SuppressWarnings("unused")
	private List<KSLB> kslb;
	@SuppressWarnings("unused")
	private List<Specialty> specialty;
	@SuppressWarnings("unused")
	private List<KSLX> kslx;
	private Score o;
	private String queryInfo;
	private String loginMsg;
	private String yzm;
	private String title;
	private String content;

	private File file;
	private String fileFileName;
	private String fileContentType;
	
	//旧密码
	private String oldPwd;
	private final static String UPLOADDIR = "/upload";

	
	public String login() throws ProjectException{
		String randCode = (String) getRequest().getSession().getAttribute("rand");
		Score obj = scoreService.findByIDCard(o.getIDCardNum());
		String str = "";
		SysVariable sysv = (SysVariable) getRequest().getSession().getAttribute("sysv");
		if(sysv.getIfLogin() == 1) {
			if(randCode.equals(yzm)){
				if(obj != null){
					if(obj.getPassword().equals(o.getPassword())) {
						str = SUCCESS;
						getRequest().getSession().setAttribute("IDCard", o.getIDCardNum());
						getRequest().getSession().setAttribute("o", obj);
					}else{
						loginMsg = "用户名或密码错误";
						str ="notRight";
					}
				}else{
					loginMsg = "用户名或密码错误";
					str ="notRight";
				}
			}else{
				loginMsg = "验证码输入错误";
				str ="notRight";
			}
		}else{
			loginMsg = "招生还未开始或已结束，登录功能暂停使用，请关注我们的招生公告!";
			str ="notRight";
		}
		return str;
	}
	
	public String register() throws Exception {
		String rootPath = "";
		String fileName = "";
		if (file != null) {
			rootPath = getRequest().getSession().getServletContext()
					.getRealPath(UPLOADDIR);
			rootPath += "/";
			fileName = FileOperation.uploadForName(o.getExamineeNum()+".jpg", rootPath,
					file);
		}
		o.setExamineePhoto(UPLOADDIR+"/"+fileName);
		o.setKl(o.getExamineeNum().substring(9, 10));
		scoreService.save(o);
		
		getRequest().getSession().setAttribute("IDCard", o.getIDCardNum());
		return SUCCESS;
	}
	
	public String toRegisterCheck() throws Exception {
		SysVariable sysv = (SysVariable) getRequest().getSession().getAttribute("sysv");
		String str = "";
		if(sysv.getIfReg() == 1){
			str = SUCCESS;
		}else{
			loginMsg = "招生还未开始或已结束，注册功能暂停使用，请关注我们的招生公告!";
			str = "notRight";
		}
		return str;
	}

	public String toRegister() throws Exception {
		String ifCheck = getRequest().getParameter("accept");
		String str= "";
		if(ifCheck.equals("1")){
			str = SUCCESS;
		}
		return str;
	}

	public String toLogin() throws Exception{
		PagerModel page = ad.searchPaginated("from Notice n where n.ifissue='1' order by n.issueTime desc",0,10);
		getRequest().setAttribute("page", page);
		PagerModel page2 = ad.searchPaginated("from Link l order by l.pxh asc", 0, 10);
		getRequest().setAttribute("page2", page2);
		SysVariable sv = svs.get(1);
		getRequest().getSession().setAttribute("sysv", sv);
		return SUCCESS;
	}
	@SuppressWarnings("unchecked")
	public String listBook() throws Exception{
	    PagerModel page = ad.searchPaginated("from Notice n where n.ifissue='1' order by n.issueTime desc");
		getRequest().setAttribute("page", page);
		String IDCard = (String) getRequest().getSession().getAttribute("IDCard");
		Score obj = scoreService.findByIDCard(IDCard);
		String str = "";
		if(obj != null){
			String hql = "from GuestBook g where g.asker.id="+obj.getId();
			List<GuestBook> gbs = ad.findList(hql);
			getRequest().setAttribute("gbs", gbs);
			str = SUCCESS;
		}else{
			str = "notLogin";
		}
		return str;
	}
	
	public String addGB() throws Exception{
		String IDCard = (String) getRequest().getSession().getAttribute("IDCard");
		Score obj = scoreService.findByIDCard(IDCard);
		
		title = new String(title.getBytes("iso-8859-1"),"UTF-8");
		content = new String(content.getBytes("iso-8859-1"),"UTF-8");
		GuestBook gb = new GuestBook();
		gb.setAsker(obj);
		gb.setAskTime(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()));
		gb.setTitle(title);
		gb.setContent(content);
		gb.setIfanswer("0");
		gbs.add(gb);
		return SUCCESS;
	}
	
	public String show() throws Exception {
	    PagerModel page = ad.searchPaginated("from Notice n where n.ifissue=1 order by n.issueTime desc",0,5);
		getRequest().setAttribute("page", page);
		String IDCard = (String) getRequest().getSession().getAttribute("IDCard");
		Score obj = scoreService.findByIDCard(IDCard);
		String str = "";
		if(obj != null){
			str = SUCCESS;
			getRequest().getSession().setAttribute("o", obj);
		}else{
			str = "notLogin";
		}
		return str;
	}

	
	public String toUpdate() throws Exception{
	    PagerModel page = ad.searchPaginated("from Notice n where n.ifissue='1' order by n.issueTime desc");
		getRequest().setAttribute("page", page);
		String IDCard = (String) getRequest().getSession().getAttribute("IDCard");
		Score obj = scoreService.findByIDCard(IDCard);
		String str = "";
		if(obj != null){
			if(obj.getAdmissionId() != null && !"".equals(obj.getAdmissionId())){
				str = "notUpdate";
			}else{
				str = SUCCESS;
			}
		}else{
			str = "notLogin";
		}
		return str;
	}
	
	public String update() throws Exception{
		String IDCard = (String) getRequest().getSession().getAttribute("IDCard");
		Score obj = scoreService.findByIDCard(IDCard);
		//o.setExamineePhoto(obj.getExamineePhoto());
		
		String rootPath = "";
		String fileName = "";
		if (file != null) {
			FileOperation.delFile(getServletContext().getRealPath(obj.getExamineePhoto()));
			rootPath = getRequest().getSession().getServletContext()
			.getRealPath(UPLOADDIR);
			rootPath += "/";
			fileName = FileOperation.uploadForName(obj.getExamineeNum()+".jpg", rootPath,
					file);
			o.setExamineePhoto(UPLOADDIR+"/"+fileName);
		}else{
			o.setExamineePhoto(obj.getExamineePhoto());
		}
		o.setKl(o.getExamineeNum().substring(9, 10));
		String str = "";
		if(obj != null){
			str = SUCCESS;
			scoreService.updateRegisterInfo(o);
		}else{
			str = "notLogin";
		}
		return str;
	}
	
	public String toUpdatepwd() throws Exception{
	    	PagerModel page = ad.searchPaginated("from Notice n where n.ifissue='1' order by n.issueTime desc");
		getRequest().setAttribute("page", page);
		String IDCard = (String) getRequest().getSession().getAttribute("IDCard");
		Score obj = scoreService.findByIDCard(IDCard);
		String str = "";
		if(obj != null){
			str = SUCCESS;
		}else{
			str = "notLogin";
		}
		return str;
	}
	
	public String updatepwd() throws Exception{
		String IDCard = (String) getRequest().getSession().getAttribute("IDCard");
		Score obj = scoreService.findByIDCard(IDCard);
		String str = "";
		if(obj != null){
			if(oldPwd!=null && oldPwd.trim().equals(obj.getPassword())){
				scoreService.updatePwd(o.getId(), o.getPassword());
				str = SUCCESS;
			}else{
				getRequest().setAttribute("errorMsg", "旧密码不正确！");
				str = "error";
			}
		}else{
			str = "notLogin";
		}
		return str;
	}
	
	public String queryInfo() throws Exception{
	    	PagerModel page = ad.searchPaginated("from Notice n where n.ifissue='1' order by n.issueTime desc");
		getRequest().setAttribute("page", page);
		String IDCard = (String) getRequest().getSession().getAttribute("IDCard");
		Score obj = scoreService.findByIDCard(IDCard);
		String str = "";
		if(obj != null){
			getRequest().getSession().setAttribute("o", obj);
			str = SUCCESS;
		}else{
			str = "notLogin";
		}
		return str;
	}
//	Integer i = obj.getIfAdmit();
//	switch (i) {
//	case 0:
//		queryInfo = "还未被录取!!";
//		break;
//	case 1:
//		queryInfo = "被录取专业:"+obj.getSpecialtyId().getName();
//		break;
//	default:
//		queryInfo = "无法判断！";
//	break;
//	}
	
	public String exit() throws Exception{
		String IDCard = (String) getRequest().getSession().getAttribute("IDCard");
		Score obj = (Score) getRequest().getSession().getAttribute("o");
		if(IDCard != null && !"".equals(IDCard)){
			getRequest().getSession().removeAttribute("IDCard");
		}
		if(obj != null){
			getRequest().getSession().removeAttribute("o");
		}
		PagerModel page = ad.searchPaginated("from Notice n order by n.issueTime desc",0,10);
		getRequest().setAttribute("page", page);
		PagerModel page2 = ad.searchPaginated("from Link l order by l.pxh asc", 0, 10);
		getRequest().setAttribute("page2", page2);
		return SUCCESS;
	}
	
	public void setDqService(DQService dqService) {
		this.dqService = dqService;
	}

	public void setXbService(XBService xbService) {
		this.xbService = xbService;
	}

	public void setZzmmService(ZZMMService zzmmService) {
		this.zzmmService = zzmmService;
	}

	public void setMzService(MZService mzService) {
		this.mzService = mzService;
	}

	public void setBylbService(BYLBService bylbService) {
		this.bylbService = bylbService;
	}

	public void setSpecialtyService(SpecialtyService specialtyService) {
		this.specialtyService = specialtyService;
	}

	public void setScoreService(ScoreService scoreService) {
		this.scoreService = scoreService;
	}

	public Score getO() {
		return o;
	}

	public void setO(Score o) {
		this.o = o;
	}

	public void setKslbService(KSLBService kslbService) {
		this.kslbService = kslbService;
	}

	public File getFile() {
		return file;
	}

	public void setFile(File file) {
		this.file = file;
	}

	public String getFileFileName() {
		return fileFileName;
	}

	public void setFileFileName(String fileFileName) {
		this.fileFileName = fileFileName;
	}

	public String getFileContentType() {
		return fileContentType;
	}

	public void setFileContentType(String fileContentType) {
		this.fileContentType = fileContentType;
	}
	
	public List<XB> getXb() {
		return xbService.getAll();
	}

	public void setXb(List<XB> xb) {
		this.xb = xb;
	}

	public List<DQ> getDq() {
		return dqService.getAll();
	}

	public void setDq(List<DQ> dq) {
		this.dq = dq;
	}

	public List<ZZMM> getZzmm() {
		return zzmmService.getAll();
	}

	public void setZzmm(List<ZZMM> zzmm) {
		this.zzmm = zzmm;
	}

	public List<MZ> getMz() {
		return mzService.getAll();
	}

	public void setMz(List<MZ> mz) {
		this.mz = mz;
	}

	public List<BYLB> getBylb() {
		return bylbService.getAll();
	}

	public void setBylb(List<BYLB> bylb) {
		this.bylb = bylb;
	}

	public List<KSLB> getKslb() {
		return kslbService.getAll();
	}

	public void setKslb(List<KSLB> kslb) {
		this.kslb = kslb;
	}

	public List<Specialty> getSpecialty() {
		return specialtyService.findAll();
	}

	public void setSpecialty(List<Specialty> specialty) {
		this.specialty = specialty;
	}

	public void setKslxService(KSLXService kslxService) {
		this.kslxService = kslxService;
	}

	public List<KSLX> getKslx() {
		return kslxService.getAll();
	}

	public void setKslx(List<KSLX> kslx) {
		this.kslx = kslx;
	}
	public String getLoginMsg() {
		return loginMsg;
	}

	public void setLoginMsg(String loginMsg) {
		this.loginMsg = loginMsg;
	}

	public String getYzm() {
		return yzm;
	}

	public void setYzm(String yzm) {
		this.yzm = yzm;
	}

	public String getQueryInfo() {
		return queryInfo;
	}

	public void setQueryInfo(String queryInfo) {
		this.queryInfo = queryInfo;
	}

	public void setAd(AbstractDao ad) {
		this.ad = ad;
	}
	

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public void setGbs(GuestBookService gbs) {
		this.gbs = gbs;
	}

	public void setSvs(SysVariableService svs) {
	    this.svs = svs;
	}

	public String getOldPwd() {
		return oldPwd;
	}

	public void setOldPwd(String oldPwd) {
		this.oldPwd = oldPwd;
	}

	
}
