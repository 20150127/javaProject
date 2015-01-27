package cn.xyurp.system.service;

import java.util.List;

import cn.xyurp.system.bean.DomainValue;
import cn.xyurp.system.util.ProjectException;

/**
 * @author wangjian
 * @time 2009-11-5 上午09:19:31
 * @description 域值管理
 */
public interface DomainValueService {

	/**
	 * @author wangjian
	 * @time 2009-11-5 上午09:30:04
	 * @description
	 * @param domainValue
	 * @throws ProjectException
	 */
	public void add(DomainValue domainValue) throws ProjectException;
	
	/**
	 * @author wangjian
	 * @time 2009-11-5 上午09:30:09
	 * @description
	 * @param domainValue
	 * @throws ProjectException
	 */
	public void update(DomainValue domainValue) throws ProjectException;
	
	/**
	 * @author wangjian
	 * @time 2009-11-5 上午09:30:11
	 * @description 根据id查找对象
	 * @param domainValue
	 * @return
	 * @throws ProjectException
	 */
	public DomainValue findById(DomainValue domainValue) throws ProjectException;
	public DomainValue findById(String id) throws ProjectException;
	/**
	 * @author wangjian
	 * @time 2009-11-5 上午09:30:14
	 * @description
	 * @param domainValue
	 * @return
	 * @throws ProjectException
	 */
	public List<DomainValue> findByDomainId(DomainValue domainValue) throws ProjectException;
	public List<DomainValue> findByDomainName(String name) throws ProjectException;
}
