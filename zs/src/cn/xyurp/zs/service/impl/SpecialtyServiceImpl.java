package cn.xyurp.zs.service.impl;

import java.util.List;

import cn.xyurp.system.dao.CommonDao;
import cn.xyurp.system.util.ProjectException;
import cn.xyurp.zs.bean.Score;
import cn.xyurp.zs.bean.Specialty;
import cn.xyurp.zs.service.SpecialtyService;

public class SpecialtyServiceImpl implements SpecialtyService {
	private CommonDao commonDao;

	public void setCommonDao(CommonDao commonDao) {
		this.commonDao = commonDao;
	}
	
	
	
	public void add(Specialty specialty) throws ProjectException{
		if(specialty!=null){
			commonDao.add(specialty);
		}else{
			throw new ProjectException("操作错误：试图添加一个不存在的对象");
		}
	}
	
	public void update(Specialty specialty) throws ProjectException{
		Specialty tmp = (Specialty)commonDao.load(Specialty.class, specialty.getId());
		if(tmp!=null){
			tmp.setCode(specialty.getCode());
			tmp.setName(specialty.getName());
			commonDao.update(tmp);
		}else{
			throw new ProjectException("操作错误：试图修改一个不存在的对象");
		}
	}
	
	@SuppressWarnings("unchecked")
	public void del(String[] ids) throws ProjectException{
		StringBuffer sb = new StringBuffer();
		if(ids!=null){
			for (String string : ids) {
				String hql = "from Score as s where s.specialtyId.id ="+Integer.parseInt(string);
				List<Score> ls = commonDao.findList(hql);
				if(ls.size()>0){
					Specialty ssss=(Specialty)commonDao.load(Specialty.class, Integer.parseInt(string));
					String name = ssss.getName();
					sb.append(name+"专业与考生存在关联，无法删除！");
				}
			}
			if(sb.length()>0){
				throw new ProjectException(sb.toString());
			}else{
				for (String string : ids){
					Specialty temp = (Specialty)commonDao.load(Specialty.class, Integer.parseInt(string));
					
					if(temp != null) {
						commonDao.del(temp);
					} else {
						throw new ProjectException("操作错误：试图删除不存在的对象！");
					}
				}
			}
		}
	}
	
	public Specialty find(int id) throws ProjectException{
		Specialty tmp = (Specialty)commonDao.load(Specialty.class, id);
		if(tmp==null){
			throw new ProjectException("您查找的专业不存在！");
		}
		return tmp;
	}
	
	public Specialty findBycodeAndId(String code,int id){
		StringBuffer hql = new StringBuffer();
		hql.append("from Specialty s where 1=1");
		if(code!=null&&!"".equals(code)){
			hql.append(" and s.code ='");
			hql.append(code);
			hql.append("'");
		}
		if(id!=0){
			hql.append(" and s.id <>");
			hql.append(id);
		}
		Specialty tmp = (Specialty)commonDao.findObject(hql.toString());
		return tmp;
	}
	
	@SuppressWarnings("unchecked")
	public List<Specialty> findAll() throws ProjectException{
		List<Specialty> tmp = commonDao.findList("from Specialty as s");
		if(tmp==null){
			throw new ProjectException("您查找的专业不存在！");
		}
		return tmp;
	}
	
}
