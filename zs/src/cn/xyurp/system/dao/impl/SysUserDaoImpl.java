package cn.xyurp.system.dao.impl;

import java.util.Date;
import java.util.List;

import cn.xyurp.system.bean.SysRole;
import cn.xyurp.system.bean.SysUser;
import cn.xyurp.system.bean.UsersRoles;
import cn.xyurp.system.dao.SysUserDao;
import cn.xyurp.system.service.impl.AbstractDaoImpl;

public class SysUserDaoImpl extends AbstractDaoImpl implements SysUserDao {

    public void addOrUpdateUserRole(int sysUserId, int sysRoleId, int priority) {
	UsersRoles usersRoles = findUserRoles(sysUserId, sysRoleId);
	if (usersRoles == null) {
	    usersRoles = new UsersRoles();
	    usersRoles.setSysRoles((SysRole) getHibernateTemplate().load(
		    SysRole.class, sysRoleId));
	    usersRoles.setSysUsers((SysUser) getHibernateTemplate().load(
		    SysUser.class, sysUserId));
	    usersRoles.setPriority(priority);
	    getHibernateTemplate().save(usersRoles);
	    return;
	}
	usersRoles.setPriority(priority);
	getHibernateTemplate().update(usersRoles);
    }

    private UsersRoles findUserRoles(int sysUserId, int sysRoleId) {
	return (UsersRoles) getSession()
		.createQuery(
			"from UsersRoles ur where ur.sysRoles.id = ? and ur.sysUsers.id = ?")
		.setParameter(0, sysRoleId).setParameter(1, sysUserId)
		.uniqueResult();
    }

    public void addUser(SysUser sysUser) {
	sysUser.setCreateTime(new Date());
	getHibernateTemplate().save(sysUser);
    }

    public void delUser(SysUser sysUser) {
	getHibernateTemplate().delete(sysUser);
    }

    public void delUserRole(int sysUserId, int sysRoleId) {
	getHibernateTemplate().delete(findUserRoles(sysUserId, sysRoleId));
    }

    public SysUser findUser(int sysUserId) {
	return (SysUser) getHibernateTemplate().load(SysUser.class, sysUserId);
    }

    public SysUser login(String account, String password) {
	SysUser sysUser = (SysUser) getSession().createQuery(
		"from SysUser u where u.account = ?").setParameter(0, account)
		.uniqueResult();
	
	return sysUser;
    }

    @SuppressWarnings("unchecked")
    public List<SysUser> searchUsersOfRole(String roleName) {
	return getSession()
		.createQuery(
			"select u.userName from UsersRoles ur join ur.sysUsers u join ur.sysRoles r where r.roleName = ?")
		.setParameter(0, roleName).list();
    }

    public void updateUser(SysUser sysUser) {
	getHibernateTemplate().update(sysUser);
    }

    public void updateUserMM(SysUser sysUser) {
	getHibernateTemplate().update(sysUser);
    }

    /*
     * (non-Javadoc)
     * 
     * @see cn.xyurp.source.dao.system.SysUserDao#searchRolesOfUser(cn.xyurp.source.bean.system.SysUser)
     *      搜索用户的角色列�?
     * 
     */
    @SuppressWarnings("unchecked")
    public List<UsersRoles> searchRolesOfUser(SysUser sysUser) {
	return getSession().createQuery(
		"from UsersRoles ur where ur.sysUsers.id = ?").setParameter(0,
		sysUser.getId()).list();
    }

    public SysUser findUser(String account) {
	return (SysUser) getSession().createQuery(
		"from SysUser as s where s.account=?").setString(0, account)
		.uniqueResult();
    }

}
