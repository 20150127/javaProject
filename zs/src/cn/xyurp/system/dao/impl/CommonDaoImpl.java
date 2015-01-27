package cn.xyurp.system.dao.impl;

import java.io.Serializable;
import java.util.List;

import org.hibernate.Query;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import cn.xyurp.system.dao.CommonDao;

public class CommonDaoImpl extends HibernateDaoSupport implements CommonDao {

    public void add(Object o) {
	this.getSession().save(o);
    }

    public void del(Object o) {
	this.getSession().delete(o);
    }

    @SuppressWarnings("unchecked")
    public List findList(String hql) {
	return findList(hql, null);
    }

    @SuppressWarnings("unchecked")
    public List findList(String hql, Object value1) {
	return findList(hql, new Object[] { value1 });
    }

    @SuppressWarnings("unchecked")
    public List findList(String hql, Object value1, Object value2) {
	return findList(hql, new Object[] { value1, value2 });
    }

    @SuppressWarnings("unchecked")
    public List findList(String hql, Object[] value) {
	Query q = this.getSession().createQuery(hql);
	if (value != null) {
	    for (int i = 0; i < value.length; i++) {
		q.setParameter(i, value[i]);
	    }
	}
	return q.list();
    }

    public Object findObject(String hql) {
	return findObject(hql, null);
    }

    public Object findObject(String hql, Object value1) {
	return findObject(hql, new Object[] { value1 });
    }

    public Object findObject(String hql, Object value1, Object value2) {
	return findObject(hql, new Object[] { value1, value2 });
    }

    public Object findObject(String hql, Object[] value) {
	Query q = this.getSession().createQuery(hql);
	if (value != null) {
	    for (int i = 0; i < value.length; i++) {
		q.setParameter(i, value[i]);
	    }
	}
	return q.uniqueResult();
    }

    @SuppressWarnings("unchecked")
    public Object get(Class c, Serializable id) {
	return this.getSession().get(c, id);
    }

    @SuppressWarnings("unchecked")
    public Object load(Class c, Serializable id) {
	return this.getSession().load(c, id);
    }

    public void update(Object o) {
	this.getSession().merge(o);
    }


}
