package cn.xyurp.system.service;
import cn.xyurp.system.bean.SysUser;
/**
 * @author lichao
 * @time Nov 2, 2009 11:11:03 AM
 * @description 用户管理模块业务逻辑层接口
 */
public interface SysUserService {
    /**
     * 添加一个用户对象     * @param sysUser
     */
    public void addUser(SysUser sysUser);

    /**
     * 删除一个用户对象     * @param ids
     */
    public void delUser(String[] ids);

    /**
     * 更新一个用户对象     * @param sysUser
     */
    public void updateUser(SysUser sysUser);
    
    /**
     * @author mazhe 
     * @time 2009-11-19 下午03:44:12
     * @description 修改用户密码
     * @param sysUser
     */
    public void updateUserMM(SysUser sysUser);

    /**
     * 根据用户Id查找一个用户对象     * @param userId
     * @return
     */
    public SysUser findUser(int userId);
    public SysUser findUserAccount(String account);
    /**
     * 用户登录
     * @param account
     * @param password
     * @return
     */
    public SysUser login(String account, String password);

    /**
     * 在用户和角色之间建立关联
     * @param sysUserId
     * @param sysRoleId
     * @param priority
     */
    public void addOrUpdateUserRole(int sysUserId, int sysRoleId, int priority);
}
