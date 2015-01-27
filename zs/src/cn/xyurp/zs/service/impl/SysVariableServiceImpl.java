package cn.xyurp.zs.service.impl;

import cn.xyurp.system.dao.CommonDao;
import cn.xyurp.system.util.ProjectException;
import cn.xyurp.zs.bean.SysVariable;
import cn.xyurp.zs.service.SysVariableService;

public class SysVariableServiceImpl implements SysVariableService {

	private CommonDao commonDao;
	
	public void setCommonDao(CommonDao commonDao) {
		this.commonDao = commonDao;
	}
	
	
	/* (non-Javadoc)
	 * @see cn.xyurp.zs.service.impl.SysVariableService#update(cn.xyurp.zs.bean.SysVariable)
	 */
	public void update(SysVariable sv) throws ProjectException{
		SysVariable temp = (SysVariable) commonDao.load(SysVariable.class, sv.getId());
		if(temp != null){
			temp.setAdmissionHead(sv.getAdmissionHead());
			temp.setAdmissionTitle(sv.getAdmissionTitle());
			temp.setExamDate(sv.getExamDate());
			temp.setIssueDate(sv.getIssueDate());
			temp.setPcount(sv.getPcount());
			temp.setRegisterDate(sv.getRegisterDate());
			temp.setRegisterTitle(sv.getRegisterTitle());
			temp.setRetestsAddress(sv.getRetestsAddress());
			temp.setRetestsDate(sv.getRetestsDate());
			temp.setRoomId(sv.getRoomId());
			temp.setRoomNum(sv.getRoomNum());
			temp.setIfLogin(sv.getIfLogin());
			temp.setIfPreliminary(sv.getIfPreliminary());
			temp.setIfReg(sv.getIfReg());
			temp.setIfRetrial(sv.getIfRetrial());
			commonDao.update(temp);
		}else{
			throw new ProjectException("您试图修改一个数据库中不存在的记录！");
		}
	}
	
	/* (non-Javadoc)
	 * @see cn.xyurp.zs.service.impl.SysVariableService#find(cn.xyurp.zs.bean.SysVariable)
	 */
	public SysVariable find(Integer id) throws ProjectException{
		return (SysVariable) commonDao.load(SysVariable.class, id);
	}


	public SysVariable get(Integer id) throws ProjectException {
		return (SysVariable) commonDao.get(SysVariable.class, id);
	}
	
}
