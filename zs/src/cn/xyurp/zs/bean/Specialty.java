package cn.xyurp.zs.bean;


import java.util.Set;

import cn.xyurp.system.bean.SysUser;

public class Specialty {
	private int id;//主键
	private String code;//专业编码
	private String name;//专业名称
	
	private long bkrs;
	private long fzrs;
	private long lqrs;
	
	private Set<SysUser> sysUser;
	public Specialty(){
	    
	}
	public Specialty(String name, long bkrs, long fzrs, long lqrs) {
	    super();
	    this.name = name;
	    this.bkrs = bkrs;
	    this.fzrs = fzrs;
	    this.lqrs = lqrs;
	}
	public Set<SysUser> getSysUser() {
	    return sysUser;
	}
	public void setSysUser(Set<SysUser> sysUser) {
	    this.sysUser = sysUser;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public long getBkrs() {
	    return bkrs;
	}
	public void setBkrs(long bkrs) {
	    this.bkrs = bkrs;
	}
	public long getFzrs() {
	    return fzrs;
	}
	public void setFzrs(long fzrs) {
	    this.fzrs = fzrs;
	}
	public long getLqrs() {
	    return lqrs;
	}
	public void setLqrs(long lqrs) {
	    this.lqrs = lqrs;
	}
}
