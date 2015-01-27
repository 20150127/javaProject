package cn.xyurp.system.service.impl;

import java.util.List;

import cn.xyurp.system.bean.Domain;
import cn.xyurp.system.bean.DomainValue;
import cn.xyurp.system.dao.CommonDao;
import cn.xyurp.system.service.DomainValueService;
import cn.xyurp.system.util.ProjectException;

public class DomainValueServiceImpl implements DomainValueService {
	private CommonDao commonDao;
	
	public void setCommonDao(CommonDao commonDao) {
		this.commonDao = commonDao;
	}
	public void add(DomainValue domainValue) throws ProjectException {
		commonDao.add(domainValue);
	}

	@SuppressWarnings("unchecked")
	public List<DomainValue> findByDomainId(DomainValue domainValue)
			throws ProjectException {
		return commonDao.findList("from DomainValue as d where d.domain.id=?", domainValue.getDomain().getId());
	}

	public DomainValue findById(DomainValue domainValue)
			throws ProjectException {
		DomainValue tmp = (DomainValue) commonDao.load(DomainValue.class, domainValue.getId());
		return tmp;
	}

	public void update(DomainValue domainValue) throws ProjectException {
		DomainValue tmp = (DomainValue) commonDao.load(DomainValue.class, domainValue.getId());
		if(tmp != null) {
			tmp.setValueName(domainValue.getValueName());
			tmp.setRemark(domainValue.getRemark());
			tmp.setDomain((Domain) commonDao.load(Domain.class, domainValue.getDomain().getId()));
			commonDao.update(tmp);
		} else {
			throw new ProjectException("操作错误：域值不存在，修改错误！");
		}
	}
	public DomainValue findById(String id) throws ProjectException {
		DomainValue tmp = (DomainValue) commonDao.load(DomainValue.class,Integer.parseInt(id));
		return tmp;
	}
	@SuppressWarnings("unchecked")
	public List<DomainValue> findByDomainName(String name)
			throws ProjectException {
		String hql = "from DomainValue d where d.domain.domainName='"+name+"'";
		List<DomainValue> ll = commonDao.findList(hql);
		return ll;
	}

}
