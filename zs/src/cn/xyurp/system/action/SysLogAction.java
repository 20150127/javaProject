package cn.xyurp.system.action;

import cn.xyurp.system.bean.SysLog;
import cn.xyurp.system.service.AbstractDao;
import cn.xyurp.system.service.SysLogService;



/**
 * @author wangjian
 * @time 2009-11-10 下午03:02:41
 * @description 系统日志
 */
public class SysLogAction extends BaseAction {

	private static final long serialVersionUID = -4051501761214526259L;
	private SysLogService sysLogService; 
	private AbstractDao abstractDao;
	private SysLog sysLog;
	private String beginTime;
	private String endTime;
	public String getBeginTime() {
		return beginTime;
	}

	public void setBeginTime(String beginTime) {
		this.beginTime = beginTime;
	}

	public String getEndTime() {
		return endTime;
	}

	public void setEndTime(String endTime) {
		this.endTime = endTime;
	}

	public SysLog getSysLog() {
		return sysLog;
	}

	public void setSysLog(SysLog sysLog) {
		this.sysLog = sysLog;
	}

	public void setSysLogService(SysLogService sysLogService) {
		this.sysLogService = sysLogService;
	}

	public void setAbstractDao(AbstractDao abstractDao) {
		this.abstractDao = abstractDao;
	}

	/**
	 * @author wangjian
	 * @time 2009-11-10 下午03:02:49
	 * @description
	 * @return
	 * @throws Exception
	 */
	public String getList() throws Exception{
		StringBuffer hql = new StringBuffer();
		hql.append("from SysLog as s where 1=1");
		if(sysLog != null && !"".equals(sysLog.getSysUser())) {
			hql.append(" and s.sysUser like '%");
			hql.append(sysLog.getSysUser().trim());
			hql.append("%'");
		}
		if(sysLog != null && !"".equals(sysLog.getSysModule())){
			hql.append(" and s.sysModule like '%");
			hql.append(sysLog.getSysModule().trim());
			hql.append("%'");
		}
		if(sysLog != null && !"".equals(sysLog.getSysMethod())){
			hql.append(" and s.sysMethod like '%");
			hql.append(sysLog.getSysMethod().toString());
			hql.append("%'");
		}
		if(sysLog != null && !"".equals(sysLog.getIp())){
			hql.append(" and s.ip like '%");
			hql.append(sysLog.getIp());
			hql.append("%'");
		}
		if(beginTime != null && !"".equals(beginTime)){
			hql.append(" and s.sysTime >= '");
			hql.append(beginTime.trim());
			hql.append("'");
		}
		if(endTime != null && !"".equals(endTime)){
			hql.append(" and s.sysTime <= '");
			hql.append(endTime);
			hql.append("'");
		}
		hql.append(" order by s.sysTime desc");
		getRequest().setAttribute("page", abstractDao.searchPaginated(hql.toString()));
		getRequest().setAttribute("sysLog", sysLog);
		getRequest().setAttribute("beginTime", beginTime);
		getRequest().setAttribute("endTime", endTime);
		return SUCCESS;
	}
	
	public String del() throws Exception{
		sysLogService.del(getRequest().getParameterValues("ids"));
		return SUCCESS;
	}
}
