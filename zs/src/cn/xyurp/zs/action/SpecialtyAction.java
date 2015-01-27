package cn.xyurp.zs.action;

import cn.xyurp.system.action.BaseAction;
import cn.xyurp.system.service.AbstractDao;
import cn.xyurp.system.util.MyConstants;
import cn.xyurp.zs.bean.Specialty;
import cn.xyurp.zs.service.SpecialtyService;

public class SpecialtyAction extends BaseAction {
	private static final long serialVersionUID = 1L;
	private Specialty specialty;
	private AbstractDao abstractDao;
	
	private SpecialtyService specialtyService;
	
	public Specialty getSpecialty() {
		return specialty;
	}
	public void setSpecialty(Specialty specialty) {
		this.specialty = specialty;
	}
	public AbstractDao getAbstractDao() {
		return abstractDao;
	}
	public void setAbstractDao(AbstractDao abstractDao) {
		this.abstractDao = abstractDao;
	}
	public void setSpecialtyService(SpecialtyService specialtyService) {
		this.specialtyService = specialtyService;
	}
	
	public String toAdd() throws Exception{
		return SUCCESS;
	}
	
	public String add() throws Exception{
		specialtyService.add(specialty);
		return SUCCESS;
	}
	
	public String update() throws Exception{
		specialtyService.update(specialty);
		return SUCCESS;
	}
	
	public String del() throws Exception{
		specialtyService.del(getRequest().getParameterValues("ids"));
		return SUCCESS;
	}
	
	public String show() throws Exception{
		Specialty s = specialtyService.find(specialty.getId());
		getRequest().setAttribute("specialty", s);
		return SUCCESS;
	}
	
	public String getList() throws Exception{
		StringBuffer hql = new StringBuffer();
		hql.append("from Specialty as s where 1=1");
		
		if(specialty!=null&&!"".equals(specialty.getName())){
			hql.append(" and s.name like '%");
			hql.append(MyConstants.vd(specialty.getName().trim()));
			hql.append("%'");
			specialty.setName(MyConstants.vd(specialty.getName().trim()));
		}
		getRequest().setAttribute("page", abstractDao.searchPaginated(hql.toString()));
		getRequest().setAttribute("specialty",specialty);
		return SUCCESS;
	}
}
