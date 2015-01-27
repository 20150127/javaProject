package cn.xyurp.system.bean;



/**
 * @author lichao
 * @time Oct 30, 2009 10:34:43 AM
 * @description 角色管理实体�?

 */
public class SysRole {

    /**
     * 主键
     */
    private int id;
    /**
     * 角色名称
     */
    private String roleName;
    /**
     * 备注
     */
    private String remark;
 

    public int getId() {
	return id;
    }

    public void setId(int id) {
	this.id = id;
    }

    public String getRoleName() {
	return roleName;
    }

    public void setRoleName(String roleName) {
	this.roleName = roleName;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }

    public String getRemark() {
	return remark;
    }

}
