package cn.xyurp.system.dao.impl;

import java.util.List;

import cn.xyurp.system.bean.SysRole;
import cn.xyurp.system.bean.UsersRoles;
import cn.xyurp.system.dao.SysRoleDao;
import cn.xyurp.system.service.impl.AbstractDaoImpl;


public class SysRoleDaoImpl extends AbstractDaoImpl implements SysRoleDao {

    public void addSysRole(SysRole sysRole) {
	getHibernateTemplate().save(sysRole);
    }

    public void delSysRole(SysRole sysRole) {
	getHibernateTemplate().delete(sysRole);
    }

    public SysRole findSysRole(int sysRoleId) {
	SysRole sysRole = (SysRole) getHibernateTemplate().load(SysRole.class,
		sysRoleId);
	return sysRole;
    }

    public void updateSysRole(SysRole sysRole) {
	getHibernateTemplate().update(sysRole);
    }
    @SuppressWarnings ("unchecked")
    public List<UsersRoles> searchRolesOfUser(SysRole sysRole) {
	return getSession().createQuery(
		"from UsersRoles ur where ur.sysRoles.id = ?").setParameter(0,
		sysRole.getId()).list();
    }

    public void delUserRole(int userRoleId) {
	UsersRoles ur = (UsersRoles) getSession().createQuery(
		"from UsersRoles ur where ur.id = ?").setParameter(0,
		userRoleId).uniqueResult();
	getHibernateTemplate().delete(ur);
    }

	public SysRole findRole(String roleName) {
		SysRole role = (SysRole) getSession().createQuery("from SysRole as s where s.roleName = '"+roleName+"'").uniqueResult();
		return role;
	}

}
