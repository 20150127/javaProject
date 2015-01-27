package cn.xyurp.system.action;

import java.util.List;

import cn.xyurp.system.bean.SysACL;
import cn.xyurp.system.bean.SysModule;
import cn.xyurp.system.bean.SysUser;
import cn.xyurp.system.service.AbstractDao;
import cn.xyurp.system.service.SysACLService;
import cn.xyurp.system.service.SysModuleService;
import cn.xyurp.system.service.SysRoleService;
import cn.xyurp.system.service.SysUserService;
import cn.xyurp.system.util.PagerModel;


public class SysACLAction extends BaseAction {
    private static final long serialVersionUID = 1L;
    private SysModuleService moduleService;
    private SysRoleService roleService;
    private SysUserService userService;
    private SysACLService sysACLService;
    private AbstractDao abstractDao;
    private SysACL sysACL;

    public void setModuleService(SysModuleService moduleService) {
	this.moduleService = moduleService;
    }

    public void setRoleService(SysRoleService roleService) {
	this.roleService = roleService;
    }

    public void setUserService(SysUserService userService) {
	this.userService = userService;
    }

    public String getList() {
	int topid = Integer.parseInt(this.getRequest().getParameter("topid"));
	SysUser sysUser = (SysUser) this.getSession().getAttribute("user");
	if(sysUser == null){
	 return "leftlogin";   
	}else{
	List<SysModule> list = sysACLService.searchModules(topid, sysUser
		.getId());
	getRequest().setAttribute("page", list);
	getRequest().setAttribute("topid", topid);
	SysModule m = new SysModule();
	if (topid != 0) {
	    m = moduleService.findModule(topid);
	} else {
	    m.setSysModuleName("菜单目录");
	}
	getRequest().setAttribute("sm", m);
	return SUCCESS;
	}
    }

    public String useracl() {
	getRequest().setAttribute("principalType",
		getRequest().getParameter("principalType"));
	getRequest().setAttribute("principalId",
		getRequest().getParameter("principalId"));
	if ("User".equals(getRequest().getParameter("principalType"))) {
	    getRequest().setAttribute(
		    "user",
		    sysACLService.searchAclRecord(getRequest().getParameter(
			    "principalType"), Integer.parseInt(getRequest()
			    .getParameter("principalId"))));
	    getRequest().setAttribute(
		    "users",
		    userService.findUser(Integer.parseInt(getRequest()
			    .getParameter("principalId"))));
	} else if ("Role".equals(getRequest().getParameter("principalType"))) {
	    getRequest().setAttribute(
		    "role",
		    sysACLService.searchAclRecord(getRequest().getParameter(
			    "principalType"), Integer.parseInt(getRequest()
			    .getParameter("principalId"))));
	    getRequest().setAttribute(
		    "roles",
		    roleService.findRole(Integer.parseInt(getRequest()
			    .getParameter("principalId"))));
	}

	// 获得�?有模块列�?

	PagerModel pm = abstractDao.searchPaginated("from SysModule m ", 0,
		Integer.MAX_VALUE);

	this.getRequest().setAttribute("modules", pm.getDatas());

	return SUCCESS;
    }

    public void setSysACLService(SysACLService sysACLService) {
	this.sysACLService = sysACLService;
    }

    public SysACL getSysACL() {
	return sysACL;
    }

    public void setSysACL(SysACL sysACL) {
	this.sysACL = sysACL;
    }

    public void setAbstractDao(AbstractDao abstractDao) {
	this.abstractDao = abstractDao;
    }
}
