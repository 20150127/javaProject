package cn.xyurp.zs.action;

import cn.xyurp.system.action.BaseAction;
import cn.xyurp.zs.bean.SysVariable;
import cn.xyurp.zs.service.SysVariableService;

/**
 * @author wangjian
 *
 */
public class SysVariableAction extends BaseAction {

	private static final long serialVersionUID = 5696522002836340581L;

	private SysVariableService svs;
	
	private SysVariable o;
	
	public String show() throws Exception {
		SysVariable obj = svs.find(o.getId());
		getRequest().setAttribute("o", obj);
		return SUCCESS;
	}

	public String update() throws Exception{
		svs.update(o);
		return SUCCESS;
	}
	
	public void setSvs(SysVariableService svs) {
		this.svs = svs;
	}

	public SysVariable getO() {
		return o;
	}

	public void setO(SysVariable o) {
		this.o = o;
	}
	
}
