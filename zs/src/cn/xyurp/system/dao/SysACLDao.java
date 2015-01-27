package cn.xyurp.system.dao;

import java.util.List;

import cn.xyurp.system.bean.SysACL;
import cn.xyurp.system.bean.SysModule;

public interface SysACLDao {

    public void addOrUpdatePermission(String principalType, int principalId,
	    int moduleId, int permission, boolean yes);

    public void delPermission(String principalType, int principalId,
	    int sysModuleId);

    public void delPermission(String principalType, int principalId);

    public void addOrUpdateUserExtends(int sysUserId, int sysModuleId,
	    boolean yes);

    public boolean hasPermission(int sysUserId, int sysModuleId, int permission);

    public boolean hasPermissionBySn(int sysUserId, String sn, int permission);

    public List<SysModule> searchModules(int topid, int sysUserId);

    public List<SysACL> searchAclRecord(String principalType, int principalId);
}
