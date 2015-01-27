package cn.xyurp.system.dao.impl;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;
import cn.xyurp.system.bean.SysACL;
import cn.xyurp.system.bean.SysModule;
import cn.xyurp.system.dao.Permission;
import cn.xyurp.system.dao.SysACLDao;

public class SysACLImpl extends HibernateDaoSupport implements SysACLDao {

    public void addOrUpdatePermission(String principalType, int principalId,
	    int moduleId, int permission, boolean yes) {
	SysACL acl = findACL(principalType, principalId, moduleId);
	if (acl != null) {
	    acl.setPermission(permission, yes);
	    getHibernateTemplate().update(acl);
	    return;
	}
	acl = new SysACL();
	acl.setPrincipalType(principalType);
	acl.setPrincipalId(principalId);
	acl.setSysModuleId(moduleId);
	acl.setPermission(permission, yes);
	getHibernateTemplate().save(acl);
    }

    private SysACL findACL(String principalType, int principalId,
	    int sysModuleId) {
	return (SysACL) getSession()
		.createQuery(
			"select acl from SysACL acl where acl.principalType = ? and acl.principalId = ? and acl.sysModuleId = ?")
		.setParameter(0, principalType).setParameter(1, principalId)
		.setParameter(2, sysModuleId).uniqueResult();
    }

    public void addOrUpdateUserExtends(int userId, int moduleId, boolean yes) {

	SysACL acl = findACL(SysACL.TYPE_USER, userId, moduleId);
	if (acl != null) {
	    acl.setExtends(yes);
	    getHibernateTemplate().update(acl);
	    return;
	}
	acl = new SysACL();
	acl.setPrincipalType(SysACL.TYPE_USER);
	acl.setPrincipalId(userId);
	acl.setSysModuleId(moduleId);
	acl.setExtends(yes);
	getHibernateTemplate().save(acl);

    }

    public void delPermission(String principalType, int principalId,
	    int sysModuleId) {
	getHibernateTemplate().delete(
		findACL(principalType, principalId, sysModuleId));
    }

    @SuppressWarnings("unchecked")
    public boolean hasPermission(int userId, int moduleId, int permission) {

	SysACL acl = findACL(SysACL.TYPE_USER, userId, moduleId);
	if (acl != null) {
	    int yesOrNo = acl.getPermission(permission);
	    if (yesOrNo != SysACL.ACL_NEUTRAL) {
		return yesOrNo == SysACL.ACL_YES ? true : false;
	    }
	}


	String hql = "select r.id from UsersRoles ur join ur.sysRoles r join ur.sysUsers u "
		+ "where u.id = ? order by ur.priority";
	List roleIds = getHibernateTemplate().find(hql, userId);


	for (Iterator iterator = roleIds.iterator(); iterator.hasNext();) {
	    Integer rid = (Integer) iterator.next();
	    acl = findACL(SysACL.TYPE_ROLE, rid, moduleId);
	    if (acl != null) {
		return acl.getPermission(permission) == SysACL.ACL_YES ? true
			: false;
	    }
	}

	return false;
    }

    public boolean hasPermissionBySn(int sysUserId, String sn, int permission) {
	String hql = "select m.id from SysModule m where m.sn = ? ";

	return hasPermission(sysUserId, (Integer) getSession().createQuery(hql)
		.setParameter(0, sn).uniqueResult(), permission);
    }

    @SuppressWarnings("unchecked")
    public List<SysACL> searchAclRecord(String principalType, int principalId) {
	String sql = "select sysModuleId,aclState,aclTriState "
		+ "from t_sysacl where principalType = '" + principalType
		+ "' and principalId = " + principalId;

	List<SysACL> list = getSession().createSQLQuery(sql).list();
	return list;
    }

    public List<SysModule> searchModules(int topid, int sysUserId) {
	List<SysModule> temp = new ArrayList<SysModule>();
	List<SysModule> list = recursion(topid, sysUserId);
	for (int i = 0; i < list.size(); i++) {
	    SysModule sys = list.get(i);
	   
	    //boolean b1 = hasPermission(sysUserId, sys.getId(), Permission.CREATE);
	    boolean b2 = hasPermission(sysUserId, sys.getId(), Permission.READ);
	   // boolean b3 = hasPermission(sysUserId, sys.getId(), Permission.UPDATE);
	    //boolean b4 = hasPermission(sysUserId, sys.getId(), Permission.DELETE);
//	    if (b1 || b2 || b3 || b4) {
		if (b2) {
		temp.add(sys);
	    }

	}
	return temp;
    }

    /**
     * 递归拿树
     * 
     * @param topid
     * @param sysUserId
     * @return
     */
    @SuppressWarnings("unchecked")
    public List<SysModule> recursion(int topid, int sysUserId) {

	List<SysModule> list = (List<SysModule>) getSession()
		.createQuery(
			"from SysModule as m where m.parentModule.id=? order by m.orderId")
		.setParameter(0, topid).list();
	for (int i = 0; i < list.size(); i++) {
	    SysModule sysModule = list.get(i);
	    if (sysModule.getIsLeaf() == 1) {
		List<SysModule> listtemp = recursion(sysModule.getId(),
			sysUserId);
		list.addAll(listtemp);
	    }
	}
	return list;
    }
    @SuppressWarnings ("unchecked")
    public void delPermission(String principalType, int principalId) {
	List<SysACL> list=(List<SysACL>)getSession().createQuery("select acl from SysACL acl where acl.principalType = ? and acl.principalId = ?").setParameter(0, principalType).setParameter(1, principalId).list();
	for (int i = 0; i < list.size(); i++) {
	    SysACL sysACL=list.get(i);
	    getHibernateTemplate().delete(sysACL);
	}
    }

}
