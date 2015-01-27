package cn.xyurp.system.service.impl;

import java.util.List;

import cn.xyurp.system.bean.SysACL;
import cn.xyurp.system.bean.SysModule;
import cn.xyurp.system.dao.SysACLDao;
import cn.xyurp.system.service.SysACLService;
import cn.xyurp.system.util.ProjectException;

/**
 * @author lichao
 * @time Nov 6, 2009 10:51:39 AM
 * @description ACL控制访问模块业务逻辑层实	
 */
public class SysACLServiceImpl  implements SysACLService{
    private SysACLDao sysACLDao;
    
    public void setSysACLDao(SysACLDao sysACLDao) {
        this.sysACLDao = sysACLDao;
    }

    public void addOrUpdatePermission(String principalType, int principalId,
	    int moduleId, int permission, boolean yes) {
    	sysACLDao.addOrUpdatePermission(principalType, principalId, moduleId, permission, yes);
    }

    public void addOrUpdateUserExtends(int sysUserId, int sysModuleId,
	    boolean yes) {
    	sysACLDao.addOrUpdateUserExtends(sysUserId, sysModuleId, yes);
    }

    public void delPermission(String principalType, int principalId,
	    int sysModuleId) {
    	sysACLDao.delPermission(principalType, principalId, sysModuleId);

    }

    public boolean hasPermission(int sysUserId, int sysModuleId, int permission) {
    	
    	return sysACLDao.hasPermission(sysUserId, sysModuleId, permission);
    }

    public boolean hasPermissionBySn(int sysUserId, String sn, int permission) {
	
	return sysACLDao.hasPermissionBySn(sysUserId, sn, permission);
    }

    public List<SysACL> searchAclRecord(String principalType, int principalId) {
    	return sysACLDao.searchAclRecord(principalType, principalId);
    }

    public List<SysModule> searchModules(int topid, int sysUserId) {
	List<SysModule> list=sysACLDao.searchModules(topid, sysUserId);
	if(list.size()<0){
	    throw new ProjectException("您没有权限访问该列表！");
	}
	return list;
    }


}
