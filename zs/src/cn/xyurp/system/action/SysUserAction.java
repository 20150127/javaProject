package cn.xyurp.system.action;



import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import cn.xyurp.system.bean.SysUser;
import cn.xyurp.system.bean.UsersRoles;
import cn.xyurp.system.service.AbstractDao;
import cn.xyurp.system.service.SysUserService;
import cn.xyurp.system.util.MyConstants;
import cn.xyurp.system.util.PagerModel;
import cn.xyurp.zs.bean.Specialty;
import cn.xyurp.zs.service.SpecialtyService;

import com.opensymphony.xwork2.ActionSupport;

/**
 * @author lichao
 * @time Nov 6, 2009 3:05:31 PM
 * @description 用户模块呈现层实现类 	
 */
public class SysUserAction extends ActionSupport {
	private static final long serialVersionUID = 1L;
	private SysUserService userService;
	private AbstractDao abstractDao;
	private SysUser sysUser;
	private SpecialtyService specialtyService;
	private UsersRoles usersRoles;
	private Date expireTime;

	
	public Date getExpireTime() {
	    return expireTime;
	}

	public void setExpireTime(Date expireTime) {
	    this.expireTime = expireTime;
	}

	public SysUser getSysUser() {
		return sysUser;
	}

	public void setSysUser(SysUser sysUser) {
		this.sysUser = sysUser;
	}

	public void setUserService(SysUserService userService) {
		this.userService = userService;
	}

	public String addUI() {
	    List<Specialty> list=specialtyService.findAll();
	    ServletActionContext.getRequest().setAttribute("specialtys", list);
		return SUCCESS;
	}

	public String add() {
	    if(expireTime!=null && !"".equals(expireTime)){
		
		sysUser.setExpireTime(expireTime);
	    }
	   if(sysUser.getSpecialty()!=null && sysUser.getSpecialty().getId()==0){
	       sysUser.setSpecialty(null);
	   }
		userService.addUser(sysUser);
		return SUCCESS;
	}
	
	public String updateExpireTime() {
	    if(expireTime!=null && !"".equals(expireTime)){
		sysUser.setExpireTime(expireTime);
	    }
	    if(sysUser.getSpecialty()!=null && sysUser.getSpecialty().getId()==0){
		sysUser.setSpecialty(null);
	    }
	    userService.updateUser(sysUser);
	    return SUCCESS;
	}

	/**
	 * 删除没有角色关联的用户	 * @return
	 */
	public String del() {
		HttpServletRequest request = ServletActionContext.getRequest();
		userService.delUser(request.getParameterValues("ids"));
		return SUCCESS;
	}

	/**
	 * 跳到为用户分配角色界
	 * @return
	 */
	public String addRoles() {
	    HttpServletRequest request = ServletActionContext.getRequest();
	    ServletActionContext.getRequest().setAttribute("userId", request.getParameter("userId"));
	    return SUCCESS;
	}
	
	/**
	 * 在用户和角色之间建立关联
	 * @return
	 */
	public String userAddRoles() {
	    HttpServletRequest request = ServletActionContext.getRequest();
	    userService.addOrUpdateUserRole(Integer.parseInt(request.getParameter("userId")),usersRoles.getSysRoles().getId() , usersRoles.getPriority());
	    return SUCCESS;
	}
	
	public String findUser() {
		HttpServletRequest request = ServletActionContext.getRequest();
		SysUser user = userService.findUser(sysUser.getId());
		request.setAttribute("sysUser", user);
		List<Specialty> list=specialtyService.findAll();
		ServletActionContext.getRequest().setAttribute("specialtys", list);
		return SUCCESS;
	}

	/**
	 * 得到用户的所有角色列
	 * @return
	 */
	public String userRoleList(){
		if(sysUser!=null){
		PagerModel page=abstractDao.searchPaginated("from UsersRoles ur where ur.sysUsers.id = ?",sysUser.getId());
		ServletActionContext.getRequest().setAttribute("page",page);
		}
		ServletActionContext.getRequest().setAttribute("userId",sysUser.getId());
		return SUCCESS;
	}
	/**
	 * 跳转到修改密码页面
	 * @return
	 */
	public String toUpdateMM() {
		return SUCCESS;
	}
	
	public String updateUserMM(){
		userService.updateUserMM(sysUser);
		return SUCCESS;
	}

	public String getList() {
	    	String hql = "from SysUser as u where 1=1";
		if (sysUser!= null && !"".equals(sysUser.getUserName())) {
			hql = hql + " and u.userName like '%"
					+ MyConstants.vd(sysUser.getUserName().trim()) + "%'";
			sysUser.setUserName(MyConstants.vd(sysUser.getUserName().trim()));
		}
		if (sysUser!= null && !"".equals(sysUser.getAccount())) {
			hql = hql + " and u.account like '%" + MyConstants.vd(sysUser.getAccount().trim())
					+ "%'";
			sysUser.setAccount(MyConstants.vd(sysUser.getAccount().trim()));
		}
		HttpServletRequest request = ServletActionContext.getRequest();
		PagerModel page = abstractDao.searchPaginated(hql);
		request.setAttribute("sysUser", sysUser);
		request.setAttribute("page", page);
		return SUCCESS;
	}


	public String login() {
		HttpServletRequest request = ServletActionContext.getRequest();
		String acc = request.getParameter("loginName");
		String pwd = request.getParameter("loginPwd");
		SysUser user = userService.login(acc, pwd);
		HttpSession session = request.getSession();
		session.setAttribute("user", user);
		session.setMaxInactiveInterval(1800);
		PagerModel page=abstractDao.searchPaginated("select m from SysModule as m where m.parentModule.id is null order by m.orderId asc",0,Integer.MAX_VALUE);
		request.getSession().setAttribute("page", page);
		return SUCCESS;
	}
	
	public String logintwo() {
		HttpServletRequest request = ServletActionContext.getRequest();
		String acc = request.getParameter("loginName");
		String pwd = request.getParameter("loginPwd");
		SysUser user = userService.login(acc, pwd);
		request.getSession().setAttribute("user", user);
		PagerModel page=abstractDao.searchPaginated("select m from SysModule as m where m.parentModule.id is null order by m.orderId asc",0,Integer.MAX_VALUE);
		request.getSession().setAttribute("page", page);
		return SUCCESS;
	}
	public String logout() throws Exception {
		HttpServletRequest request = ServletActionContext.getRequest();
		request.getSession().removeAttribute("user");
		return SUCCESS;
	}

	public void setAbstractDao(AbstractDao abstractDao) {
		this.abstractDao = abstractDao;
	}

	public UsersRoles getUsersRoles() {
	    return usersRoles;
	}

	public void setUsersRoles(UsersRoles usersRoles) {
	    this.usersRoles = usersRoles;
	}

	public SpecialtyService getSpecialtyService() {
	    return specialtyService;
	}

	public void setSpecialtyService(SpecialtyService specialtyService) {
	    this.specialtyService = specialtyService;
	}

}
