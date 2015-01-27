package cn.xyurp.system.service;

import cn.xyurp.system.bean.Domain;
import cn.xyurp.system.util.ProjectException;


/**
 * @author wangjian
 * @time 2009-11-5 上午09:18:59
 * @description 集合域管理
 */
public interface DomainService {

	/**
	 * @author wangjian
	 * @time 2009-11-5 上午09:22:03
	 * @description add
	 * @param domain
	 * @throws ProjectException
	 */
	public void add(Domain domain) throws ProjectException;
	
	/**
	 * @author wangjian
	 * @time 2009-11-5 上午09:22:05
	 * @description update
	 * @param domain
	 * @throws ProjectException
	 */
	public void update(Domain domain) throws ProjectException;
	
	/**
	 * @author wangjian
	 * @time 2009-11-5 上午09:22:09
	 * @description findById
	 * @param domain
	 * @throws ProjectException
	 */
	public Domain findById(Domain domain) throws ProjectException;
	
	public Domain findByName(String name) throws ProjectException;
}
