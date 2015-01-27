package cn.xyurp.system.action;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import cn.xyurp.system.bean.SysRole;
import cn.xyurp.system.service.AbstractDao;
import cn.xyurp.system.service.SysRoleService;
import cn.xyurp.system.service.SysUserService;
import cn.xyurp.system.util.MyConstants;
import cn.xyurp.system.util.PagerModel;

import com.opensymphony.xwork2.ActionSupport;

/**
 * @author lichao
 * @time Nov 4, 2009 10:56:44 AM
 * @description 角色管理模块呈现 	
 */
public class SysRoleAction extends ActionSupport {
	private static final long serialVersionUID = 1L;
	private SysRoleService roleService;
	private SysRole sysRole;
	private AbstractDao abstractDao;

	public void setAbstractDao(AbstractDao abstractDao) {
		this.abstractDao = abstractDao;
	}

	public void setSysUserService(SysUserService sysUserService) {
	}

	public String addUI() {
		return SUCCESS;
	}

	public String add() {
		roleService.addRole(sysRole);
		return SUCCESS;
	}
	/**
	 * 删除角色
	 * @return
	 */
	public String del() {
		HttpServletRequest request = ServletActionContext.getRequest();
		roleService.delRole(request.getParameterValues("ids"));
		return SUCCESS;
	}

	public String findRole() {
		HttpServletRequest request = ServletActionContext.getRequest();
		SysRole role = roleService.findRole(sysRole.getId());
		request.setAttribute("sysRole", role);
		return SUCCESS;
	}
	public String findUsers() {
		HttpServletRequest request = ServletActionContext.getRequest();
		
		PagerModel page = abstractDao.searchPaginated("from UsersRoles ur where  ur.sysRoles.id = ?",sysRole.getId());
		request.setAttribute("roleId",sysRole.getId());
		request.setAttribute("page", page);
		return SUCCESS;
	}
	public String delUserRole() {
		HttpServletRequest request = ServletActionContext.getRequest();
		roleService.delUserRole(request.getParameterValues("ids"));
		return SUCCESS;
	}
	
	public String update() {
		roleService.updateRole(sysRole);
		return SUCCESS;
	}


	public String getList() {
		String hql = "from SysRole as r where 1=1";
		if (sysRole != null && !"".equals(sysRole.getRoleName())) {
			hql = hql + " and r.roleName like '%" + MyConstants.vd(sysRole.getRoleName().trim())
					+ "%'";
			sysRole.setRoleName(MyConstants.vd(sysRole.getRoleName().trim()));
		}
		HttpServletRequest request = ServletActionContext.getRequest();
		PagerModel page = abstractDao.searchPaginated(hql);
		request.setAttribute("sysRole", sysRole);
		request.setAttribute("page", page);
		return SUCCESS;
	}
	public String select() {
	    String hql = "from SysRole as r where 1=1";
	    HttpServletRequest request = ServletActionContext.getRequest();
	    PagerModel page = abstractDao.searchPaginated(hql);
	    request.setAttribute("page", page);
	    return SUCCESS;
	}

	public SysRole getSysRole() {
		return sysRole;
	}

	public void setSysRole(SysRole sysRole) {
		this.sysRole = sysRole;
	}

	public void setRoleService(SysRoleService roleService) {
		this.roleService = roleService;
	}
}
