package cn.xyurp.system.dao.impl;

import java.util.List;

import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import cn.xyurp.system.bean.SysACL;
import cn.xyurp.system.bean.SysModule;
import cn.xyurp.system.dao.SysModuleDao;

public class SysModuleDaoImpl extends HibernateDaoSupport implements
	SysModuleDao {

    public void delSysModule(SysModule sysModule) {
	getHibernateTemplate().delete(sysModule);

    }

    @SuppressWarnings("unchecked")
    public void delPermission(SysModule sysModule) {
	List<SysACL> list = (List<SysACL>) getSession().createQuery(
		"select acl from SysACL acl where acl.sysModuleId = ? ")
		.setParameter(0, sysModule.getId()).list();
	for (int i = 0; i < list.size(); i++) {
	    SysACL sysACL = list.get(i);
	    getHibernateTemplate().delete(sysACL);
	}
    }

    public SysModule findSysModule(int sysModuleId) {
	return (SysModule) getSession().createQuery(
		"from SysModule m where m.id = ?").setParameter(0, sysModuleId)
		.uniqueResult();
    }

    public void addSysModule(SysModule sysModule, int parentId) {
	if (parentId != 0) {
	    sysModule.setParentModule(findSysModule(parentId));
	}
	getHibernateTemplate().save(sysModule);
    }

    public void updateModule(SysModule sysModule, int parentId) {
	getHibernateTemplate().update(sysModule);
    }

    public void addSysModule(SysModule sysModule) {
	getHibernateTemplate().save(sysModule);
    }

    public SysModule findSysModuleBySn(String sn) {
	return (SysModule) getSession().createQuery(
		"from SysModule m where m.sn = ?").setString(0, sn)
		.uniqueResult();
    }

    @SuppressWarnings("unchecked")
    public List<SysModule> findChildModule(int sysModuleId) {
	List<SysModule> list = getSession().createQuery(
		"from SysModule m where m.parentModule.id = ?").setParameter(0,
		sysModuleId).list();
	return list;
    }

    public SysModule findSysModuleBySnAndPid(String sn, int pid) {
	SysModule tmp = (SysModule) getSession().createQuery(
		"from SysModule m where m.sn = '" + sn
			+ "' and m.parentModule.id = " + pid).uniqueResult();
	return tmp;
    }

}
