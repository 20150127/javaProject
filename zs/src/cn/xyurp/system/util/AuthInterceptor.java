package cn.xyurp.system.util;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.StrutsStatics;

import cn.xyurp.system.bean.SysModule;
import cn.xyurp.system.bean.SysUser;
import cn.xyurp.system.service.SysACLService;
import cn.xyurp.system.service.SysModuleService;

import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.AbstractInterceptor;

public class AuthInterceptor extends AbstractInterceptor {
    private SysModuleService moduleService;
    private SysACLService sysACLService;
    private static final long serialVersionUID = 1L;

    public String intercept(ActionInvocation invocation) throws Exception {

	HttpServletRequest request = (HttpServletRequest) invocation
		.getInvocationContext().get(StrutsStatics.HTTP_REQUEST);
	String actionMethod = invocation.getInvocationContext().getName();

	String moduleSN = invocation.getProxy().getNamespace();
	int permission = 0;
	if (MyConstants.getAuthMethod(actionMethod) == null) {
	    return invocation.invoke();
	} else {
	    permission = MyConstants.getAuthMethod(actionMethod);
	}

	SysModule module = moduleService.findSysModuleBySn(moduleSN
		.substring(1));
	SysUser u = (SysUser) request.getSession().getAttribute("user");
	boolean has = false;
	if (module == null) {
	    return invocation.invoke();
	} else {
	    if (u == null) {
		return "login";
	    } else {
		has = sysACLService.hasPermission(u.getId(), module.getId(),
			permission);
	    }
	}
	if (!has) {
	    throw new ProjectException("您没有权限访问！");
	} else {
	    return invocation.invoke();
	}
    }

    public void setModuleService(SysModuleService moduleService) {
	this.moduleService = moduleService;
    }

    public void setSysACLService(SysACLService sysACLService) {
	this.sysACLService = sysACLService;
    }

}