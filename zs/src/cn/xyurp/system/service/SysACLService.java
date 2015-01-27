package cn.xyurp.system.service;



import java.util.List;

import cn.xyurp.system.bean.SysACL;
import cn.xyurp.system.bean.SysModule;


/**
 * @author lichao
 * @time Nov 6, 2009 10:51:39 AM
 * @description ACL控制访问模块业务逻辑层实现	
 */
public interface SysACLService {
    /**
	 * 添加授权
	 * @param principalType
	 * @param principalId
	 * @param moduleId
	 * @param permission
	 * @param yes
	 */
	public void addOrUpdatePermission(String principalType,
			int principalId,int moduleId,
			int permission,boolean yes);
	
	/**
	 * 删除授权
	 * @param principalType
	 * @param principalId
	 * @param moduleId
	 */
	public void delPermission(String principalType,int principalId,int sysModuleId);
	
	/**
	 * 设置aclTriState的值
	 * @param sysUserId 
	 * @param sysModuleId 
	 * @param yes
	 */
	public void addOrUpdateUserExtends(int sysUserId,int sysModuleId,boolean yes);
	
	/**
	 * 即时认证，判断某个用户是否拥有对某个模块的某个操作的权限
	 * @param sysUserId 
	 * @param sysModuleId
	 * @param permission
	 * @return 允许或不允许
	 */
	public boolean hasPermission(int sysUserId,int sysModuleId,int permission);
	
	/**
	 * 判断用户对某模块的某操作的授权（允许或不允许）
	 * @param sysUserId
	 * @param sn
	 * @param permission
	 * @return 允许或不允许
	 */
	public boolean hasPermissionBySn(int sysUserId,String sn,int permission);	
	
	/**
	 * 查询用户拥有读取权限的模块列表
	 * @param sysUserId
	 * @return SysModule
	 */
	public List<SysModule> searchModules(int topid,int sysUserId);
	
	public List<SysACL> searchAclRecord(String principalType,int principalId);
}
