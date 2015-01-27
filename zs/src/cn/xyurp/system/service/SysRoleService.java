package cn.xyurp.system.service;

import cn.xyurp.system.bean.SysRole;

/**
 * @author lichao
 * @time Nov 2, 2009 11:10:31 AM
 * @description 角色管理模块业务逻辑层接口
 * 
 */
public interface SysRoleService {
    /**
     * 添加一个角色对象
     * @param sysRole
     */
    public void addRole(SysRole sysRole);

    /**
     * 删除一个角色对象
     * @param ids
     */
    public void delRole(String[] ids);

    /**
     * 更新一个角色对象
     * @param sysRole
     */
    public void updateRole(SysRole sysRole);

    /**
     * 查找一个角色对象
     * @param roleId
     * @return
     */
    public SysRole findRole(int roleId);

    public SysRole findRoleName(String roleName);

    /**
     * 删除用户和角色关联
     * @param ids
     */
    public void delUserRole(String[] ids);

}
