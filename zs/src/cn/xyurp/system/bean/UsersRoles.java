package cn.xyurp.system.bean;

/**
 * @author lichao
 * @time Oct 30, 2009 10:58:37 AM
 * @description 用户和角色的关联实体�?	
 */
public class UsersRoles {
    /**
     * 主键
     */
    private int id;
    /**
     * 角色对象
     */
    private SysRole sysRoles;
    /**
     * 用户
     */
    private SysUser sysUsers;
    /**
     * 优先�?

     */
    private int priority;

    public int getId() {
	return id;
    }

    public void setId(int id) {
	this.id = id;
    }

    public SysRole getSysRoles() {
	return sysRoles;
    }

    public void setSysRoles(SysRole sysRoles) {
	this.sysRoles = sysRoles;
    }



    public SysUser getSysUsers() {
        return sysUsers;
    }

    public void setSysUsers(SysUser sysUsers) {
        this.sysUsers = sysUsers;
    }

    public int getPriority() {
        return priority;
    }

    public void setPriority(int priority) {
        this.priority = priority;
    }

}
