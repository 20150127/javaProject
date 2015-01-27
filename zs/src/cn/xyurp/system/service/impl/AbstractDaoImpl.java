package cn.xyurp.system.service.impl;

import java.util.List;

import org.hibernate.Query;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import cn.xyurp.system.service.AbstractDao;
import cn.xyurp.system.util.PagerModel;
import cn.xyurp.system.util.ProjectException;
import cn.xyurp.system.util.SystemContext;


public class AbstractDaoImpl  extends HibernateDaoSupport implements AbstractDao{

	public PagerModel searchPaginated(String hql){
		return searchPaginated(hql, null);
	}
	
	public PagerModel searchPaginated(String hql,Object param){
		return searchPaginated(hql, new Object[]{param});
	}
	
	public PagerModel searchPaginated(String hql,Object[] params){
		return searchPaginated(hql, params,SystemContext.getOffset(), SystemContext.getPagesize());
	}
	
	public PagerModel searchPaginated(String hql,int offset,int pagesize){
		return searchPaginated(hql,null, offset, pagesize);
	}
	public PagerModel searchPaginated(String hql,Object param,int offset,int pagesize){
		return searchPaginated(hql, new Object[]{param}, offset, pagesize);
	}
	@SuppressWarnings ("unchecked")
	public PagerModel searchPaginated(String hql,Object[] params,int offset,int pagesize){
		
		//获取记录总数
		String countHql = getCountQuery(hql);
		Query query = getSession().createQuery(countHql);
		if(params != null && params.length > 0){
			for(int i=0; i<params.length; i++){
				query.setParameter(i, params[i]);
			}
		}
		int total = ((Long)query.uniqueResult()).intValue();
		
		//获取结果�?

		query = getSession().createQuery(hql);
		if(params != null && params.length > 0){
			for(int i=0; i<params.length; i++){
				query.setParameter(i, params[i]);
			}
		}
		query.setFirstResult(offset);
		query.setMaxResults(pagesize);
		List<Object> datas = query.list();
		
		//返回PagerModel
		PagerModel pm = new PagerModel();
		pm.setDatas(datas);
		pm.setTotal(total);
		pm.setOffset(offset);
		pm.setPagesize(pagesize);
		return pm;
	}
	
	/**
	 * 根据HQL语句，获得查询�?�记录数的HQL语句
	 * @param hql
	 * @return
	 */
	private String getCountQuery(String hql){
		int index = hql.indexOf("from");
		int index2 = hql.indexOf("order");
		if(index != -1){
			if(index2!=-1){
				return "select count(*) " + hql.substring(index, index2);
			}
			return "select count(*) " + hql.substring(index);
		}
		throw new ProjectException("无效的HQL查询语句["+hql+"]");
	}
	public Object findObject(String hql) {
		return findObject(hql, null);
	}

	public Object findObject(String hql, Object value1) {
		return findObject(hql, new Object[]{value1});
	}

	public Object findObject(String hql, Object value1, Object value2) {
		return findObject(hql, new Object[]{value1,value2});
	}

	public Object findObject(String hql, Object[] value) {
		Query q = this.getSession().createQuery(hql);
		if(value != null){
			for (int i = 0; i < value.length; i++) {
				q.setParameter(i, value[i]);
			}
		}
		return q.uniqueResult();
	}
	public void update(Object o) {
		this.getSession().merge(o);
	}
	
	@SuppressWarnings("unchecked")
	public List findList(String hql) {
		return findList(hql, null);
	}

	@SuppressWarnings("unchecked")
	public List findList(String hql, Object value1) {
		return findList(hql, new Object[]{value1});
	}

	@SuppressWarnings("unchecked")
	public List findList(String hql, Object value1, Object value2) {
		return findList(hql, new Object[]{value1,value2});
	}

	@SuppressWarnings("unchecked")
	public List findList(String hql, Object[] value) {
		Query q = this.getSession().createQuery(hql);
		if(value != null){
			for (int i = 0; i < value.length; i++) {
				q.setParameter(i, value[i]);
			}
		}
		return q.list();
	}
}

