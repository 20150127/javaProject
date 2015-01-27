package cn.xyurp.system.util;

import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.StrutsStatics;

import cn.xyurp.system.bean.SysLog;
import cn.xyurp.system.bean.SysModule;
import cn.xyurp.system.bean.SysUser;
import cn.xyurp.system.service.SysLogService;
import cn.xyurp.system.service.SysModuleService;

import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.AbstractInterceptor;



public class LogInterceptor extends AbstractInterceptor {
	 private SysModuleService moduleService;
	    private SysLogService sysLogService;

	    private static final long serialVersionUID = 1L;

	    public String intercept(ActionInvocation invocation) throws Exception {

		HttpServletRequest request = (HttpServletRequest) invocation
			.getInvocationContext().get(StrutsStatics.HTTP_REQUEST);
		ServletRequest req=(ServletRequest)request;
		String actionMethod = invocation.getInvocationContext().getName();
		System.out.println("!!!!!!!!!! is:"+actionMethod);

		String moduleSN = invocation.getProxy().getNamespace();
		SysModule module = moduleService.findSysModuleBySn(moduleSN.substring(1));

		SysUser u = (SysUser) request.getSession().getAttribute("user");

		if (module == null) {
		    return invocation.invoke();
		} else {
		    SysLog sysLog = new SysLog();
		    sysLog.setSysModule(module.getSysModuleName() + "模块");
		    String method=MyConstants.getMethod(actionMethod);
		    if(method!=null && !"".equals(method)){
			sysLog.setSysMethod(method);
		    }else{
			 return invocation.invoke();
		    }
		    sysLog.setIp(req.getRemoteAddr());
		    sysLog.setSysTime(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss")
			    .format(new Date()));
		    sysLog.setSysUser(u.getUserName());
		    sysLogService.add(sysLog);
		    return invocation.invoke();
		}

	    }

	    public void setModuleService(SysModuleService moduleService) {
	        this.moduleService = moduleService;
	    }

	    public void setSysLogService(SysLogService sysLogService) {
	        this.sysLogService = sysLogService;
	    }

}