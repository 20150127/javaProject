package cn.xyurp.system.dao;

import java.util.List;

import cn.xyurp.system.bean.SysUser;
import cn.xyurp.system.bean.UsersRoles;

public interface SysUserDao {
    public void addUser(SysUser sysUser);
    public void updateUser(SysUser sysUser);
    public void updateUserMM(SysUser sysUser);
    public void delUser(SysUser sysUser);
    public SysUser findUser(int sysUserId);
    public SysUser findUser(String account);
    public void addOrUpdateUserRole(int sysUserId, int sysRoleId, int priority);
    public void delUserRole(int sysUserId, int sysRoleId);
    public SysUser login(String userName, String password);
    public List<SysUser> searchUsersOfRole(String roleName);
    public List<UsersRoles> searchRolesOfUser(SysUser sysUser);

}
