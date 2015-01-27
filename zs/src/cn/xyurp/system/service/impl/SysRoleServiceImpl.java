package cn.xyurp.system.service.impl;


import java.util.List;

import cn.xyurp.system.bean.SysRole;
import cn.xyurp.system.bean.UsersRoles;
import cn.xyurp.system.dao.SysACLDao;
import cn.xyurp.system.dao.SysRoleDao;
import cn.xyurp.system.service.SysRoleService;
import cn.xyurp.system.util.ProjectException;

/**
 * @author lichao
 * @time Nov 2, 2009 11:14:03 AM
 * @description 角色管理模块业务逻辑层实
 */
public class SysRoleServiceImpl implements SysRoleService {
    private SysRoleDao sysRoleDao;
    private SysACLDao sysACLDao;
    public void setSysACLDao(SysACLDao sysACLDao) {
        this.sysACLDao = sysACLDao;
    }
    public void addRole(SysRole sysRole) {
	if(sysRole!=null){
	    sysRoleDao.addSysRole(sysRole);   
	}else{
	    throw new ProjectException("您试图添加一个不存在的角色！");
	}
    }
    public void delRole(String[] ids) {
    	
    	StringBuffer sb = new StringBuffer();
		if(ids != null) {
			for (String string : ids) {
				SysRole sys=(SysRole)sysRoleDao.findSysRole(Integer.parseInt(string));
				List<UsersRoles> list=sysRoleDao.searchRolesOfUser(sys);
				if(sys != null) {
					if(list.size()>0) {
						sb.append("操作错误:角色【"+sys.getRoleName()+"】与用户存在关联，请先删除它们关联!");
					}
				} else {
					throw new ProjectException("操作错误：试图删除不存在的角色！");
				}
			}
			
			if(sb.length()>0) {
				throw new ProjectException(sb.toString());
			} else {
				for (String string : ids) {
					sysRoleDao.delSysRole(sysRoleDao.findSysRole(Integer.parseInt(string)));
					sysACLDao.delPermission("Role",Integer.parseInt(string));
				}
			}
		}
	}
    	

    public SysRole findRole(int roleId) {
	SysRole sysRole=null;
	if(roleId<=0){
	    throw new ProjectException("您要查找的角色不存在!");
	}else{
	    sysRole=sysRoleDao.findSysRole(roleId);
	}
	return sysRole;
    }

    public void updateRole(SysRole sysRole) {
	if(sysRole!=null){
	    sysRoleDao.updateSysRole(sysRole);
	}else{
	    throw new ProjectException("您不能把角色更新为空！");
	}
    }

    public void setSysRoleDao(SysRoleDao sysRoleDao) {
        this.sysRoleDao = sysRoleDao;
    }
	public void delUserRole(String[] ids) {
		if(ids != null) {
			for (String string : ids) {
				sysRoleDao.delUserRole(Integer.parseInt(string));
			}
		}else{
			throw new ProjectException("您要删除的关联不存在关联!");
		}
		
	}
	public SysRole findRoleName(String roleName) {
		return sysRoleDao.findRole(roleName);
	}
}
