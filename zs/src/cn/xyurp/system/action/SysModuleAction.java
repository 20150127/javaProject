package cn.xyurp.system.action;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import cn.xyurp.system.bean.SysModule;
import cn.xyurp.system.bean.SysUser;
import cn.xyurp.system.dao.Permission;
import cn.xyurp.system.service.AbstractDao;
import cn.xyurp.system.service.SysACLService;
import cn.xyurp.system.service.SysModuleService;
import cn.xyurp.system.service.SysUserService;
import cn.xyurp.system.util.MyConstants;
import cn.xyurp.system.util.PagerModel;

import com.opensymphony.xwork2.ActionSupport;

public class SysModuleAction extends ActionSupport {
    private static final long serialVersionUID = 1L;
    private SysModuleService moduleService;
    private SysModule sysModule;
    private AbstractDao abstractDao;
    private SysUserService sysUserService;
    private SysACLService sysACLService;

    public void setAbstractDao(AbstractDao abstractDao) {
	this.abstractDao = abstractDao;
    }

    public void setModuleService(SysModuleService moduleService) {
	this.moduleService = moduleService;
    }

    public String addUI() {
	return SUCCESS;
    }

    public String add() {

	if (!"1".equals(sysModule.getSysLevel())) {
	    String url = MyConstants.getUrl(sysModule.getSn());
	    if (url == null) {
		sysModule.setSysUrl("");
	    } else {
		sysModule.setSysUrl(url);
	    }
	}
	SysModule psysModule = new SysModule();

	if (sysModule.getParentModule() != null
		&& 0 != sysModule.getParentModule().getId()) {
	    psysModule = moduleService.findModule(sysModule.getParentModule()
		    .getId());
	    psysModule.setIsLeaf(1);
	    moduleService.updateModule(psysModule);
	}

	int level = 1;
	if (sysModule.getParentModule() != null
		&& 0 != sysModule.getParentModule().getId()) {
	    level = Integer.parseInt(psysModule.getSysLevel()) + 1;
	}
	sysModule.setSysLevel(Integer.toString(level));


	if ("顶级模块".equals(sysModule.getParentModule().getSysModuleName())) {
	    sysModule.setParentModule(null);
	    moduleService.addModule(sysModule);

	    SysModule s = moduleService.findSysModuleBySn(sysModule.getSn());

	    SysUser sysUser = (SysUser) ServletActionContext.getRequest()
		    .getSession().getAttribute("user");
	    if (!"admin".equals(sysUser.getAccount())) {
		SysUser user = (SysUser) sysUserService
			.findUserAccount("admin");
		sysACLService.addOrUpdatePermission("User", user.getId(), s
			.getId(), Permission.READ, true);
		sysACLService.addOrUpdatePermission("User", user.getId(), s
			.getId(), Permission.CREATE, true);
		sysACLService.addOrUpdatePermission("User", user.getId(), s
			.getId(), Permission.DELETE, true);
		sysACLService.addOrUpdatePermission("User", user.getId(), s
			.getId(), Permission.UPDATE, true);

		sysACLService.addOrUpdatePermission("User", sysUser.getId(), s
			.getId(), Permission.READ, true);
		sysACLService.addOrUpdatePermission("User", sysUser.getId(), s
			.getId(), Permission.CREATE, true);
		sysACLService.addOrUpdatePermission("User", sysUser.getId(), s
			.getId(), Permission.DELETE, true);
		sysACLService.addOrUpdatePermission("User", sysUser.getId(), s
			.getId(), Permission.UPDATE, true);
	    } else {
		sysACLService.addOrUpdatePermission("User", sysUser.getId(), s
			.getId(), Permission.READ, true);
		sysACLService.addOrUpdatePermission("User", sysUser.getId(), s
			.getId(), Permission.CREATE, true);
		sysACLService.addOrUpdatePermission("User", sysUser.getId(), s
			.getId(), Permission.DELETE, true);
		sysACLService.addOrUpdatePermission("User", sysUser.getId(), s
			.getId(), Permission.UPDATE, true);
	    }
	} else {
	    moduleService.addModule(sysModule, sysModule.getParentModule()
		    .getId());
	    String pid = Integer.toString(sysModule.getParentModule().getId());
	    SysModule s = moduleService.findSysModuleBySnAndPid(sysModule
		    .getSn(), pid);

	    SysUser sysUser = (SysUser) ServletActionContext.getRequest()
		    .getSession().getAttribute("user");
	    if (!"admin".equals(sysUser.getAccount())) {
		SysUser user = (SysUser) sysUserService
			.findUserAccount("admin");
		sysACLService.addOrUpdatePermission("User", user.getId(), s
			.getId(), Permission.READ, true);
		sysACLService.addOrUpdatePermission("User", user.getId(), s
			.getId(), Permission.CREATE, true);
		sysACLService.addOrUpdatePermission("User", user.getId(), s
			.getId(), Permission.DELETE, true);
		sysACLService.addOrUpdatePermission("User", user.getId(), s
			.getId(), Permission.UPDATE, true);

		sysACLService.addOrUpdatePermission("User", sysUser.getId(), s
			.getId(), Permission.READ, true);
		sysACLService.addOrUpdatePermission("User", sysUser.getId(), s
			.getId(), Permission.CREATE, true);
		sysACLService.addOrUpdatePermission("User", sysUser.getId(), s
			.getId(), Permission.DELETE, true);
		sysACLService.addOrUpdatePermission("User", sysUser.getId(), s
			.getId(), Permission.UPDATE, true);
	    } else {
		sysACLService.addOrUpdatePermission("User", sysUser.getId(), s
			.getId(), Permission.READ, true);
		sysACLService.addOrUpdatePermission("User", sysUser.getId(), s
			.getId(), Permission.CREATE, true);
		sysACLService.addOrUpdatePermission("User", sysUser.getId(), s
			.getId(), Permission.DELETE, true);
		sysACLService.addOrUpdatePermission("User", sysUser.getId(), s
			.getId(), Permission.UPDATE, true);
	    }
	}

	return SUCCESS;
    }

    public String del() {
	HttpServletRequest request = ServletActionContext.getRequest();
	moduleService.delModule(request.getParameterValues("ids"));
	return SUCCESS;
    }

    public String update() {
	if (!"1".equals(sysModule.getSysLevel())) {
	    String url = MyConstants.getUrl(sysModule.getSn());
	    if (url == null) {
		sysModule.setSysUrl("");
	    } else {
		sysModule.setSysUrl(url);
	    }
	}
	if ("顶级模块".equals(sysModule.getParentModule().getSysModuleName())) {
	    sysModule.setParentModule(null);
	    moduleService.updateModule(sysModule, 0);
	} else {
	    moduleService.updateModule(sysModule, sysModule.getParentModule()
		    .getId());
	}
	return SUCCESS;
    }

    public String findModule() {
	SysModule module = moduleService.findModule(sysModule.getId());
	if (module.getParentModule() == null) {
	    SysModule pmd = new SysModule();
	    pmd.setSysModuleName("顶级模块");
	    module.setParentModule(pmd);
	}
	ServletActionContext.getRequest().setAttribute("module", module);
	return SUCCESS;
    }

    /**
     * 资源模块module_index.jsp
     * 
     * @return
     */
    public String getList() {
	HttpServletRequest request = ServletActionContext.getRequest();
	String hql = "";
	String id = request.getParameter("id");

	String level = request.getParameter("level");
	String lookup = request.getParameter("lookup");
	if(sysModule!=null){
	    sysModule.setSysLevel(MyConstants.vd(sysModule.getSysLevel()));
	    sysModule.setSysModuleName(MyConstants.vd(sysModule.getSysModuleName().trim()));
	    sysModule.setSn(MyConstants.vd(sysModule.getSn().trim()));
	}
	if ("1".equals(lookup)) {
	    hql = "from SysModule as m where 1=1 ";
	    if (sysModule != null) {
		if ("".equals(sysModule.getSysModuleName())
			&& "".equals(sysModule.getSn())
			&& "".equals(sysModule.getSysLevel())) {
		    hql = "from SysModule as m where m.parentModule is null order by m.orderId";
		}

		if (!"".equals(sysModule.getSysModuleName())) {
		    hql = hql
			    + " and m.sysModuleName like '%"
			    + MyConstants.vd(sysModule.getSysModuleName()
				    .trim()) + "%'";
		}
		if (!"".equals(sysModule.getSn())) {
		    hql = hql + " and m.sn like '%"
			    + MyConstants.vd(sysModule.getSn().trim()) + "%'";
		}
		if (!"".equals(sysModule.getSysLevel())) {
		    hql = hql + " and m.sysLevel like '%"
			    + MyConstants.vd(sysModule.getSysLevel()) + "%'";
		}

	    }
	} else if (level != null && !"".equals(level)) {
	    SysModule o = moduleService.findModule(Integer.parseInt(level));
	    if (o.getParentModule() != null) {
		if (o.getParentModule().getParentModule() != null) {
		    hql = "from SysModule as m where m.parentModule.id="
			    + o.getParentModule().getParentModule().getId()
			    + " order by m.orderId";
		    request.setAttribute("isTop", 0);
		} else {
		    hql = "from SysModule as m where m.parentModule is null order by m.orderId";
		    request.setAttribute("isTop", 1);
		}
	    } else {
		hql = "from SysModule as m where m.parentModule is null order by m.orderId";
		request.setAttribute("isTop", 1);
	    }
	} else if (id == null || "".equals(id)) {
	    hql = "from SysModule as m where m.parentModule is null order by m.orderId";
	    request.setAttribute("isTop", 1);
	} else {
	    hql = "from SysModule as m where m.parentModule.id="
		    + Integer.parseInt(id) + " order by m.orderId";
	    request.setAttribute("isTop", 0);
	}

	PagerModel page = abstractDao.searchPaginated(hql);
	request.setAttribute("page", page);

	request.setAttribute("sysModule", sysModule);
	return SUCCESS;
    }

    /**
     * module_select.jsp
     * 
     * @return
     */
    public String selectList() {
	HttpServletRequest request = ServletActionContext.getRequest();
	String hql = "";
	String id = request.getParameter("id");
	String level = request.getParameter("level");
	String lookup = request.getParameter("lookup");

	if ("1".equals(lookup)) {
	    hql = "from SysModule as m where 1=1 ";
	    if (sysModule != null) {
		if ("".equals(sysModule.getSysModuleName())
			&& "".equals(sysModule.getSn())
			&& "".equals(sysModule.getSysLevel())) {
		    hql = "from SysModule as m where m.parentModule is null order by m.orderId";
		}
		if (!"".equals(sysModule.getSysModuleName())) {
		    hql = hql
			    + " and m.sysModuleName like '%"
			    + MyConstants.vd(sysModule.getSysModuleName()
				    .trim()) + "%'";
		    sysModule.setSysModuleName(MyConstants.vd(sysModule.getSysModuleName().trim()));
		}
		if (!"".equals(sysModule.getSn())) {
		    hql = hql + " and m.sn like '%"
			    + MyConstants.vd(sysModule.getSn().trim()) + "%'";
		    sysModule.setSn(MyConstants.vd(sysModule.getSn().trim()));
		}
		if (!"".equals(sysModule.getSysLevel())) {
		    hql = hql + " and m.sysLevel like '%"
			    + MyConstants.vd(sysModule.getSysLevel()) + "%'";
		    sysModule.setSysLevel(MyConstants.vd(sysModule.getSysLevel()));
		}
	    }
	} else if (level != null && !"".equals(level)) {
	    SysModule o = moduleService.findModule(Integer.parseInt(level));
	    if (o.getParentModule() != null) {
		if (o.getParentModule().getParentModule() != null) {
		    hql = "from SysModule as m where m.parentModule.id="
			    + o.getParentModule().getParentModule().getId()
			    + " order by m.orderId";
		    request.setAttribute("isTop", 0);
		} else {
		    hql = "from SysModule as m where m.parentModule is null order by m.orderId";
		    request.setAttribute("isTop", 1);
		}
	    } else {
		hql = "from SysModule as m where m.parentModule is null order by m.orderId";
		request.setAttribute("isTop", 1);
	    }
	} else if (id == null || "".equals(id)) {
	    hql = "from SysModule as m where m.parentModule is null order by m.orderId";
	    request.setAttribute("isTop", 1);
	} else {
	    hql = "from SysModule as m where m.parentModule.id="
		    + Integer.parseInt(id) + " order by m.orderId";
	    request.setAttribute("isTop", 0);
	}
	PagerModel page = abstractDao.searchPaginated(hql);
	request.setAttribute("page", page);

	request.setAttribute("sysModule", sysModule);
	SysModule sys = new SysModule();
	if (page.getDatas().size() > 0 && request.getParameter("id") != null) {
	    sys = (SysModule) page.getDatas().get(0);
	}
	if (sys.getParentModule() != null) {
	    request.setAttribute("id", sys.getParentModule().getId());
	}
	return SUCCESS;
    }

    public SysModule getSysModule() {
	return sysModule;
    }

    public void setSysModule(SysModule sysModule) {
	this.sysModule = sysModule;
    }

    public void setSysUserService(SysUserService sysUserService) {
	this.sysUserService = sysUserService;
    }

    public void setSysACLService(SysACLService sysACLService) {
	this.sysACLService = sysACLService;
    }

}
