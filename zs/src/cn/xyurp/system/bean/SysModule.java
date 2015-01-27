package cn.xyurp.system.bean;

import java.util.Set;


/**
 * @author lichao
 * @time Oct 30, 2009 10:46:32 AM
 * @description 模块管理实体类
 */
public class SysModule {
    /**
     * 主键
     */
    private int id;
    /**
     * 唯一标示
     */
    private String sn;
    /**
     * 模块名称
     */
    private String sysModuleName;
    /**
     * 模块地址
     */
    private String sysUrl;
    /**
     * 同一层次上各个模块之间的排序号
     */
    private int orderId;

    /**
     * 是否叶子节点
     */
    private int isLeaf;
    /**
     * 所在层次
     */
    private String sysLevel;

    /**
     * 备注
     */
    private String remark;

    /**
     * 孩子模块
     */
    private Set<SysModule> childModules;
    /**
     * 上级模块
     */
    private SysModule parentModule;


    public int getId() {
	return id;
    }

    public void setId(int id) {
	this.id = id;
    }

    public String getSysModuleName() {
	return sysModuleName;
    }

    public void setSysModuleName(String sysModuleName) {
	this.sysModuleName = sysModuleName;
    }

    public String getSysUrl() {
	return sysUrl;
    }

    public void setSysUrl(String sysUrl) {
	this.sysUrl = sysUrl;
    }

    public int getOrderId() {
	return orderId;
    }

    public void setOrderId(int orderId) {
	this.orderId = orderId;
    }

    public int getIsLeaf() {
	return isLeaf;
    }

    public void setIsLeaf(int isLeaf) {
	this.isLeaf = isLeaf;
    }

    public String getSysLevel() {
	return sysLevel;
    }

    public void setSysLevel(String sysLevel) {
	this.sysLevel = sysLevel;
    }

    public String getRemark() {
	return remark;
    }

    public void setRemark(String remark) {
	this.remark = remark;
    }

    public Set<SysModule> getChildModules() {
	return childModules;
    }

    public void setChildModules(Set<SysModule> childModules) {
	this.childModules = childModules;
    }

    public SysModule getParentModule() {
	return parentModule;
    }

    public void setParentModule(SysModule parentModule) {
	this.parentModule = parentModule;
    }

    public String getSn() {
	return sn;
    }

    public void setSn(String sn) {
	this.sn = sn;
    }




}
