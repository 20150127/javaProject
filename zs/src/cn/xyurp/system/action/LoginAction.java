package cn.xyurp.system.action;

import java.util.Calendar;

import javax.servlet.http.HttpSession;
import cn.xyurp.system.bean.SysUser;
import cn.xyurp.system.service.AbstractDao;
import cn.xyurp.system.service.SysUserService;
import cn.xyurp.system.util.PagerModel;
import cn.xyurp.system.util.ProjectException;

/**
 * @author lichao
 * @time Nov 6, 2009 3:05:31 PM
 * @description 登录 	
 */
public class LoginAction extends BaseAction {
	private static final long serialVersionUID = 1L;
	private SysUserService userService;
	private AbstractDao abstractDao;
	

	public String login() {
		String acc = getRequest().getParameter("loginName");
		String pwd = getRequest().getParameter("loginPwd");
		SysUser user = userService.login(acc, pwd);
		String message="";
		if (user == null) {
		    message="用户名不存在!";
		}else if (!user.getPassword().equals(pwd)) {
		    message="密码错误!";
		}else if (user.getExpireTime() != null) {
		    Calendar now = Calendar.getInstance();
		    Calendar expireTime = Calendar.getInstance();
		    expireTime.setTime(user.getExpireTime());
		    if (now.after(expireTime)) {
			 message="用户账号已失效!";
		    }
		}
		HttpSession session = getRequest().getSession();
		session.setAttribute("user", user);
		getRequest().setAttribute("message", message);
		
		session.setMaxInactiveInterval(1800);
		PagerModel page=abstractDao.searchPaginated("select m from SysModule as m where m.parentModule.id is null order by m.orderId asc",0,Integer.MAX_VALUE);
		getRequest().getSession().setAttribute("page", page);
		if(!"".equals(message)){
		    return ERROR;
		}else{
		    return SUCCESS;
		}
	}
	
	public String logout() throws Exception {
		getRequest().getSession().removeAttribute("user");
		return SUCCESS;
	}

	public void setUserService(SysUserService userService) {
	    this.userService = userService;
	}

	public void setAbstractDao(AbstractDao abstractDao) {
	    this.abstractDao = abstractDao;
	}

	

}
