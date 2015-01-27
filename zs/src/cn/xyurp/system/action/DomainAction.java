package cn.xyurp.system.action;

import cn.xyurp.system.bean.Domain;
import cn.xyurp.system.bean.DomainValue;
import cn.xyurp.system.service.AbstractDao;
import cn.xyurp.system.service.DomainService;
import cn.xyurp.system.service.DomainValueService;

/**
 * @author wangjian
 * @time 2009-11-5 上午10:15:08
 * @description 对域名和域值的操作
 */
public class DomainAction extends BaseAction {
	private static final long serialVersionUID = -2535900485218303629L;
	
	private Domain  domain;
	private DomainValue domainValue;
	private AbstractDao abstractDao;
	private DomainService domainService;
	private DomainValueService domainValueService;
	public Domain getDomain() {
		return domain;
	}
	public void setDomain(Domain domain) {
		this.domain = domain;
	}
	public DomainValue getDomainValue() {
		return domainValue;
	}
	public void setDomainValue(DomainValue domainValue) {
		this.domainValue = domainValue;
	}
	public void setAbstractDao(AbstractDao abstractDao) {
		this.abstractDao = abstractDao;
	}
	public void setDomainService(DomainService domainService) {
		this.domainService = domainService;
	}
	public void setDomainValueService(DomainValueService domainValueService) {
		this.domainValueService = domainValueService;
	}
	
	/**
	 * @author wangjian
	 * @time 2009-11-5 上午10:59:36
	 * @description 集合域列表页面
	 * @return
	 * @throws Exception
	 */
	public String getDomainList() throws Exception {
		StringBuffer hql = new StringBuffer();
		hql = hql.append("from Domain as d where 1=1");
		if(domain !=null && !"".equals(domain.getDomainName())){
			hql.append(" and d.domainName like '%");
			hql.append(domain.getDomainName().trim());
			hql.append("%'");
		}
		getRequest().setAttribute("page", abstractDao.searchPaginated(hql.toString()));
		getRequest().setAttribute("domain", domain);
		return SUCCESS;
	}
	
	/**
	 * @author wangjian
	 * @time 2009-11-5 下午01:07:11
	 * @description domain_list.jsp中点击domainName查看domain
	 * @return
	 * @throws Exception
	 */
	public String showDomain() throws Exception {
		getRequest().setAttribute("domain", domainService.findById(domain));
		return SUCCESS;
	}
	
	/**
	 * @author wangjian
	 * @time 2009-11-5 下午01:07:45
	 * @description domain_list.jsp中点查看域值
	 * @return
	 * @throws Exception
	 */
	public String listValue() throws Exception {
		getRequest().setAttribute("domain", domainService.findById(domain));
		return SUCCESS;
	}
	
	/**
	 * @author wangjian
	 * @time 2009-11-5 下午01:08:27
	 * @description 跳转到添加域值页
	 * @return
	 * @throws Exception
	 */
	public String toAddValue() throws Exception {
		getRequest().setAttribute("domain", domainService.findById(domain));
		return SUCCESS;
	}
	
	/**
	 * @author wangjian
	 * @time 2009-11-5 下午01:25:21
	 * @description 添加域值
	 * @return
	 * @throws Exception
	 */
	public String addValue() throws Exception {
		domainValueService.add(domainValue);
		return SUCCESS;
	}
	
	
	
	public String toUpdateValue() throws Exception {
		getRequest().setAttribute("domainValue", domainValueService.findById(domainValue));
		return SUCCESS;
	}
	
	public String updateValue() throws Exception {
		domainValueService.update(domainValue);
		return SUCCESS;
	}
}
