package cn.xyurp.system.service;


import java.util.List;

import cn.xyurp.system.util.PagerModel;

public interface AbstractDao{
public PagerModel searchPaginated(String hql);
public PagerModel searchPaginated(String hql,Object param);
public PagerModel searchPaginated(String hql,Object[] params);
public PagerModel searchPaginated(String hql,int offset,int pagesize);
public PagerModel searchPaginated(String hql,Object param,int offset,int pagesize);
public PagerModel searchPaginated(String hql,Object[] params,int offset,int pagesize);
public Object findObject(String hql);
public Object findObject(String hql, Object value1);
public Object findObject(String hql, Object value1, Object value2);
public Object findObject(String hql, Object[] value);
public void update(Object o);
@SuppressWarnings("unchecked")
public List findList(String hql);
@SuppressWarnings("unchecked")
public List findList(String hql, Object value1);
@SuppressWarnings("unchecked")
public List findList(String hql, Object value1, Object value2);
@SuppressWarnings("unchecked")
public List findList(String hql, Object[] value);
}
