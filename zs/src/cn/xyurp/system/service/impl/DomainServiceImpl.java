package cn.xyurp.system.service.impl;


import cn.xyurp.system.bean.Domain;
import cn.xyurp.system.dao.CommonDao;
import cn.xyurp.system.service.DomainService;
import cn.xyurp.system.util.ProjectException;

public class DomainServiceImpl implements DomainService {

	private CommonDao commonDao;
	
	public void setCommonDao(CommonDao commonDao) {
		this.commonDao = commonDao;
	}

	public void add(Domain domain) throws ProjectException {
		commonDao.add(domain);
	}

	

	public Domain findById(Domain domain) throws ProjectException {
		Domain tmp = (Domain) commonDao.load(Domain.class, domain.getId());
		return tmp;
	}

	public void update(Domain domain) throws ProjectException {
		Domain tmp = (Domain) commonDao.load(Domain.class, domain.getId());
		if(tmp != null) {
			tmp.setDomainName(domain.getDomainName());
			tmp.setRemark(domain.getRemark());
			commonDao.update(tmp);
		} else {
			throw new ProjectException("操作错误：集合域不存在，修改错误！");
		}
	}

	public Domain findByName(String name) throws ProjectException {
	    Domain domain=(Domain) commonDao.findObject("from Domain as d where d.domainName='"+name+"'");
	    return domain;
	}


}
