package cn.xyurp.system.service.impl;

import java.util.Calendar;
import java.util.List;

import cn.xyurp.system.bean.SysUser;
import cn.xyurp.system.bean.UsersRoles;
import cn.xyurp.system.dao.SysACLDao;
import cn.xyurp.system.dao.SysUserDao;
import cn.xyurp.system.service.SysUserService;
import cn.xyurp.system.util.ProjectException;

/**
 * @author lichao
 * @time Nov 2, 2009 11:14:51 AM
 * @description 用户管理模块业务逻辑层实
 * 
 */
public class SysUserServiceImpl implements SysUserService {
    private SysUserDao sysUserDao;
    private SysACLDao sysACLDao;

    public void setSysUserDao(SysUserDao sysUserDao) {
	this.sysUserDao = sysUserDao;
    }

    public void addUser(SysUser sysUser) {
	if (sysUser != null) {
	    sysUserDao.addUser(sysUser);
	} else {
	    throw new ProjectException("您正在试图添加一个不存在的用户！");
	}

    }

    public void delUser(String[] ids) {
	StringBuffer sb = new StringBuffer();
	if (ids != null) {

	    for (String string : ids) {
		SysUser sys = (SysUser) sysUserDao.findUser(Integer
			.parseInt(string));
		List<UsersRoles> list = sysUserDao.searchRolesOfUser(sys);
		if (sys != null) {
		    if (list.size() > 0) {
			sb.append("操作错误:用户" + sys.getUserName()
				+ "】与角色存在关联，请先删除它们关联!");
		    }
		} else {
		    throw new ProjectException("操作错误：试图删除不存在的用户！");
		}
	    }

	    if (sb.length() > 0) {
		throw new ProjectException(sb.toString());
	    } else {
		for (String string : ids) {
		    sysUserDao.delUser((SysUser) sysUserDao.findUser(Integer
			    .parseInt(string)));
		    sysACLDao.delPermission("User", Integer.parseInt(string));
		}
	    }
	}
    }

    public SysUser findUser(int userId) {
	SysUser sysUser = null;
	if (userId <= 0) {
	    throw new ProjectException("您查找的用户不存在！");
	} else {
	    sysUser = sysUserDao.findUser(userId);
	}
	return sysUser;
    }

    public void updateUser(SysUser sysUser) {
	if (sysUser != null) {
	    SysUser su = sysUserDao.findUser(sysUser.getId());
	    su.setExpireTime(sysUser.getExpireTime());
	    su.setRemark(sysUser.getRemark());
	    su.setSpecialty(sysUser.getSpecialty());
	    su.setTel(sysUser.getTel());
	    sysUserDao.updateUser(su);
	} else {
	    throw new ProjectException("您不能把一个已存在的用户更新为空！");
	}
    }

    public void updateUserMM(SysUser sysUser) {
	if (sysUser != null) {
	    SysUser su = sysUserDao.findUser(sysUser.getId());
	    su.setPassword(sysUser.getPassword());
	    sysUserDao.updateUserMM(su);
	} else {
	    throw new ProjectException("您不能修改不存在的用户的密码！");
	}
    }

    public SysUser login(String account, String password) {
	SysUser sysUser = sysUserDao.login(account, password);
	return sysUser;
    }

    public void addOrUpdateUserRole(int sysUserId, int sysRoleId, int priority) {
	if (sysUserId != 0 && sysRoleId != 0 && priority != 0) {
	    sysUserDao.addOrUpdateUserRole(sysUserId, sysRoleId, priority);
	} else {
	    throw new ProjectException("您在不能在用户和角色之间建立关联！");
	}

    }

    public void setSysACLDao(SysACLDao sysACLDao) {
	this.sysACLDao = sysACLDao;
    }

    public SysUser findUserAccount(String account) {
	return sysUserDao.findUser(account);
    }

}
