package cn.xyurp.system.bean;

public class SysACL {
    public static final String TYPE_ROLE = "Role";
    public static final String TYPE_USER = "User";
    /**
     * 主键
     */
    private int id;
    /**
     * 主体类型
     */
    private String principalType;
    /**
     * 主体标示
     */
    private int principalId;
    /**
     * 有效/无效
     */
    private int aclState;
    /**
     * 有效/无效
     */
    private int aclTriState;
    /**
     * 模块标示
     */
    private int sysModuleId;
    /**
     * ACL的状态为继承（即无效，判断的时�?�应该判断其�?属角色的授权�?

     */
    public static final int ACL_TRI_STATE_EXTENDS = 0xFFFFFFFF;
    /**
     * ACL的状态为不继承（即有效，判断的时候，直接根据aclState判断授权�?

     */
    public static final int ACL_TRI_STATE_UNEXTENDS = 0;
    /**
     * 授权允许
     */
    public static final int ACL_YES = 1;
    /**
     * 授权不允许
     */
    public static final int ACL_NO = 0;
    /**
     * 授权不确定
     */
    public static final int ACL_NEUTRAL = -1;
    public int getId() {
        return id;
    }
    public void setId(int id) {
        this.id = id;
    }
    public String getPrincipalType() {
        return principalType;
    }
    public void setPrincipalType(String principalType) {
        this.principalType = principalType;
    }
    public int getPrincipalId() {
        return principalId;
    }
    public void setPrincipalId(int principalId) {
        this.principalId = principalId;
    }
    public int getAclState() {
        return aclState;
    }
    public void setAclState(int aclState) {
        this.aclState = aclState;
    }
    public int getAclTriState() {
        return aclTriState;
    }
    public void setAclTriState(int aclTriState) {
        this.aclTriState = aclTriState;
    }
    public void setPermission(int permission,boolean yes){
	int temp = 1;
	temp = temp << permission;
	if(yes){
		aclState |= temp;
	}else{
		aclState &= ~temp;
	}
}

public int getPermission(int permission){
	if(aclTriState == ACL_TRI_STATE_EXTENDS){
		return ACL_NEUTRAL;
	}
	
	int temp = 1;
	temp = temp << permission;
	temp &= aclState;
	if(temp != 0){
		return ACL_YES;
	}
	return ACL_NO;
}

/**
 * 设置ACL的继承状�?

 * @param yes true标识继承，false表示不继�?

 */
public void setExtends(boolean yes){
	if(yes){
		aclTriState = ACL_TRI_STATE_EXTENDS;
	}else{
		aclTriState = ACL_TRI_STATE_UNEXTENDS;
	}
}
public int getSysModuleId() {
    return sysModuleId;
}
public void setSysModuleId(int sysModuleId) {
    this.sysModuleId = sysModuleId;
}

}
