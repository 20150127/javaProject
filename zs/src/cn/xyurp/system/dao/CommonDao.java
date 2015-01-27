package cn.xyurp.system.dao;

import java.io.Serializable;
import java.util.List;

public interface CommonDao {
	public void add(Object o);
	public void update(Object o);
	public void del(Object o);
	@SuppressWarnings("unchecked")
	public Object get(Class c, Serializable id);
	@SuppressWarnings("unchecked")
	public Object load(Class c, Serializable id);
	public Object findObject(String hql);
	public Object findObject(String hql, Object value1);
	public Object findObject(String hql, Object value1, Object value2);
	public Object findObject(String hql, Object[] value);
	@SuppressWarnings("unchecked")
	public List findList(String hql);
	@SuppressWarnings("unchecked")
	public List findList(String hql, Object value1);
	@SuppressWarnings("unchecked")
	public List findList(String hql, Object value1, Object value2);
	@SuppressWarnings("unchecked")
	public List findList(String hql, Object[] value);
	
	
	
}
