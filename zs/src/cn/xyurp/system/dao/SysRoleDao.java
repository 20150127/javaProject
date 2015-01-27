package cn.xyurp.system.dao;

import java.util.List;

import cn.xyurp.system.bean.SysRole;
import cn.xyurp.system.bean.UsersRoles;

public interface SysRoleDao {
    public void addSysRole(SysRole sysRole);
    public void delSysRole(SysRole sysRole);
    public void updateSysRole(SysRole sysRole);
    public SysRole findSysRole(int sysRoleId);
    public SysRole findRole(String roleName); 
    public List<UsersRoles> searchRolesOfUser(SysRole sysRole);
    public void delUserRole(int userRoleId);
}
